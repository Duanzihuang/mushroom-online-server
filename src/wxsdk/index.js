const path = require('path')
const wxconfig = require(path.join(__dirname, '../config/wxconfig.js'))
const axios = require('axios')

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

module.exports = {
  getWxOpenId
}
