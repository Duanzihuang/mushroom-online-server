const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))

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
