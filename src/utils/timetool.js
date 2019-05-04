const formatNumber = n => {
    n = n.toString()
    return n[1] ? n : '0' + n
}
/**
 * 将秒转换成分钟
 * input 毫秒 例如 400s = 06:40
 */
exports.secondsConvertMinute = input  => {
    // 分
    const minute = parseInt(input / 60)
    // 秒
    const seconds = input % 60
    
    return formatNumber(minute)+":"+formatNumber(seconds)
}