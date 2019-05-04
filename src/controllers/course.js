const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
const urltool = require(path.join(__dirname, '../utils/urltool.js'))
const timetool = require(path.join(__dirname, '../utils/timetool.js'))

// 获取课程列表
exports.getCourseList = async (req, res) => {
  // 查询sql
  const selectSql = 'select * from t_course where status = 1 and is_recommend = 0'

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

// 根据名字获取课程列表
exports.getCourseListByName = async (req, res) => {
  if (!req.query.name){
    res.json({
      status:1,
      message:'课程名称不能为空'
    })
    return
  }

  // 查询关键字
  const keyword = req.query.name || ''

  // 查询sql
  const selectSql = `select * from t_course where title like('%${keyword}%') and status = 1 and is_recommend = 0`

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
 * 根据id查询课程信息
 */
exports.getCourseById = async (req,res) => {
  if (!req.params.id) {
    res.json({
      status:1,
      message:'id不能为空'
    })
    return
  }

  // 定义返回对象
  const result = {
    status:0,
    message:{
      course:null, // 课程
      videos:null, // 课程的视频列表
      lecturer:null, // 课程讲师信息
      comments:null, // 课程的评论列表
    }
  }

  // 查询课程sql
  const selectCourseSql = `select * from t_course where id=${req.params.id} and status = 1`
  const res1 = await db.execPromise(selectCourseSql)
  if (res1 && res1.length > 0) {
    res1[0].icon = urltool.stitchingStaticPath(res1[0].icon)
    res1[0].cover_image_url = urltool.stitchingStaticPath(res1[0].cover_image_url)
    result.message.course = res1[0]
  }

  // 查询视频sql
  const selectVideoSql = `select * from t_video where course_id=${req.params.id} and status = 1`
  const res2 = await db.execPromise(selectVideoSql)
  if (res2 && res2.length > 0){
    res2.forEach(item => {
      item.cover_photo_url = urltool.stitchingStaticPath(item.cover_photo_url)
    })
    result.message.videos = res2
  }

  // 查询讲师sql
  const selectLecturerSql = `select * from t_lecturer where course_id = ${req.params.id} and status = 1`
  const res3 = await db.execPromise(selectLecturerSql)
  if (res3 && res3.length > 0){
    res3[0].avatar = urltool.stitchingStaticPath(res3[0].avatar)
    result.message.lecturer = res3[0]
  }

  // 查看评论url
  const selectCommentSql = `select * from t_comment c left join t_user u on c.uid = u.id and c.course_id = ${req.params.id} and c.status = 1`
  const res4 = await db.execPromise(selectCommentSql)
  if (res4 && res4.length > 0){
    res4.forEach(item => {
      item.avatar = urltool.stitchingStaticPath(item.avatar)
    })
    result.message.comments = res4
  }

  res.send(result)
}

/**
 * 根据课程id查询课程播放信息
 */
exports.getCoursePlayById = async (req,res) => {
  if (!req.params.id) {
    res.json({
      status:1,
      message:'id不能为空'
    })
    return
  }

  // 定义返回对象
  const result = {
    status:0,
    message:{
      course:null, // 课程
      videos:null // 课程的视频列表
    }
  }

  // 查询课程sql
  const selectCourseSql = `select * from t_course where id=${req.params.id} and status = 1`
  const res1 = await db.execPromise(selectCourseSql)
  if (res1 && res1.length > 0) {
    res1[0].icon = urltool.stitchingStaticPath(res1[0].icon)
    res1[0].cover_image_url = urltool.stitchingStaticPath(res1[0].cover_image_url)
    result.message.course = res1[0]
  }

  // 查询视频sql
  const selectVideoSql = `select * from t_video where course_id=${req.params.id} and status = 1`
  const res2 = await db.execPromise(selectVideoSql)
  if (res2 && res2.length > 0){
    res2.forEach(item => {
      item.cover_photo_url = urltool.stitchingStaticPath(item.cover_photo_url)
      item.duration = timetool.secondsConvertMinute(item.duration)
    })
    result.message.videos = res2
  }

  res.send(result)
}
