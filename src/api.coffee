restify = require 'restify'
 
respond = (req, res, next)->
  res.send "#{req.params.name} said #{req.params.string}"

server = restify.createServer()
server.get '/hello/:name/:string', respond
 
server.listen 8080, ->
  console.log '%s listening at %s', server.name, server.url
