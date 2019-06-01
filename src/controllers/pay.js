const path = require('path')
const wxsdk = require(path.join(__dirname, '../wxsdk'))

/**
 * 微信支付之请求预支付单
 */
exports.reqUnifiedOrder = async (req, res) => {
  const result = {
    status: 0,
    message: '请求预付单成功'
  }

  if (!req.body.order_number) {
    return res.json({
      status: 1,
      message: '订单编号不能为空'
    })
  }

  if (!req.query.openid) {
      return res.json({
        status: 2,
        message: 'wx_open_id不能为空'
      })
  }

  // 调用wxsdk的方法来请求预支付
  const res1 = await wxsdk.reqWXUnifiedorder(req.query.openid,req.body.order_number,1,'蘑菇在线支付')
  result.payorder = res1

  res.json(result)
}
