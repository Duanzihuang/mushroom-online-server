const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
const urltool = require(path.join(__dirname,"../utils/urltool.js"))

/**
 * 获取用户信息
 */
exports.getUserInfo = async (req,res) => {
    // 获取到用户id
    const user_id = req.query.user_id

    // 用户信息对象
    let userInfo = {}

    // 查询用户信息
    const selectUserInfoSQL = `select nickname,avatar,login_type from t_user where id = ${user_id} and status = 1`

    const res1 = await db.execPromise(selectUserInfoSQL)
    if (res1 && res1.length > 0){
        if (res1[0].login_type === 1){ // 手机号登录
            res1[0].avatar = urltool.stitchingStaticPath(res1[0].avatar)
        }
        userInfo = res1[0]
    }

    // 统计累计学习小时
    const selectStudyCountSQL = `select sum(study_hour) as study_hour from t_study_progress where user_id = ${user_id} and status = 1`
    const res2 = await db.execPromise(selectStudyCountSQL)
    if (res2 && res2.length > 0){
        userInfo.study_hour = res2[0].study_hour || 0
    }

    // 统计我的关注
    const selectFollowCountSQL = `select count(*) as follow_count from t_follow where user_id = ${user_id} and status = 1 and is_follow = 1`
    const res3 = await db.execPromise(selectFollowCountSQL)
    if (res3 && res3.length > 0){
        userInfo.follow_count = res3[0].follow_count || 0
    }

    // 统计我的课程
    const selectCourseCountSQL = `select count(*) as course_count from t_study_progress where user_id = ${user_id} and status = 1`
    const res4 = await db.execPromise(selectCourseCountSQL)
    if (res4 && res4.length > 0){
        userInfo.course_count = res4[0].course_count
    }

    res.json({
        status:0,
        message:userInfo
    })
}