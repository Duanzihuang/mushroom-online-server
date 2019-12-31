# 蘑菇在线后台 API 接口文档

## API V1 接口说明

- 接口基准地址：`http://localhost:3000/api/`
- 服务端已开启 CORS 跨域支持
- API V1 认证统一使用 Token 认证
- 需要授权的 API ，必须在请求头中使用 `Authorization` 字段提供 `token` 令牌
- 除开登录接口外，其它接口都需要进行授权（携带token）
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

## 登录

#### 微信登录

- 请求路径：user/wxlogin
- 请求方法：POST
- 请求参数

| 参数名   | 参数说明                             | 备注     |
| -------- | ------------------------------------ | -------- |
| code     | 调用wx.login接口获取登录凭证（code） | 不能为空 |
| nickname | 调用wx.getUserInfo接口获取到的昵称   | 不能为空 |
| avatar   | 调用wx.getUserInfo接口获取到的头像   | 不能为空 |

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

## 课程

#### 获取课程列表

- 请求路径：course/list
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
            "title": "逻辑思维训练",
            "subtitle": "提升思考的能力",
            "icon": "http://127.0.0.1:3000/images/course/course1.png",
            "audience": null,
            "level": 1,
            "class_hour": 15,
            "price": null,
            "score": null,
            "study_count": null,
            "is_recommend": 0,
            "create_time": "2019-04-04T13:33:45.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        },
        {    "id": 2,
            "title": "Scratch编程启蒙",
            "subtitle": "MIT研发的编程工具",
            "icon": "http://127.0.0.1:3000/images/course/course2.png",
            "audience": null,
            "level": 2,
            "class_hour": 10,
            "price": null,
            "score": null,
            "study_count": null,
            "is_recommend": 0,
            "create_time": "2019-04-04T13:37:35.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        }
    ]
}
```

#### 根据关键字查询课程列表

- 请求路径：course/search
- 请求方法：GET
- 请求参数：

| 参数名 | 参数说明 | 备注 |
| ------ | -------- | ---- |
| name   | 课程名   | 暂无 |

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
            "id": 4,
            "title": "少儿编程入门全集",
            "subtitle": "从小学习编程是时代趋势",
            "icon": "http://127.0.0.1:3000/images/course/course4.png",
            "audience": null,
            "level": 1,
            "class_hour": 12,
            "price": null,
            "score": null,
            "study_count": null,
            "is_recommend": 0,
            "create_time": "2019-04-04T13:38:43.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        },
        {
            "id": 8,
            "title": "爱编程的艺术家",
            "subtitle": "艺术和代码的碰撞",
            "icon": "http://127.0.0.1:3000/images/course/course8.png",
            "audience": null,
            "level": 3,
            "class_hour": 12,
            "price": null,
            "score": null,
            "study_count": null,
            "is_recommend": 0,
            "create_time": "2019-04-04T13:41:03.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        }
    ]
}
```

#### 根据id查询课程

- 请求路径：course/:id
- 请求方法：GET
- 请求参数：

