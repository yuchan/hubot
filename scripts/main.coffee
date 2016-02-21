module.exports = (robot) ->
    robot.router.post '/hubot/ping', (req, res) ->
        res.send 'pong'
              
