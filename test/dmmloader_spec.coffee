require('chai').should()
json = require 'test/fixtures/dmm'
parser = require 'dmmloader'

describe 'dmm loader', () ->
  it '.parse json, usdjpy', ->
    parser.parse({ json: json, pair: 'usdjpy'}).should.equal '101.312'
    parser.parse({ json: json, pair: 'USDJPY'}).should.equal '101.312'

  it '.test', ->
    string = parser.test()
    string.should.equal 'hello'

describe 'Mocha + Chai で CoffeeScript を Grunt で自動テスト', () ->

  it '型のチェック', ->
    string = 'string'
    number = 1
    string.should.be.a 'string'
    number.should.be.a 'number'
