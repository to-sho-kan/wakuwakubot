CronJob = require('cron').CronJob

module.exports = (robot) ->
  # cronTest = new CronJob '*/1 * * * *', () =>
  #   robot.messageRoom 'playground', 'テスト', null, true, 'Asia/Tokyo'
  # cronTest.start()

  # wakuWakuAlertMessage = "@channel: waku-waku-weekend!! 始まるよ〜 :smile: "
  wakuWakuAlertMessage = "@toku345: waku-waku-weekend!! 始まるよ〜 :smile: "
  # wakuWakuAlert = new CronJob '0 10 * * 6,0', ->
  # wakuWakuAlert = new CronJob '0 11 * * 6,0', ->
  # wakuWakuAlert = new CronJob '50 12 * * *', ->
  # wakuWakuAlert = new CronJob '*/1 12,13 * * *', =>
  # wakuWakuAlert = new CronJob '*/1 * * * *', () =>
  # wakuWakuAlert = new CronJob '15 13 * * 0,6', () =>
  wakuWakuAlert = new CronJob '00 30 13 * * 0,6', () =>
    # robot.messageRoom 'general', wakuWakuAlertMessage, null, true, 'Asia/Tokyo'
    # robot.messageRoom 'playground', wakuWakuAlertMessage, null, true, 'Asia/Tokyo'
    robot.messageRoom 'playground', wakuWakuAlertMessage, null, true, 'Asia/Tokyo'
  wakuWakuAlert.start()
