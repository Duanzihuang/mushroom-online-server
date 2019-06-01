const jwt = require('jsonwebtoken')
const path = require('path')
const global_config = require(path.join(__dirname,"../config/global_config.js"))

// 需要排除检测的url地址
const excludeValidateAppKeyUrls = ['/favicon.ico', '/api/appkey', '/public']
const excludeValidateTokenUrls = ['/favicon.ico', '/api/appkey', '/public','/api/user']

// 需要排除检测Appkey的方法
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

// 需要排除检测Token的方法
const needExcludeValidateTokenUrl = req => {
  // 是否需要排除
  let isExclude = false
  excludeValidateTokenUrls.some(item => {
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

/**
 * 验证token
 */
exports.validateToken = (req, res, next) => {
  if (needExcludeValidateTokenUrl(req)){ // 不需要验证token
    next()
  } else {
    if (!req.headers.authorization) {
      res.json({
        code: 402,
        message: 'token 不能为空'
      })
      return
    }
    // 校验token
    // invalid token - synchronous
    try {
      var decoded = jwt.verify(req.headers.authorization.substr(7), global_config.jwt_config.secretKey)
      
      req.query.user_id = decoded.user_id
      req.query.openid = decoded.openid
      req.query.login_type = decoded.login_type

      next()
    } catch(err) {
      res.json({
        code: 402,
        message: 'token 不合法'
      })
      return
    }
  }
}