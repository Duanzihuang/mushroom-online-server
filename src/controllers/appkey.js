/**
 * 返回AppKey
 */
exports.getAppKey = (req, res) => {
  res.send('appkey is xxxx')
}

/**
 * 新增Appkey
 */
exports.addAppKey = (req, res) => {
  if (!req.body.phone) {
    res.json({
      status: 1,
      message: '手机号不能为空'
    })
    return
  }

  res.json({
    meta: {
      status: 0,
      message: '新增AppKey成功'
    },
    message: {
      appkey: 'xxx-xxx-xx'
    }
  })
}
