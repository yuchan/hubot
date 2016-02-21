module.exports = (robot) ->
    robot.router.get '/hubot/ping', (req, res) ->
        res.send 'pong'
              
