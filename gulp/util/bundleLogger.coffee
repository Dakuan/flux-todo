util = require('gulp-util')
prettyHrtime = require('pretty-hrtime')

colors = util.colors

startTime = null

module.exports =
  start: ->
    startTime = process.hrtime()
    util.log('Running ', colors.green("'bundle'") + '...')

  end: ->
    taskTime = process.hrtime(startTime)
    prettyTime = prettyHrtime(taskTime)
    util.log('Finished', colors.green("'bundle'") + ' in ' + colors.magenta(prettyTime))
