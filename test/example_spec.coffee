require('chai').should()

describe 'Mocha + Chai で CoffeeScript を Grunt で自動テスト', () ->
  it '型のチェック', ->
    string = 'string'
    number = 1
    string.should.be.a 'string'
    number.should.be.a 'number'
