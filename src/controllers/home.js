const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
const config = require(path.join(__dirname, '../config/global_config.js'))
/**
 * 获取首页轮播图
 */
exports.getSwipers = async (req, res) => {
  // 查询sql
  const selectSql = 'select * from t_carousel'

  const results = await db.execPromise(selectSql)

  // 对图片的img_url进行处理
  results.forEach(item => {
    item.img_url = `${config.api_host}${item.img_url}`
  })

  res.json({
    status: 0,
    message: results
  })
}
