request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
    robot.router.get '/hubot/ping', (req, res) ->
    	res.send 'pong'
    
    robot.hear /I like pie/i, (res) ->
    	res.emote "makes a freshly baked pie"
              
    robot.respond /jenkins jobs/i, (msg) ->
    	request = msg.http(process.env.JENKINS_URL + "/api/json").get()
    	emojiTbl =
    		'red': "🔴"
    		'blue': "🔵"
    		'undefined': "😴"

    	request (err, res, body) ->
    		if body != null
    			json = JSON.parse body
    			jobs = json['jobs']
    			results = ""
    			for job in jobs
    				results += emojiTbl[job['color']] + " " +job['name'] + " " + job['url'] + "\n"
    			msg.send results
    		else
    			msg.send err

    	
