# 蘑菇在线后台 API 接口文档

## API V1 接口说明

- 接口基准地址：`http://localhost:3000/api`
- 服务端已开启 CORS 跨域支持
- API V1 认证统一使用 appkey + Token 认证
- 需要授权的 API ，必须在请求头中使用 `Authorization` 字段提供 `token` 令牌
- 使用 HTTP Status Code 标识状态
- 数据返回格式统一使用 JSON

### 支持的请求方法

- GET（SELECT）：从服务器取出资源（一项或多项）。
- POST（CREATE）：在服务器新建一个资源。
- PUT（UPDATE）：在服务器更新资源（客户端提供改变后的完整资源）。
- PATCH（UPDATE）：在服务器更新资源（客户端提供改变的属性）。
- DELETE（DELETE）：从服务器删除资源。
- HEAD：获取资源的元数据。
- OPTIONS：获取信息，关于资源的哪些属性是客户端可以改变的。

### 通用返回状态说明

| *状态码* | *含义*                | *说明*                                              |
| -------- | --------------------- | --------------------------------------------------- |
| 200      | OK                    | 请求成功                                            |
| 201      | CREATED               | 创建成功                                            |
| 204      | DELETED               | 删除成功                                            |
| 400      | BAD REQUEST           | 请求的地址不存在或者包含不支持的参数                |
| 401      | UNAUTHORIZED          | 未授权                                              |
| 403      | FORBIDDEN             | 被禁止访问                                          |
| 404      | NOT FOUND             | 请求的资源不存在                                    |
| 422      | Unprocesable entity   | [POST/PUT/PATCH] 当创建一个对象时，发生一个验证错误 |
| 500      | INTERNAL SERVER ERROR | 内部错误                                            |


## AppKey

#### 根据手机号获取appkey

- 请求路径：appkey/:phone
- 请求方法：GET
- 请求参数

| 参数名   | 参数说明 | 备注     |
| -------- | -------- | -------- |
| phone    | 手机号码 | 不能为空 |

- 响应参数

| 参数名  | 参数说明 | 备注                                                       |
| ------- | -------- | ---------------------------------------------------------- |
| status  | 响应状态 | 0:成功  1:手机号格式不正确  2:appkey不存在，请检查手机号码 |
| message | 响应消息 | 服务器返回的消息                                           |
| appkey  | appkey   | 手机号查询到的appkey                                       |

- 响应数据

```javascript
{
    "status": 0,
    "message": "查询appkey成功",
    "appkey": "79541b50522a11e98bce831b227fad88"
}
```

#### 根据手机号生成appkey

- 请求路径：appkey
- 请求方法：POST
- 请求参数

| 参数名   | 参数说明 | 备注     |
| -------- | -------- | -------- |
| phone    | 手机号码 | 不能为空 |

- 响应参数

| 参数名  | 参数说明 | 备注                                                        |
| ------- | -------- | ----------------------------------------------------------- |
| status  | 响应状态 | 0:成功  1:手机号不能为空  2:手机号格式不正确 3:手机号已注册 |
| message | 响应消息 | 服务器返回的消息                                            |
| appkey  | appkey   | 新生成的appkey或是之前注册的appkey                          |

- 响应数据

```javascript
{
    "status": 0,
    "message": "生成appkey成功",
    "appkey": "79541b50522a11e98bce831b227fad88"
}
```

## 登录

#### 微信登录

- 请求路径：user/wxlogin
- 请求方法：POST
- 请求参数

| 参数名 | 参数说明                             | 备注     |
| ------ | ------------------------------------ | -------- |
| code   | 调用wx.login接口获取登录凭证（code） | 不能为空 |

- 响应参数

| 参数名  | 参数说明 | 备注                           |
| ------- | -------- | ------------------------------ |
| status  | 响应状态 | 0:微信登录成功  1:code不能为空 |
| message | 响应消息 | 服务器返回的消息               |
| token   | 令牌     | 服务器登录成功之后返回的令牌   |

- 响应数据

```javascript
{
    "status": 0,
    "message": "登录成功",
    "token": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1NTQ3MjY5MjksImV4cCI6MTU1NDgxMzMyOX0.36EOpSpb9VgtC5DfD5y8h9vQUi9ecCd_9McXbME1ADE"
}
```

#### 获取验证码

- 请求路径：user/vcode
- 请求方法：GET
- 请求参数

| 参数名 | 参数说明 | 备注     |
| ------ | -------- | -------- |
| phone  | 手机号码 | 不能为空 |

- 响应参数

