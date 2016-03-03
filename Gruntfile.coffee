module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    coffee:
      src:
        options:
          bare: true
        files:
          'lib/simditor-toolbutton.js': 'src/simditor-toolbutton.coffee'
    watch:
      src:
        files: ['src/*.coffee','demo.html']
        tasks: ['coffee:src', 'umd']

    umd:
      all:
        src: 'lib/simditor-toolbutton.js'
        template: 'umd'
        amdModuleId: 'simditor-toolbutton'
        objectToExport: 'SimditorToolButton'
        globalAlias: 'SimditorToolButton'
        deps:
          'default': ['$', 'SimpleModule','Simditor']
          amd: ['jquery', 'simple-module', 'simditor']
          cjs: ['jquery', 'simple-module', 'simditor']
          global:
            items: ['jQuery', 'SimpleModule','Simditor']
            prefix: ''

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-umd'

  grunt.registerTask 'default', ['coffee', 'umd', 'watch']