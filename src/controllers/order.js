const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
const moment = require('moment')
const ordernumber = require(path.join(__dirname,'../utils/ordernumber'))

// 验证必填参数
const validateParams = (req, res) => {
  if (!req.query.user_id) {
    return res.json({
      status: 1,
      message: '获取用户信息失败'
    })
  }

  if (!req.query.course_id) {
    return res.json({
      status: 2,
      message: '获取课程信息失败'
    })
  }
}
/**
 * 获取订单状态
 */
exports.getOrderInfo = async (req, res) => {
  const result = {
    status: 0,
    message: '获取成功'
  }

  validateParams(req, res)

  const { user_id, course_id } = req.query

  const res1 = await db.execPromise(
    `select * from t_order where user_id=${user_id} and course_id = ${course_id} and status = 1`
  )

  if (res1 && res1.length > 0) {
    result.message = res1[0]
  }

  res.json(result)
}

/**
 * 获取订单是否已经支付
 */
exports.getOrderPayStatus = async (req, res) => {
  const result = {
    status: 0,
    message: '获取成功'
  }

  validateParams(req, res)

  const { user_id, course_id } = req.query

  const res1 = await db.execPromise(
    `select pay_status from t_order where user_id=${user_id} and course_id = ${course_id} and status = 1`
  )
  
  if (res1 && res1.length > 0) {
    result.pay_status = res1[0].pay_status
    result.message = res1[0].pay_status === 0 ? '未支付' : '已支付'
  } else {
    result.pay_status = 0
    result.message = '未支付'
  }

  res.json(result)
}

/**
 * 创建订单
 */
exports.createOrder = async (req, res) => {
  const result = {
    status: 0,
    message: '创建订单成功'
  }

  if (!req.query.user_id) {
    return res.json({
      status: 1,
      message: '获取用户信息失败'
    })
  }

  if (!req.body.course_id) {
    return res.json({
      status: 2,
      message: '获取课程信息失败'
    })
  }

  if (!req.body.price) {
    return res.json({
      status: 3,
      message: '价格不能为空'
    })
  }

  /**
    const user_id = req.query.user_id
    const {course_id,price} = req.body

    const insertOrderSql = `insert into t_order(user_id,course_id,price,create_time) values('${user_id}','${course_id}','${price}','${moment(new Date()).format('YYYY-MM-DD HH:mm:ss')}')`
    const res1 = await db.execPromise(insertOrderSql)
     */

  // 解构赋值
  const {user_id} = req.query
  const {course_id,price} = req.body

  // 根据course_id 和 user_id 查询订单，如果存在，则返回，不存在则创建
  const res1 = await db.execPromise('select * from t_order where user_id = ? and course_id = ?',[user_id,course_id])
  if (res1 && res1.length > 0){
    result.status = 0
    result.message = '查询订单成功'
    result.order_id = res1[0].id
    result.order_number = res1[0].order_number
  } else { // 没查询到则新增
    const params = {
      user_id: user_id,
      course_id: course_id,
      price: price,
      create_time: moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    }
  
    const res2 = await db.execPromise('insert into t_order set ?', params)
  
    if (res2) {
      // 订单id
      result.order_id = res2.insertId

      // 更新订单号
      const order_number = ordernumber.generateOrderNoString("HMDD",res2.insertId)
      const res3 = await db.execPromise('update t_order set order_number = ? where id = ?',
      [order_number,res2.insertId])

      // 订单号
      result.order_number = order_number
    }
  }

  res.json(result)
}

/**
 * 支付订单
 */
exports.payOrder = async (req, res, next) => {
  const result = {
    status: 0,
    message: '支付成功'
  }

  if (!req.body.order_id) {
    return res.send({
      status: 1,
      message: '订单号不能为空'
    })
  }

  /** 
    const updateOrderSql = `update t_order set pay_status = 1 where id = '${req.body.order_id}'`
    const res1 = await db.execPromise(updateOrderSql)
    */
  try {
    const res1 = await db.execPromise(
      'update t_order set pay_status = ?,update_time = ? where id = ?',
      [1, moment(new Date()).format('YYYY-MM-DD HH:mm:ss'), req.body.order_id]
    )

    if (res1) {
      res.send(result)
    } else {
      result.status = 2
      result.message = '支付失败'

      res.send(result)
    }
  } catch (error) {
    next(error)
  }
}

/**
 * 微信支付成功
 */
exports.wxPaySuccess = async (req,res) => {
  if (!req.body.order_number) {
    return res.json({
      status:1,
      message:'订单号不能为空'
    })
  }

  const result = await db.execPromise('update t_order set pay_status = 1 where order_number = ?',[req.body.order_number])
  if (result && result.changedRows > 0) {
    res.json({
      status: 0,
      message: '更改订单状态成功'
    })
  } else {
    res.json({
      status: 2,
      message: '订单状态更改失败'
    })
  }
}
