//1.导入相关包
const express = require('express')
const bodyParser = require('body-parser')
const path = require('path')
const middleware = require(path.join(__dirname, 'middleware'))
const config = require(path.join(__dirname, './config/global_config.js'))

//2.创建app
const app = express()

//3.配置相关中间件
// 跨域中间件
app.use(middleware.allowCrossDomain)

// 权限控制中间件
// app.use(middleware.validateAppKey)

// 验证token
app.use(middleware.validateToken)

// 静态资源中间件
app.use('/public', express.static(path.join(__dirname, 'public')))

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
// parse application/json
app.use(bodyParser.json())

// 路由中间件
const apiRouter = require(path.join(__dirname, 'router'))
app.use('/api', apiRouter)

// 全局错误处理
app.use((err, req, res, next) => {
  if (err) {
    res.status(500).send({
      statusCode: 500,
      message: 'Internal Server error',
      error: err.message
    })
  }
})

//5.启动
app.listen(config.PORT, err => {
  if (err) {
    console.log(err)
  }

  console.log('server is running!')
})
