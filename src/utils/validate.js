/**
 * 验证手机号
 *
 * @param {*} phone 手机号
 */
const validatePhone = phone => {
  const reg = /^1[3,4,5,6,7,8,9][0-9]{9}$/

  return reg.test(phone)
}

module.exports = {
    validatePhone
}