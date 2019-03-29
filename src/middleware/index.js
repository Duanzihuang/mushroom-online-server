// 需要排除检测的url地址
const excludeValidateAppKeyUrl = '/api/appkey'

// 需要排除检测的方法
const needExcludeValidateAppKeyUrl = req => {
  if (req.url.startsWith(excludeValidateAppKeyUrl)) {
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

/**
 * 允许跨域
 */
exports.allowCrossDomain = (req, res, next) => {
  res.header('Access-Control-Allow-Origin', req.headers.origin)
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
  res.header('Access-Control-Allow-Headers', 'Content-Type')
  next()
}
