const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
const jwt = require('jsonwebtoken')
const { getWxOpenId } = require(path.join(__dirname, '../wxsdk'))
const config = require(path.join(__dirname, '../config/global_config.js'))

/**
 * 微信登录
 */
exports.wxLogin = async (req, res) => {
  const result = {
    status: 0,
    message: '微信登录成功'
  }

  // 判断是否有code
  if (!req.body.code) {
    result.status = 1
    result.message = 'code不能为空'
    res.json(result)
    return
  }

  // 调用wxsdk的方法
  const res1 = await getWxOpenId(req.body.code)
  if (!res1) {
    result.status = 2
    result.message = '微信登录失败,请检查code及appid的设置'
    res.json(result)

    return
  }

  // 判断该openId是否存在
  const queryWxOpenIdSql = `select id from t_user where wx_open_id='${
    res1.openid
  }'`
  const res2 = await db.execPromise(queryWxOpenIdSql)

  // 执行结果
  let userId = null
  if (res2 && res2.length > 0) {
    // 存在
    const updateUserInfoSql = `update t_user set wx_session_key='${
      res2.session_key
    }' where wx_open_id='${res2.openid}'`

    await db.execPromise(updateUserInfoSql)

    userId = res2.id
  } else {
    // 不存在
    const insertUserInfoSql = `insert into t_user(wx_open_id,wx_session_key) values('${
      res1.openid
    }','${res1.session_key}')`

    const res3 = await db.execPromise(insertUserInfoSql)

    userId = res3.id
  }

  // 根据userId生成token
  const token = "Bearer "+jwt.sign({ user_id: userId }, config.jwt_config.secretKey, {
    expiresIn: config.jwt_config.expiresIn
  })
  
  result.token = token
  res.json(result)
}
