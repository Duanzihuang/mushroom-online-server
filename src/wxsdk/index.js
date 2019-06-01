const path = require('path')
const wxconfig = require(path.join(__dirname, '../config/wxconfig.js'))
const axios = require('axios')
const md5 = require('md5')
const _ = require('lodash')
const xml2js = require('xml2js')
const xmlParser = require('xml2js-parser')

// 获取微信用户的openId
const getWxOpenId = async code => {
  const url = `https://api.weixin.qq.com/sns/jscode2session?appid=${
    wxconfig.AppID
  }&secret=${wxconfig.AppSecret}&js_code=${code}&grant_type=authorization_code`

  const res = await axios.get(url)

  if (res.status === 200) {
    return res.data
  } else {
    return null
  }
}

/**
 * 
 * 签名生成算法
 * 
 * @param {Object} params 参数
 * @param {*} payKey 支付密钥
 */
const wxsign = (params,payKey) => {
  var querystring =
  // 获取所有的 key
  Object.keys(params)
  // 通过过滤函数把不需要的字段过滤
  .filter(key => {
  return params[key] !== undefined && params[key] !== '' && ['sign'].indexOf(key)<0
  }).
  // 对所有Key进行排序
  sort().
  // 让所有的项的key转换成 `key = val` 结果
  map(key => {
  return key + '=' + params[key]
  }).
  // 1. 把数组合并成字符串并且以 & 符号连接
  // 2. 把加密key追加到字段之后
  join("&") + "&key=" + payKey
  return md5(querystring).toUpperCase()
}


/**
 * 
 * 向微信请求预付单
 * 
 * @param {String} AppId 应用ID
 * @param {String} MchId 商户ID
 * @param {String} PayKey 支付密钥
 * @param {String} openid 用户openid
 * @param {String} order_number 订单流水号
 * @param {Number} total_fee 价格
 * @param {String} body 商品详情
 * @param {String} notifiy_url 支付通知地址
 */
 const reqWXUnifiedorder = async (openid,out_trade_no,total_fee,body) => {
  /* 支付参数 */
  const params = {
      appid:  wxconfig.AppID,                                     // 小程序ID
      mch_id: wxconfig.MchId,                                     // 微信商户号
      nonce_str: md5(Date.now()+"mmis"),                          // 随机数
      body: body,                                                 // 商品描述
      out_trade_no: out_trade_no,                                 // 订单号
      total_fee: total_fee,                                       // 价格
      spbill_create_ip: '127.0.0.1',                              // IP
      notify_url: wxconfig.wxPayNotifiyUrl,                       // 支付成功通知地址
      trade_type: 'JSAPI',                                        // 支付方式
      openid:openid                                               // 用户标识
  }
  /* 通过签名生成算法进行签名 */
  params['sign'] = wxsign(params,wxconfig.PayKey)
  /* 创建xml构建对象 */
  let builder = new xml2js.Builder()
  /* 通过params转换成xml请求对象 */
  let reqXML = builder.buildObject(params)
  /* 向微信商户平台发起请求获取预付订单 */
  try {
      const resultXML = await axios.post('https://api.mch.weixin.qq.com/pay/unifiedorder',reqXML)
      if(resultXML) {
          /* 解析结果并且构建预付订单对象 */
          const result = xmlParser.parseStringSync(resultXML.data,{ trim:true, explicitArray:false, explicitRoot:false})
          
          if(result && result['result_code'] == 'SUCCESS') {
              const timeStamp = (Math.ceil(Date.now() / 1000))+''
              const nonceStr = result.nonce_str
              const package = `prepay_id=${result.prepay_id}`
              const signType = 'MD5'
              let wxmporder = {
                  appId:wxconfig.AppID,
                  timeStamp:timeStamp,
                  nonceStr:nonceStr,
                  package:package,
                  signType:signType
              }
              wxmporder.paySign = wxsign(wxmporder,wxconfig.PayKey)
              return _.omit(wxmporder,"appId")
          } else {
              return result
          }
      }
  } catch (error) {
      throw error
  }
  throw new Error("创建预付订单失败")
}


module.exports = {
  getWxOpenId,
  reqWXUnifiedorder
}
