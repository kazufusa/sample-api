class DmmLoader
  @parse: (target)->
    parser.call @, target

  @test: (target)->
    'hello'

  parser = (args)->
    pairinfo(args.json, args.pair)[2][0]

  pairinfo = (json, pair) ->
    re = RegExp pair, 'i'
    a = json['body']['rate'].filter((item, i)->
      item[0].replace(/\//g, '').match re
    )[0]

module.exports = DmmLoader
