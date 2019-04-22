const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
const urltool = require(path.join(__dirname,"../utils/urltool.js"))
/**
 * 获取个人学习进度
 */
exports.getStudyProgress = async (req,res) => {
    // 获取用户id
    const user_id = req.query.user_id

    // 根据id查询学习进度
    const selectSql = `select s.id as sid,s.study_hour,s.study_progress,c.id as cid,c.title,c.icon,c.class_hour from t_study s,t_course c where user_id = ${user_id} and s.course_id = c.id and s.status = 1 and c.status=1`

    const results = await db.execPromise(selectSql)

    // 处理图片路径
    results.forEach(item => {
        item.icon = urltool.stitchingStaticPath(item.icon)
    })

    res.json({
        status:0,
        message:results
    })
}