| 参数名  | 参数说明 | 备注                                                   |
| ------- | -------- | ------------------------------------------------------ |
| status  | 响应状态 | 0:获取验证码成功  1:手机号不能为空  2:手机号格式不正确 |
| message | 响应消息 | 服务器返回的消息                                       |
| vcode   | 验证码   | 服务器返回的验证码                                     |

- 响应数据

```javascript
{
    "status": 0,
    "message": "获取验证码成功",
    "vcode": 8088
}
```

#### 手机号登录

- 请求路径：user/login
- 请求方法：POST
- 请求参数

| 参数名 | 参数说明 | 备注     |
| ------ | -------- | -------- |
| phone  | 手机号   | 不能为空 |
| vcode  | 验证码   | 不能为空 |

- 响应参数

| 参数名  | 参数说明 | 备注                                   |
| ------- | -------- | -------------------------------------- |
| status  | 响应状态 | 0:登录成功  1:手机号有误  2:验证码有误 |
| message | 响应消息 | 服务器返回的消息                       |
| token   | 令牌     | 服务器登录成功之后返回的令牌           |

- 响应数据

```javascript
{
    "status": 0,
    "message": "登录成功",
    "token": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1NTQ3MjY5MjksImV4cCI6MTU1NDgxMzMyOX0.36EOpSpb9VgtC5DfD5y8h9vQUi9ecCd_9McXbME1ADE"
}
```

## 首页

#### 获取首页轮播图

- 请求路径：home/swipers
- 请求方法：GET
- 请求参数：

| 参数名 | 参数说明 | 备注 |
| ------ | -------- | ---- |
| 暂无   | 暂无     | 暂无 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": [
        {
            "id": 1,
            "img_url": "http://127.0.0.1:3000/images/carousel/banner_01.jpg",
            "link_url": null,
            "create_time": "2019-04-02T03:58:18.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        },
        {
            "id": 2,
            "img_url": "http://127.0.0.1:3000/images/carousel/banner_02.jpg",
            "link_url": null,
            "create_time": "2019-04-02T03:59:20.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        },
        {
            "id": 3,
            "img_url": "http://127.0.0.1:3000/images/carousel/banner_03.jpg",
            "link_url": null,
            "create_time": "2019-04-02T03:59:47.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        }
    ]
}
```

#### 获取首页推荐课程

- 请求路径：home/course
- 请求方法：GET
- 请求参数：

| 参数名 | 参数说明 | 备注 |
| ------ | -------- | ---- |
| 暂无   | 暂无     | 暂无 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": [
        {
            "id": 13,
            "title": "创意DIY班",
            "subtitle": null,
            "icon": null,
            "audience": "适合3~6岁人群",
            "level": 1,
            "class_hour": null,
            "price": null,
            "score": null,
            "study_count": null,
            "is_recommend": 1,
            "create_time": "2019-04-09T13:23:18.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        },
        {
            "id": 14,
            "title": "创意美术班",
            "subtitle": null,
            "icon": null,
            "audience": "适合6~12岁人群",
            "level": 1,
            "class_hour": null,
            "price": null,
            "score": null,
            "study_count": null,
            "is_recommend": 1,
            "create_time": "2019-04-09T13:23:12.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        },
        {
            "id": 15,
            "title": "素描班",
            "subtitle": null,
            "icon": null,
            "audience": "适合15~20岁人群\n",
            "level": 1,
            "class_hour": null,
            "price": null,
            "score": null,
            "study_count": null,
            "is_recommend": 1,
            "create_time": "2019-04-09T13:23:15.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        }
    ]
}
```

####  获取首页热门视频

- 请求路径：home/video
- 请求方法：GET
- 请求参数：

| 参数名 | 参数说明 | 备注 |
| ------ | -------- | ---- |
| 暂无   | 暂无     | 暂无 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": [
        {
            "id": 10,
            "name": "可爱的玩偶制作教程",
            "cover_photo_url": "http://127.0.0.1:3000/images/hot_video/hot1.png",
            "video_url": null,
            "duration": 380,
            "is_study": 0,
            "course_id": 4,
            "is_hot": 1,
            "view_count": 152,
            "create_time": "2019-04-09T06:46:11.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        },
        {
            "id": 11,
            "name": "编程几何的艺术魅力",
            "cover_photo_url": "http://127.0.0.1:3000/images/hot_video/hot2.png",
            "video_url": null,
            "duration": 520,
            "is_study": 0,
            "course_id": 5,
            "is_hot": 1,
            "view_count": 623,
            "create_time": "2019-04-09T06:46:51.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        }
    ]
}
```

####  