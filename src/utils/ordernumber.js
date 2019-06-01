const moment = require('moment')
/**
 * 生成随机数
 * @param {*} length 
 */
function generateNonceString(length) {
    var chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	var maxPos = chars.length;
	var noceStr = "";
	for (var i = 0; i < (length || 32); i++) {
		noceStr += chars.charAt(Math.floor(Math.random() * maxPos));
	}
	return noceStr;
}

/**
 * 生成订单流水号
 * 
 * @param {string} pfx 流水号前缀
 * @param {int} orderId 订单ID
 */
function generateOrderNoString(pfx,orderId) {
	const dateString = moment().format('YYYYMMDD')
	const orderNumber = `${orderId}`.padStart(12,'0')
	return `${pfx}${dateString}${orderNumber}`
}


module.exports = {
	generateNonceString,
	generateOrderNoString
}