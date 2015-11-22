# Description:
#   Search iTunes' music info & images
#
# Commands:
#   wakuwakubot search music <query> - Seach iTunes' music info & images
#   wakuwakubot search <num> music <query> - Seach iTunes' music info & images

https = require('https')

getMusicAndSendMessage = (res, keyword, limit=5) ->
  URL = "https://itunes.apple.com/search?term=#{keyword}&country=JP&media=music&limit=#{limit}&lang=ja_jp"
  https.get(URL, (response) ->
    # console.log("statusCode: #{res.statusCode}")
    # console.log("headers: ", res.headers)
    response.on 'data', (d) ->
      slack_message = ""
      results = JSON.parse(d).results
      for result in results
        slack_message += "#{result.collectionCensoredName}\n#{result.artworkUrl100}\n#{result.collectionViewUrl}\n--------------------\n"

      res.send slack_message
  ).on 'error', (e) ->
    console.log(e)

module.exports = (robot) ->
  robot.hear /search music (.*)/i, (res) ->
    keyword = encodeURIComponent(res.match[1])
    getMusicAndSendMessage(res, keyword)

  robot.hear /search (.*) music (.*)/i, (res) ->
    num = res.match[1]
    keyword = encodeURIComponent(res.match[2])
    getMusicAndSendMessage(res, keyword, num)

