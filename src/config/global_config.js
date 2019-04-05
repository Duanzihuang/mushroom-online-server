const PORT = 3000

const config = {
  PORT,
  api_host: `http://127.0.0.1:${PORT}/`,
  jwt_config: {
    secretKey: 'itheima',
    expiresIn: 86400
  }
}

module.exports = config
