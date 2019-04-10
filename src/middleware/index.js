// 需要排除检测的url地址
const excludeValidateAppKeyUrls = ['/favicon.ico', '/api/appkey', '/public']

// 需要排除检测的方法
const needExcludeValidateAppKeyUrl = req => {
  // 是否需要排除
  let isExclude = false
  excludeValidateAppKeyUrls.some(item => {
    if (req.url.startsWith(item)) {
      isExclude = true
      return true
    }
  })

  return isExclude
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
