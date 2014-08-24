notify = require('gulp-notify')

module.exports = (args...) ->
  notify.onError({
    title: 'Compile error',
    message: "<%= error.message %>"
  }).apply(@, args)

  @emit('end')
