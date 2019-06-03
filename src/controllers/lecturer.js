const path = require('path')
const db = require(path.join(__dirname, '../db/index.js'))

/**
 * 关注讲师
 */
exports.follow = async (req,res) => {
    if (!req.query.user_id) {
        res.send({
            status:1,
            message:'用户id不为空'
        })

        return
    }

    if (!req.body.lecturer_id){
        res.send({
            status:2,
            message:'讲师id不为空'
        })

        return
    }

    const selectLecturerSql = 'select * from t_follow where user_id = ? and lecturer_id = ?'
    const res1 = await db.execPromise(selectLecturerSql,[req.query.user_id,req.body.lecturer_id])
    if (res1 && res1.length > 0){ // 存在则更改状态
        const res2 = await db.execPromise('update t_follow set is_follow = 1 where user_id = ? and lecturer_id = ?',[req.query.user_id,req.body.lecturer_id])        
        if (res2){
            res.send({
                status:0,
                message:'关注成功'
            })
        }
    } else { // 不存在，则插入
        const res3 = await db.execPromise('insert into t_follow set ?',{
            user_id:req.query.user_id,
            lecturer_id:req.body.lecturer_id,
            is_follow:1
        })

        if (res3){
            res.send({
                status:0,
                message:'关注成功'
            })
        }
    }
}

/**
 * 取消关注讲师
 */
exports.unfollow = async (req,res) => {
    if (!req.query.user_id) {
        res.send({
            status:1,
            message:'用户id不为空'
        })

        return
    }

    if (!req.body.lecturer_id){
        res.send({
            status:2,
            message:'讲师id不为空'
        })

        return
    }

    const updateSql = 'update t_follow set is_follow = 0 where user_id = ? and lecturer_id = ?'
    const res1 = await db.execPromise(updateSql,[req.query.user_id,req.body.lecturer_id])
    if (res1){
        res.send({
            status:0,
            message:'取消关注成功'
        })
    } else {
        res.send({
            status:3,
            message:'取消关注失败'
        })
    }
}