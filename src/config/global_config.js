const PORT = 3000

const config = {
  PORT, // 端口
  api_host: `http://127.0.0.1:${PORT}`, // api基准路径
  staticPathPrefix:'/public/', // 静态资源访问前缀
  jwt_config: { //Token加密相关信息
    secretKey: 'itheima',
    expiresIn: 86400000
  }
}

module.exports = config
