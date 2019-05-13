const path = require('path')
const study = require(path.join(__dirname,'./study.js'))
const db = require(path.join(__dirname, '../db/index.js'))
const moment = require('moment')

/**
 * 点赞
 */
exports.like = async (req, res, next) => {
  if (!req.body.comment_id) {
    return res.send({
      status: 1,
      message: '评论id不能为空'
    })
  }

  if (req.body.is_like == undefined) {
    return res.send({
      status: 2,
      message: '点赞标记不能为空'
    })
  }

  const { comment_id, is_like = 1 } = req.body

  try {
    const res1 = await db.execPromise(
      'update t_comment set is_like = ? where id = ?',
      [is_like, comment_id]
    )
  } catch (error) {
    throw error
  }

  res.send({
    status: 0,
    message: '点赞成功'
  })
}

/**
 * 评价
 */
exports.create = async (req,res,next) => {
  if (!req.query.user_id){
    return res.send({
      status:1,
      message:'用户id不能为空'
    })
  }

  if (!req.body.course_id){
    return res.send({
      status:2,
      message:'课程id不能为空'
    })
  }

  if (!req.body.content){
    return res.send({
      status:3,
      message:'评论内容不能为空'
    })
  }

  if (!req.body.score){
    return res.send({
      status:4,
      message:'分数不能为空'
    })
  }

  // 解构赋值
  const {user_id} = req.query
  const {course_id,score,content} = req.body

  // 查询该用户的这门课程是否学习完毕，如果没有学习完毕，则给出提示
  const study_progress = study.getCourseStudyProgress(user_id,course_id)
  if (study_progress < 99.5){ // 未学习完成
    return res.send({
      status:5,
      message:'需要学习完课程内容才能评价哦~'
    })
  }

  // 插入评论内容
  const res1 = await db.execPromise('insert into t_comment set ?',{
    user_id,
    course_id,
    score,
    content,
    comment_time:moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
  })

  if (res1 && res1.insertId){ // 评价成功
    res.send({
      status:0,
      message:'评价成功'
    })
  } else { // 评价失败
    res.send({
      status:6,
      message:'评价失败'
    })
  }
}