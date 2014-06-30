(function() {
  var config, parser, port, request, respond, restify, server, test;

  config = require('config');

  parser = require(config['parser']);

  restify = require('restify');

  request = require('request');

  test = function(req, res, next) {
    return res.send("" + req.params.name + " said " + req.params.string + ".");
  };

  respond = function(req, res, next) {
    return request(config, function(error, response, body) {
      return res.send(parser.parse({
        json: body,
        pair: req.params.pair
      }));
    });
  };

  server = restify.createServer();

  server.get('/hello/:name/:string', test);

  server.get('/rate/:pair/', respond);

  port = Number(process.env.PORT || 5000);

  server.listen(port, function() {
    return console.log('%s listening at %s', server.name, server.url);
  });

}).call(this);
