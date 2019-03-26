//1.导入相关包
const express = require('express')
const bodyParser = require('body-parser')
const path = require('path')

//2.创建app
const app = express()

//3.配置相关中间件
// 权限控制中间件
const middleware = require(path.join(__dirname, 'middleware'))
app.use(middleware.validateAppKey)

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
// parse application/json
app.use(bodyParser.json())

// 路由中间件
const router = require(path.join(__dirname, 'router'))
app.use(router)

//5.启动
app.listen(3000, err => {
  if (err) {
    console.log(err)
  }

  console.log('server is running!')
})
