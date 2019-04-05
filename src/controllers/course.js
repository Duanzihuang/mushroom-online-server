const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
const config = require(path.join(__dirname, '../config/global_config.js'))

// 获取课程列表
exports.getCourseList = async (req, res) => {
  // 查询sql
  const selectSql = 'select * from t_course'

  const results = await db.execPromise(selectSql)

  // 对图片的icon进行处理
  results.forEach(item => {
    item.icon = `${config.api_host}${item.icon}`
  })

  res.json({
    status: 0,
    message: results
  })
}

// 根据名字获取课程列表
exports.getCourseListByName = async (req, res) => {
  // 查询关键字
  const keyword = req.params.name || ''

  // 查询sql
  const selectSql = `select * from t_course where title like('%${keyword}%')`

  const results = await db.execPromise(selectSql)

  // 对图片的icon进行处理
  results.forEach(item => {
    item.icon = `${config.api_host}${item.icon}`
  })

  res.json({
    status: 0,
    message: results
  })
}