| 参数名 | 参数说明 | 备注     |
| ------ | -------- | -------- |
| id     | 课程id   | 不能为空 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": {
        "course": [
            {
                "id": 3,
                "title": "创意手绘班",
                "subtitle": "轻松入门手绘",
                "icon": "http://127.0.0.1:3000/public/images/course/course3.png",
                "audience": null,
                "level": 3,
                "class_hour": 12,
                "price": 259,
                "score": 4,
                "study_count": 1524,
                "is_recommend": 0,
                "create_time": "2019-04-04T13:38:09.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            }
        ],
        "videos": [
            {
                "id": 1,
                "name": "绘画课程使用画具购买建议",
                "cover_photo_url": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "video_url": null,
                "duration": 600,
                "is_study": 0,
                "course_id": 3,
                "is_hot": 0,
                "view_count": null,
                "create_time": "2019-04-09T04:50:31.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            },
            {
                "id": 2,
                "name": "掌握线条绘制的方法",
                "cover_photo_url": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "video_url": null,
                "duration": 400,
                "is_study": 0,
                "course_id": 3,
                "is_hot": 0,
                "view_count": null,
                "create_time": "2019-04-09T04:58:33.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            }
        ],
        "lecturer": [
            {
                "id": 0,
                "name": "张老师",
                "avatar": "http://127.0.0.1:3000/public/images/lecturer/lecturer1.jpg",
                "introduction": "多年教育与开发经验，专注少儿编程课程开发，侧重培养学生专注力和分析解决问题的能力，语言风趣，授课思路清晰，通俗易懂。",
                "follow_count": 2546,
                "course_id": 3,
                "create_time": "2019-04-09T04:40:08.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            }
        ],
        "comments": [
            {
                "id": 5,
                "course_id": 3,
                "pid": 0,
                "uid": 5,
                "score": 4,
                "content": "老师讲解的不错，孩子很喜欢！",
                "good": 0,
                "comment_time": "2019-04-09T04:35:13.000Z",
                "status": 1,
                "nickname": null,
                "phone": "14786920926",
                "password": null,
                "avatar": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "gender": 1,
                "address": null,
                "wx_open_id": null,
                "wx_session_key": null,
                "wx_union_id": null,
                "create_time": null,
                "update_time": null,
                "delete_time": null
            },
            {
                "id": 6,
                "course_id": 3,
                "pid": 0,
                "uid": 6,
                "score": 4,
                "content": "看过才知道自己哪里不行，贵在坚持，感谢老师！",
                "good": 0,
                "comment_time": "2019-04-09T04:37:02.000Z",
                "status": 1,
                "nickname": null,
                "phone": "17704051019",
                "password": null,
                "avatar": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "gender": 1,
                "address": null,
                "wx_open_id": null,
                "wx_session_key": null,
                "wx_union_id": null,
                "create_time": null,
                "update_time": null,
                "delete_time": null
            }
        ]
    }
} 
```

#### 获取课程播放信息

- 请求路径：course/play/:id
- 请求方法：GET
- 请求参数：

| 参数名 | 参数说明 | 备注 |
| ------ | -------- | ---- |
| id     | 课程id   | 暂无 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": {
        "course": {
            "id": 3,
            "title": "创意手绘班",
            "subtitle": "轻松入门手绘",
            "icon": "http://127.0.0.1:3000/public/images/course/course3.png",
            "cover_image_url": "http://127.0.0.1:3000/public/images/course/course3_cover_image.png",
            "audience": null,
            "introduction": "本课程面向零基础的绘画爱好者，适合6~12岁儿童学习，只要您的孩子对画画感兴趣就可以迅速上手，提升孩子审美~",
            "level": 3,
            "class_hour": 12,
            "price": 259,
            "score": 4,
            "study_count": 1524,
            "is_recommend": 0,
            "create_time": "2019-04-04T13:38:09.000Z",
            "update_time": null,
            "delete_time": null,
            "status": 1
        },
        "videos": [
            {
                "id": 1,
                "name": "绘画课程使用画具购买建议",
                "cover_photo_url": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "video_url": null,
                "duration": "10:00",
                "is_study": 1,
                "course_id": 3,
                "is_hot": 0,
                "view_count": null,
                "create_time": "2019-04-09T04:50:31.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            },
            {
                "id": 2,
                "name": "掌握线条绘制的方法",
                "cover_photo_url": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "video_url": null,
                "duration": "06:40",
                "is_study": 1,
                "course_id": 3,
                "is_hot": 0,
                "view_count": null,
                "create_time": "2019-04-09T04:58:33.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            },
            {
                "id": 3,
                "name": "认识常见的绘画造型",
                "cover_photo_url": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "video_url": null,
                "duration": "08:20",
                "is_study": 1,
                "course_id": 3,
                "is_hot": 0,
                "view_count": null,
                "create_time": "2019-04-09T04:58:36.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            },
            {
                "id": 4,
                "name": "Q版人物结构绘制（上）",
                "cover_photo_url": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "video_url": null,
                "duration": "05:20",
                "is_study": 0,
                "course_id": 3,
                "is_hot": 0,
                "view_count": null,
                "create_time": "2019-04-09T06:35:11.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            },
            {
                "id": 5,
                "name": "Q版人物结构绘制（下）",
                "cover_photo_url": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "video_url": null,
                "duration": "08:40",
                "is_study": 0,
                "course_id": 3,
                "is_hot": 0,
                "view_count": null,
                "create_time": "2019-04-09T06:35:47.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            },
            {
                "id": 6,
                "name": "颜色上色技巧（上）",
                "cover_photo_url": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "video_url": null,
                "duration": "05:00",
                "is_study": 0,
                "course_id": 3,
                "is_hot": 0,
                "view_count": null,
                "create_time": "2019-04-09T06:38:18.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            },
            {
                "id": 7,
                "name": "颜色上色技巧（下）",
                "cover_photo_url": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "video_url": null,
                "duration": "05:00",
                "is_study": 0,
                "course_id": 3,
                "is_hot": 0,
                "view_count": null,
                "create_time": "2019-04-09T06:38:20.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            },
            {
                "id": 8,
                "name": "酷丁鱼卡通形象设计（上）",
                "cover_photo_url": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "video_url": null,
                "duration": "08:40",
                "is_study": 0,
                "course_id": 3,
                "is_hot": 0,
                "view_count": null,
                "create_time": "2019-04-09T06:38:15.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            },
            {
                "id": 9,
                "name": "酷丁鱼卡通形象设计（下）",
                "cover_photo_url": "http://127.0.0.1:3000/public/images/other/404.jpg",
                "video_url": null,
                "duration": "06:20",
                "is_study": 0,
                "course_id": 3,
                "is_hot": 0,
                "view_count": null,
                "create_time": "2019-04-09T06:39:23.000Z",
                "update_time": null,
                "delete_time": null,
                "status": 1
            }
        ]
    }
}
```

## 评论

### 课程评论点赞 & 取消点赞

- 请求路径：comment/like
- 请求方法：POST
- 请求参数：

| 参数名     | 参数说明 | 备注                            |
| ---------- | -------- | ------------------------------- |
| comment_id | 评论id   | 请求体携带过去                  |
| is_like    | 是否点赞 | 请求体携带过去 1 不点赞  2 点赞 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": "点赞成功"
}
```

### 评价课程

- 请求路径：comment/create
- 请求方法：POST
- 请求参数：

| 参数名     | 参数说明 | 备注                            |
| ---------- | -------- | ------------------------------- |
| token | 令牌 | 在请求头中带过去          |
| course_id | 课程id | 在请求体中带过去 |
| content | 评价内容 | 在请求体中带过去 |
| score | 分数 | 在请求体中带过去 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": "评价成功"
}
```

## 学习

#### 获取学习进度列表

- 请求路径：study/progress
- 请求方法：GET
- 请求参数：

| 参数名 | 参数说明 | 备注             |
| ------ | -------- | ---------------- |
| token  | 令牌     | 在请求头中带过去 |

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
            "sid": 1,
            "study_hour": 5,
            "study_progress": 33,
            "cid": 1,
            "title": "逻辑思维训练",
            "icon": "http://127.0.0.1:3000/public/images/course/course1.png",
            "class_hour": 15
        },
        {
            "sid": 2,
            "study_hour": 3,
            "study_progress": 30,
            "cid": 2,
            "title": "Scratch编程启蒙",
            "icon": "http://127.0.0.1:3000/public/images/course/course2.png",
            "class_hour": 10
        },
        {
            "sid": 3,
            "study_hour": 6,
            "study_progress": 50,
            "cid": 3,
            "title": "创意手绘班",
            "icon": "http://127.0.0.1:3000/public/images/course/course3.png",
            "class_hour": 12
        },
        {
            "sid": 4,
            "study_hour": 8,
            "study_progress": 67,
            "cid": 4,
            "title": "少儿编程入门全集",
            "icon": "http://127.0.0.1:3000/public/images/course/course4.png",
            "class_hour": 12
        },
        {
            "sid": 5,
            "study_hour": 1,
            "study_progress": 10,
            "cid": 5,
            "title": "一分钟童趣简笔画",
            "icon": "http://127.0.0.1:3000/public/images/course/course5.png",
            "class_hour": 10
        }
    ]
}
```

#### 查询课程是否学习完毕

- 请求路径：study/complete
- 请求方法：GET
- 请求参数：

| 参数名    | 参数说明 | 备注              |
| --------- | -------- | ----------------- |
| token     | 令牌     | 在请求头中带过去  |
| course_id | 课程id   | url参数中携带过去 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    status: 0
    complete: true
}
```

