CronJob = require('cron').CronJob

module.exports = (robot) ->
  new CronJob '*/1 * * * *', () =>
    robot.messageRoom 'playground', 'テスト', null, true, 'Asia/Tokyo'
