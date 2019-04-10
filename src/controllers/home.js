const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
const urltool = require(path.join(__dirname, '../utils/urltool.js'))

/**
 * 获取首页轮播图
 */
exports.getSwipers = async (req, res) => {
  // 查询sql
  const selectSql = 'select * from t_carousel where status = 1'

  const results = await db.execPromise(selectSql)

  // 对图片的img_url进行处理
  results.forEach(item => {
    item.img_url = urltool.stitchingStaticPath(item.img_url)
  })

  res.json({
    status: 0,
    message: results
  })
}

/**
 * 获取首页推荐课程
 */
exports.getRecommendCourse = async (req,res) => {
  // 查询sql
  const selectSql = 'select * from t_course where is_recommend = 1 and status = 1'

  const results = await db.execPromise(selectSql)
  // 对图片的icon进行处理
  results.forEach(item => {
    item.icon = urltool.stitchingStaticPath(item.icon)
  })

  res.json({
    status: 0,
    message: results
  })
}

/**
 * 获取首页热门课程
 */
exports.getHotVideo = async (req,res) => {
   // 查询sql
   const selectSql = 'select * from t_video where is_hot = 1 and status = 1'

   const results = await db.execPromise(selectSql)

   // 对图片的img_url进行处理
   results.forEach(item => {
     item.cover_photo_url = urltool.stitchingStaticPath(item.cover_photo_url)
   })
 
   res.json({
     status: 0,
     message: results
   })
}