#### 学习课程视频

- 请求路径：study/video
- 请求方法：POST
- 请求参数：

| 参数名    | 参数说明 | 备注             |
| --------- | -------- | ---------------- |
| token     | 令牌     | 在请求头中带过去 |
| course_id | 课程id   | 在请求体中带过去 |
| video_id  | 视频id   | 在请求体中带过去 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    status: 0
    message: "学习成功"
}
```

## 讲师

#### 关注

- 请求路径：/lecturer/follow
- 请求方法：POST
- 请求参数：

| 参数名      | 参数说明 | 备注             |
| ----------- | -------- | ---------------- |
| token       | 令牌     | 在请求头中带过去 |
| lecturer_id | 讲师id   | 通过请求体带过去 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": "关注成功"
}
```

#### 取消关注

- 请求路径：/lecturer/unfollow
- 请求方法：POST
- 请求参数：

| 参数名      | 参数说明 | 备注             |
| ----------- | -------- | ---------------- |
| token       | 令牌     | 在请求头中带过去 |
| lecturer_id | 讲师id   | 通过请求体带过去 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": "取消关注成功"
}
```

## 我的

#### 获取个人信息

- 请求路径：my/info
- 请求方法：GET
- 请求参数：

| 参数名 | 参数说明 | 备注             |
| ------ | -------- | ---------------- |
| token  | 令牌     | 在请求头中带过去 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": {
        "nickname": "酷小鱼",
        "avatar": null,
        "study_hour": 23,
        "follow_count": 3,
        "course_count": 5
    }
}
```

