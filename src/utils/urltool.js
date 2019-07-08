const path = require('path')
const config = require(path.join(__dirname, '../config/global_config.js'))

/**
 * 拼接静态资源路径
 */
exports.stitchingStaticPath = (originPath = 'images/other/404.jpg') => {
    if (originPath == null){
        originPath = 'images/other/404.jpg'
    }

    // 如果已经是以http或是https开头的，则直接返回，不用拼接了
    if (originPath.startsWith('http')) {
        return originPath
    }
    
    return `${config.api_host}${config.staticPathPrefix}${originPath}`
} 