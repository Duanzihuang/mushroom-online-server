// 导入相关包
const express = require('express')
const path = require('path')
// 创建路由对象
const router = express.Router()

// 导入相关控制器
const appkey = require(path.join(__dirname, '../controllers/appkey'))
const home = require(path.join(__dirname, '../controllers/home'))
const course = require(path.join(__dirname, '../controllers/course'))
const user = require(path.join(__dirname, '../controllers/user'))
const study = require(path.join(__dirname, '../controllers/study'))
const my = require(path.join(__dirname, '../controllers/my'))
const order = require(path.join(__dirname, '../controllers/order'))
const pay = require(path.join(__dirname, '../controllers/pay'))
const comment = require(path.join(__dirname, '../controllers/comment'))
const lecturer = require(path.join(__dirname, '../controllers/lecturer'))

// AppKey
router.get('/appkey/:phone', appkey.getAppKey)
router.post('/appkey', appkey.addAppKey)

// 用户
router.post('/user/wxlogin',user.wxLogin)
router.get('/user/vcode',user.getVcode)
router.post('/user/login',user.login)

// 首页
router.get('/home/swipers', home.getSwipers)
router.get('/home/course', home.getRecommendCourse)
router.get('/home/video', home.getHotVideo)

// 课程
router.get('/course/list', course.getCourseList)
router.get('/course/search', course.getCourseListByName)
router.get('/course/:id', course.getCourseById)
router.get('/course/play/:id', course.getCoursePlayById)

// 学习
router.get('/study/progress',study.getStudyProgress)
router.post('/study/video',study.studyCourseVideo)
router.get('/study/complete',study.studyComplete)

// 我的
router.get('/my/info',my.getUserInfo)

// 订单
router.get('/order/info',order.getOrderInfo)
router.get('/order/paystatus',order.getOrderPayStatus)
router.post('/order/create',order.createOrder)
router.post('/order/pay',order.payOrder) // 模拟支付
router.post('/order/wxpaysuccess',order.wxPaySuccess) // 微信支付成功

// 支付
router.post('/pay/req_unifiedorder',pay.reqUnifiedOrder) // 请求预付单

// 评论
router.post('/comment/like',comment.like)
router.post('/comment/create',comment.create)

// 讲师
router.post('/lecturer/follow',lecturer.follow)
router.post('/lecturer/unfollow',lecturer.unfollow)

//导出
module.exports = router
