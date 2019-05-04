const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))

// 验证必填参数
const validateParams = (req,res) => {
    if (!req.query.user_id){
        return res.json({
            status:1,
            message:"获取用户信息失败"
        })
    }

    if (!req.query.course_id){
        return res.json({
            status:2,
            message:"获取课程信息失败"
        })
    }
}
/**
 * 获取订单状态
 */
exports.getOrderInfo = async (req,res) => {
    const result = {
        status:0,
        message:'获取成功'
    }

    validateParams(req,res)

    const {user_id,course_id} = req.query

    const res1 = await db.execPromise(`select * from t_order where user_id=${user_id} and course_id = ${course_id} and status = 1`)

    if (res1 && res1.length > 0){
        result.message = res1[0]
    }

    res.json(result)
}

/**
 * 获取订单是否已经支付
 */
exports.getOrderPayStatus = async (req,res) => {
    const result = {
        status:0,
        message:'获取成功'
    }

    validateParams(req,res)

    const {user_id,course_id} = req.query

    const res1 = await db.execPromise(`select pay_status from t_order where user_id=${user_id} and course_id = ${course_id} and status = 1`)

    if (res1 && res1.length > 0){
        result.pay_status = res1[0]
        result.message = res1[0] === 0 ? '未支付' : '已支付'
    } else {
        result.pay_status = 0
        result.message = "未支付"
    }

    res.json(result)
}

/**
 * 创建订单
 */
exports.createOrder = async (req,res) => {
    const result = {
        status:0,
        message:'创建订单成功'
    }
    
    if (!req.query.user_id){
        return res.json({
            status:1,
            message:"获取用户信息失败"
        })
    }

    if (!req.body.course_id){
        return res.json({
            status:2,
            message:"获取课程信息失败"
        })
    }

    if (!req.body.price){
        return res.json({
            status:3,
            message:"价格不能为空"
        })
    }

    const user_id = req.query.user_id
    const {course_id,price} = req.body

    const insertOrderSql = `insert into t_order(user_id,course_id,price) values('${user_id}','${course_id}','${price}')`
    const res1 = await db.execPromise(insertOrderSql)

    if(res1){
        result.order_id = res1.insertId
    }

    res.json(result)
}

/**
 * 支付订单
 */
exports.payOrder = async (req,res) => {
    const result = {
        status:0,
        message:'支付成功'
    }

    if (!req.body.order_id){
        return res.send({
            status:1,
            message:'订单号不能为空'
        })
    }

    const updateOrderSql = `update t_order set pay_status = 1 where id = '${req.body.order_id}'`
    const res1 = await db.execPromise(updateOrderSql)
    
    if (res1) {
        res.send(result)
    } else {
        result.status = 2
        result.message = '支付失败'

        res.send(result)
    }
}