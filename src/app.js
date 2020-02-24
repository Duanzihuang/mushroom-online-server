//1.导入相关包
const express = require('express')
const bodyParser = require('body-parser')
const path = require('path')
const fs = require('fs')
const middleware = require(path.join(__dirname, 'middleware'))
const config = require(path.join(__dirname, './config/global_config.js'))
const compression = require('compression')
const https = require('https')

//2.创建app
const app = express()

//3.配置相关中间件
// 开启gzip压缩，加快传输速度，一定要写在所有静态资源中间件之前
// compress all responses
app.use(compression())

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

  console.log('http server is running on ' + config.PORT)
})

//6.启动HTTPS
//同步读取密钥和签名证书
var options = {
  key:fs.readFileSync(path.join(__dirname,'../ssl/www.huangjiangjun.top.key')),
  cert:fs.readFileSync(path.join(__dirname,'../ssl/www.huangjiangjun.top.pem'))
}

https.createServer(options,app).listen(config.HTTPSPORT,err => {
  if (err) {
    console.log(err)
  }

  console.log('https server is running on ' + config.HTTPSPORT)
})
