config = require 'config'
parser = require config['parser']
restify = require 'restify'
request = require 'request'
 
test = (req, res, next)->
  res.send "#{req.params.name} said #{req.params.string}."

respond = (req, res, next)->
  request config, (error, response, body)->
    res.send parser.parse {json: body, pair:req.params.pair}

server = restify.createServer()
server.get '/hello/:name/:string', test
server.get '/rate/:pair/', respond

port = Number process.env.PORT || 5000
server.listen port, ->
  console.log '%s listening at %s', server.name, server.url
