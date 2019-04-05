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

// AppKey
router.get('/api/appkey/:phone', appkey.getAppKey)
router.post('/api/appkey', appkey.addAppKey)

// 用户
router.post('/api/user/wxlogin',user.wxLogin)

// 首页
router.get('/api/home/swipers', home.getSwipers)

// 课程
router.get('/api/course/list', course.getCourseList)
router.get('/api/course/:name', course.getCourseListByName)

//导出
module.exports = router
