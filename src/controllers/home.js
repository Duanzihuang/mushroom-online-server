/**
 * 获取首页轮播图
 */
exports.getSwipers = (req, res) => {
  res.json([
    { id: 1001, img_url: 'http://xxx.png' },
    { id: 1002, img_url: 'http://xxx.png' }
  ])
}
