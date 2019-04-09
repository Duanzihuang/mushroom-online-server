const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
const jwt = require('jsonwebtoken')
const { getWxOpenId } = require(path.join(__dirname, '../wxsdk'))
const config = require(path.join(__dirname, '../config/global_config.js'))
const validate = require(path.join(__dirname,"../utils/validate.js"))
const phoneMap = new Map()

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
  }' and status = 1`
  const res2 = await db.execPromise(queryWxOpenIdSql)

  // 执行结果
  let userId = null
  if (res2 && res2.length > 0) {
    // 存在
    const updateUserInfoSql = `update t_user set wx_session_key='${
      res2.session_key
    }' where wx_open_id='${res2.openid}' and status = 1`

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

/**
 * 获取验证码
 */
exports.getVcode = (req,res) => {
  const result = {
    status:0,
    message:'获取验证码成功'
  }

  if (!req.query.phone) {
    result.status = 1
    result.message = "手机号不能为空"
    res.json(result)
    return
  }

  if(!validate.validatePhone(req.query.phone)){
    result.status = 2
    result.message = '手机号不正确'
    res.json(result)
    return
  }

  // 生成4位数验证码
  const vcode = parseInt(Math.random()*9000+1000)
  // todo 向用户手机号发送验证码
  result.vcode = vcode

  // 把手机号及验证码的对应关系保存起来
  phoneMap.set(req.query.phone,vcode)

  res.json(result)
}

/**
 * 手机号登录
 */
exports.login = async (req,res) => {
  const result = {
    status:0,
    message:'登录成功'
  }

  if (!req.body.phone){
    result.status = 1
    result.message = '手机号不能为空'
    res.json(result)
    return
  }

  if(!validate.validatePhone(req.body.phone)){
    result.status = 2
    result.message = '手机号不正确'
    res.json(result)
    return
  }

  if (!req.body.vcode){
    result.status = 3
    result.message = '验证码不能为空'
    res.json(result)

    return
  }

  // todo 验证短信验证码
  if (phoneMap.get(req.body.phone) !== parseInt(req.body.vcode)){
    result.status = 4
    result.message = '验证码不正确'
    res.json(result)

    return
  }

  // 查询该手机号之前是否注册过，如果没有则注册，否则返回查询到的用户信息
  const photoSelectSql = `select * from t_user where phone = '${req.body.phone}' and status = 1`
  const res1 = await db.execPromise(photoSelectSql)

  let userId = null
  if (res1 && res1.length > 0){ // 查询到了
    userId = res1.id
  } else { // 没查询到
    const insertUserSql = `insert into t_user(phone) values('${req.body.phone}')`
    const res2 = await db.execPromise(insertUserSql)
    userId = res2.id
  }

  // 根据userId生成token
  const token = "Bearer "+jwt.sign({ user_id: userId }, config.jwt_config.secretKey, {
    expiresIn: config.jwt_config.expiresIn
  })
  
  // 删除phoneMap中手机号和验证码的对应关系
  phoneMap.delete(req.body.phone)

  result.token = token
  res.json(result)
}