CronJob = require('cron').CronJob

module.exports = (robot) ->
  cronTest = new CronJob '*/1 * * * *', () =>
    robot.messageRoom 'playground', 'テスト', null, true, 'Asia/Tokyo'

  # cronTest.start()

  wakuWakuAlertMessage = "@channel: waku-waku-weekend!! 始まるよ〜 :smile: "
  wakuWakuAlert = new CronJob '0 10 * * 6,0', ->
    robot.messageRoom 'general', wakuWakuAlertMessage, null, true, 'Asia/Tokyo'
