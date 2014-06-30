(function() {
  var DmmLoader;

  DmmLoader = (function() {
    var pairinfo, parser;

    function DmmLoader() {}

    DmmLoader.parse = function(target) {
      return parser.call(this, target);
    };

    DmmLoader.test = function(target) {
      return 'hello';
    };

    parser = function(args) {
      return pairinfo(args.json, args.pair)[2][0];
    };

    pairinfo = function(json, pair) {
      var a, re;
      re = RegExp(pair, 'i');
      return a = json['body']['rate'].filter(function(item, i) {
        return item[0].replace(/\//g, '').match(re);
      })[0];
    };

    return DmmLoader;

  })();

  module.exports = DmmLoader;

}).call(this);
