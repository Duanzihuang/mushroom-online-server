const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
const urltool = require(path.join(__dirname,"../utils/urltool.js"))
/**
 * 获取个人学习进度
 */
exports.getStudyProgress = async (req,res) => {
    // 获取用户id
    const user_id = req.query.user_id

    if (!user_id || user_id==='undefined'){
        return res.json({
            status:1,
            message:'user_id有误'
        })
    }

    // 根据id查询学习进度
    const selectSql = `select s.id as sid,s.study_hour,s.total_hour,s.study_progress,c.id as cid,c.title,c.icon from t_study_progress s,t_course c where user_id = ${user_id} and s.course_id = c.id and s.status = 1 and c.status=1`

    const results = await db.execPromise(selectSql)

    // 根据课程id查询总时长

    // 处理图片路径
    results.forEach(item => {
        item.icon = urltool.stitchingStaticPath(item.icon)
    })

    res.json({
        status:0,
        message:results
    })
}

/**
 * 根据用户id和课程id，查询该用户该课程的学习进度
 */
exports.getCourseStudyProgress = async (user_id,course_id) => {
    const res1 = await db.execPromise('select study_progress from t_study_progress where user_id = ? and course_id = ?',[user_id,course_id])

    return res1 && res1[0].study_progress || 0
}

/**
 * 是否完成了某个课程的学习
 */
exports.studyComplete = async (req,res) => {
    if (!req.query.user_id){
        return res.send({
            status:1,
            message:'用户id不能为空'
        })
    }

    if (!req.query.course_id){
        return res.send({
            status:2,
            message:'课程id不能为空'
        })
    }

    const {user_id,course_id} = req.query

    const res1 = await db.execPromise('select study_progress from t_study_progress where user_id = ? and course_id = ?',[user_id,course_id])

    if (res1 && res1.length > 0){
        res.send({
            status:0,
            complete:res1[0].study_progress >= 99.5
        })
    } else {
        res.send({
            status:0,
            complete:false
        })
    }
}

/*
 * 学习课程对应的视频，并且更新学习进度
 */
exports.studyCourseVideo = async (req,res) => {
    if (!req.query.user_id){
        return res.json({
            status:1,
            message:'用户id不能为空'
        })
    }

    if (!req.body.course_id){
        return res.json({
            status:2,
            message:'课程id不能为空'
        })
    }

    if (!req.body.video_id){
        return res.json({
            status:2,
            message:'视频id不能为空'
        })
    }

    const {user_id} = req.query
    const {course_id,video_id} = req.body

    // 先根据用户id 和 视频id 查询是否存在，如果存在则把状态更新为已学习，如果不存在则插入一条已经学习的记录
    const res1 = await db.execPromise('select * from t_study_video where user_id = ? and course_id = ? and video_id = ?',[user_id,course_id,video_id])

    if (res1 && res1.length  > 0){ // 已经存在该视频的学习记录
        const res2 = await db.execPromise('update t_study_video set is_study = 1 where user_id = ? and course_id = ? and video_id = ?',[user_id,course_id,video_id])

        if (res2 && res2.affectedRows >= 1){
            // 更新学习进度
            updateStudyProgress(course_id,user_id)

            res.send({
                status:0,
                message:'学习成功'
            })
        }

    } else {
        const res3 = await db.execPromise('insert into t_study_video set ?',{
            user_id,
            course_id,
            video_id,
            is_study:1
        })

        if (res3 && res3.insertId){ // 插入成功
            // 更新学习进度
            updateStudyProgress(course_id,user_id)

            res.send({
                status:0,
                message:'学习成功'
            })
        }
    }
}

/**
 * 更新学习进度
 */
const updateStudyProgress = async (course_id,user_id) => {
    try {
        //1、查询该课程是否有学习记录，如果没有，则添加一条，如果有，则更新
        const res1 = await db.execPromise(`select * from t_study_progress where user_id = ? and course_id = ? and status = 1`,[user_id,course_id])

        if (res1 && res1.length > 0){ // 该课程已经存在学习记录
            updateStudyProgress2(res1[0].id,course_id,user_id)
        } else { // 该课程没有学习记录
            const res2 = await db.execPromise('select count(*) as total_hour from t_video where course_id = ? and status = 1',[course_id])

            const res3 = await db.execPromise(`insert into t_study_progress set ?`,{
                user_id,
                course_id,
                total_hour:res2[0].total_hour
            })

            if (res3){
                const study_progress_id = res3.insertId

                updateStudyProgress2(study_progress_id,course_id,user_id)
            }
        }
    } catch (error) {
        console.log(error)
    }
}

/**
 * 更新学习进度（包含已学课时和进度）
 * @param {*} study_progress_id 学习id
 * @param {*} course_id 课程id
 */
const updateStudyProgress2 = async (study_progress_id,course_id,user_id) => {
    // 1、根据 user_id 查询出该用户已经学习的视频总的小节数量
    //   根据 course_id 查询该课程视频的总时长
    //   根据 user_id 和 course_id 查询出已经学习的总时长
    try {
        // 该课程已经学习的视频的小节数量
        const res1 = await db.execPromise('select count(*) as study_hour from t_study_video where user_id = ? and course_id = ? and is_study = 1 and status = 1',[user_id,course_id])
        const study_hour = res1[0] && res1[0].study_hour || 0

        // 该课程的总节数
        const res2 = await db.execPromise('select count(*) as total_hour from t_video where course_id = ? and status = 1',[course_id])
        const total_hour = res2[0] && res2[0].total_hour || 0

        // 课程的总时长
        const res3 = await db.execPromise('select course_duration from t_course where id = ? and status = 1',[course_id])

        // 已经学习的视频的总时长
        const res4 = await db.execPromise('select sum(v.duration) as study_duration from t_video v right join t_study_video s on v.id = s.video_id and s.user_id = ? and s.course_id = ? where s.is_study = 1',[user_id,course_id])

        // 计算进度
        const progress = (res4[0].study_duration / res3[0].course_duration).toFixed(2) * 100

        // 更新学习进度
        const res5 = await db.execPromise('update t_study_progress set study_hour = ?,total_hour = ?,study_progress = ? where user_id = ? and course_id = ?',[study_hour,total_hour,progress,user_id,course_id])
    } catch (error) {
        console.log(error)
    }
}
