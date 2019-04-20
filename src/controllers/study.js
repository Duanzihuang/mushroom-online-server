const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
/**
 * 获取个人学习进度
 */
exports.getStudyProgress = async (req,res) => {
    // 获取用户id
    const user_id = req.query.user_id

    // 根据id查询学习进度
    const selectSql = `select * from t_study where user_id=${user_id} and status = 1`

    const results = await db.execPromise(selectSql)

    res.json({
        status:0,
        message:results
    })
}