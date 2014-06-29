(function() {
  var port, respond, restify, server;

  restify = require('restify');

  respond = function(req, res, next) {
    return res.send("" + req.params.name + " said " + req.params.string);
  };

  server = restify.createServer();

  server.get('/hello/:name/:string', respond);

  port = Number(process.env.PORT || 5000);

  server.listen(port, function() {
    return console.log('%s listening at %s', server.name, server.url);
  });

}).call(this);
