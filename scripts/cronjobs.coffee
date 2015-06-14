CronJob = require('cron').CronJob

module.exports = (robot) ->
  cronTest = new CronJob '*/1 * * * *', () =>
    robot.messageRoom 'playground', 'テスト', null, true, 'Asia/Tokyo'

  cronTest.start()
