restify = require 'restify'
 
respond = (req, res, next)->
  res.send "#{req.params.name} said #{req.params.string}"

server = restify.createServer()
server.get '/hello/:name/:string', respond

port = Number process.env.PORT || 5000
server.listen port, ->
  console.log '%s listening at %s', server.name, server.url
