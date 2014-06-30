module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
        files: [
          expand: true
          cwd: 'src'
          src: '**/*.coffee'
          dest: '.'
          ext: '.js'
        ]
    coffeelint:
      app: 'src/**/*.coffee'
    simplemocha:
      all:
        src: ['test/**/*.coffee']
      options:
        reporter: 'nyan'
        ui: 'bdd'
    watch:
      files: [
        'Gruntfile.coffee',
        'src/**/*.coffee',
        'test/**/*.coffee'
      ]
      tasks: [
        'coffeelint',
        'coffee',
        'simplemocha'
      ]
      options:
        interrupt: yes

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-simple-mocha'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', [
    'watch',
    'coffeelint',
    'coffee',
    'simplemocha'
  ]
