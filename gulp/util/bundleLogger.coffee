util = require('gulp-util')
prettyHrtime = require('pretty-hrtime')

color = util.color

startTime = null

module.exports = ->
  start: ->
    startTime = process.hrtime()
    util.log('Running ', color.green("'bundle'") + '...')

  end: ->
    taskTime = process.hrtime(startTime)
    prettyTime = prettyHrtime(taskTime)
    util.log('Finished', color.green("'bundle'") + ' in ' + color.magenta(prettyTime))