## 下单 & 支付

#### 获取订单信息

- 请求路径：order/info
- 请求方法：GET
- 请求参数：

| 参数名    | 参数说明 | 备注                |
| --------- | -------- | ------------------- |
| course_id | 课程id   | query的方式携带过去 |
| token     | 令牌     | 在请求头中带过去    |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": {
        "id": 9,
        "course_id": 3,
        "user_id": 1,
        "price": 259,
        "pay_type": 1,
        "pay_status": 1,
        "create_time": "2019-05-07T03:44:24.000Z",
        "update_time": "2019-05-07T03:44:24.000Z",
        "delete_time": null,
        "status": 1
    }
}
```

#### 获取订单支付状态

- 请求路径：order/paystatus
- 请求方法：GET
- 请求参数：

| 参数名    | 参数说明 | 备注                |
| --------- | -------- | ------------------- |
| course_id | 课程id   | query的方式携带过去 |
| token     | 令牌     | 在请求头中带过去    |

- 响应参数

| 参数名     | 参数说明 | 备注                 |
| ---------- | -------- | -------------------- |
| status     | 响应状态 | 0:成功  1:服务器异常 |
| message    | 响应体   | 服务器返回的响应体   |
| pay_status | 支付状态 | 0 未支付   1 已支付  |

- 响应数据

```javascript
{
    "status": 0,
    "message": "已支付",
    "pay_status": 1
}
```

#### 创建订单

- 请求路径：order/create
- 请求方法：POST
- 请求参数：

| 参数名    | 参数说明 | 备注                |
| --------- | -------- | ------------------- |
| course_id | 课程id   | 请求体携带过去 |
| price | 价格   | 请求体携带过去 |
| token     | 令牌     | 在请求头中带过去    |

- 响应参数

| 参数名   | 参数说明 | 备注                 |
| -------- | -------- | -------------------- |
| status   | 响应状态 | 0:成功  1:服务器异常 |
| message  | 响应体   | 服务器返回的响应体   |
| order_id | 订单id   | 新生成的订单id       |
| order_number | 订单编号   | 新生成的订单编号       |

- 响应数据

```javascript
{
    "status": 0,
    "message": "创建订单成功",
    "order_id": 10
}
```

#### 支付订单

- 请求路径：order/pay
- 请求方法：POST
- 请求参数：

| 参数名    | 参数说明 | 备注             |
| --------- | -------- | ---------------- |
| order_id | 订单id | 请求体携带过去   |

- 响应参数

| 参数名   | 参数说明 | 备注                 |
| -------- | -------- | -------------------- |
| status   | 响应状态 | 0:成功  1:服务器异常 |
| message  | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": "支付成功"
}
```

#### 请求预付单【微信支付需要使用】

- 请求路径：pay/req_unifiedorder
- 请求方法：POST
- 请求参数：

| 参数名       | 参数说明 | 备注           |
| ------------ | -------- | -------------- |
| order_number | 订单编号 | 请求体携带过去 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |
| payorder | 预付单信息   | 预付单信息（5个参数）   |

- 响应数据

```javascript
{
    "status": 0,
    "message": "请求预付单成功",
    "payorder":{
        nonceStr: "ed0f9WcE1u0vvgiJ"
        package: "prepay_id=wx02004154527818d09584e6f04021771900"
        paySign: "1313FDFCCB5C41D3B29CDDE92D82FFE1"
        signType: "MD5"
        timeStamp: "1559407315"
    }
}
```

#### 微信支付成功

- 请求路径：order/wxpaysuccess
- 请求方法：POST
- 请求参数：

| 参数名       | 参数说明 | 备注           |
| ------------ | -------- | -------------- |
| order_number | 订单编号 | 请求体携带过去 |

- 响应参数

| 参数名  | 参数说明 | 备注                 |
| ------- | -------- | -------------------- |
| status  | 响应状态 | 0:成功  1:服务器异常 |
| message | 响应体   | 服务器返回的响应体   |

- 响应数据

```javascript
{
    "status": 0,
    "message": "更改订单状态成功"
}
```

