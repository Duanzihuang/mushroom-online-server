const path = require('path')
const config = require(path.join(__dirname, '../config/global_config.js'))

/**
 * 拼接静态资源路径
 */
exports.stitchingStaticPath = (originPath = 'images/other/404.jpg') => {
    if (originPath == null){
        originPath = 'images/other/404.jpg'
    }
    
    return `${config.api_host}${config.staticPathPrefix}${originPath}`
} 