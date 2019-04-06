const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))
const validate = require(path.join(__dirname,"../utils/validate.js"))
const uuidv1 = require('uuid/v1')
/**
 * 返回AppKey
 */
exports.getAppKey = (req, res) => {
  const result = {
    status: 0,
    message: '查询appkey成功'
  }

  if (!validate.validatePhone(req.params.phone)) {
    result.status = 1
    result.message = '手机号格式不正确'
    res.json(result)

    return
  }

  const sql = `select * from t_appkey where phone = '${
    req.params.phone
  }' and status = 1`

  db.exec(sql, results => {
    if (results[0]) {
      result.appkey = results[0].appkey
    } else {
      result.status = 2
      result.message = 'appkey不存在，请检查手机号码'
    }

    res.json(result)
  })
}



/**
 * 新增Appkey
 */
exports.addAppKey = async (req, res) => {
  const result = {
    status: 0,
    message: '生成appkey成功'
  }

  if (!req.body.phone) {
    result.status = 1
    result.message = '手机号不能为空'
    res.json(result)
    return
  }

  if (!validate.validatePhone(req.body.phone)) {
    result.status = 2
    result.message = '手机号格式不正确'
    res.json(result)
    return
  }

  // 判断手机号是否注册过
  const selectSql = `select * from t_appkey where phone = '${
    req.body.phone
  }' and status = 1`

  const results = await db.execPromise(selectSql)
  console.log(results)
  if (results[0]) {
    result.status = 3
    result.message = '该手机号已经注册过appkey了'
    result.appkey = results[0].appkey

    res.json(result)

    return
  }

  // 根据时间戳，生成uuid
  const uuid = uuidv1().replace(/\-/g, '')

  // 插入sql语句
  const insertSql = `insert into t_appkey(appkey,phone) values('${uuid}','${
    req.body.phone
  }')`

  db.exec(insertSql, () => {
    result.appkey = uuid

    res.json(result)
  })
}
