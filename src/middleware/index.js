// 需要排除检测的url地址
const excludeValidateAppKeyUrl = ['/api/appkey']

// 需要排除检测的方法
const needExcludeValidateAppKeyUrl = req => {
  if (excludeValidateAppKeyUrl.includes(req.url)) {
    return true
  } else {
    return false
  }
}

/**
 * 验证AppKey
 */
exports.validateAppKey = (req, res, next) => {
  if (!req.headers.appkey && !needExcludeValidateAppKeyUrl(req)) {
    res.json({
      code: 401,
      message: 'appkey 不能为空'
    })
    return
  }

  next()
}
