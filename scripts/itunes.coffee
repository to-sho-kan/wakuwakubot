# Description:
#   Search iTunes' musinc info & images
#
# Commands:
#   wakuwakubot search music <query> - Seach iTunes' musinc info & images

https = require('https')

module.exports = (robot) ->
  robot.hear /search music (.*)/i, (res) ->
    keyword = encodeURIComponent(res.match[1])
    URL = "https://itunes.apple.com/search?term=#{keyword}&country=JP&media=music&limit=5&lang=ja_jp"
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
