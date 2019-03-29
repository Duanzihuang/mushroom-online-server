var mysql = require('mysql')
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'mushroom_online'
})

// 连接数据库
connection.connect()

// 执行sql，通过回调函数传递结果
exports.exec = (sql, callback) => {
  // 执行sql
  connection.query(sql, function(error, results, fields) {
    if (error) throw error
    callback(results)
  })
}

// 执行sql，通过Promise传递结果
exports.execPromise = sql => {
  return new Promise((resolve, reject) => {
    // 执行sql
    connection.query(sql, function(error, results, fields) {
      if (error) reject(error)
      resolve(results)
    })
  })
}
