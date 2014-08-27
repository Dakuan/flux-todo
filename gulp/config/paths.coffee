module.exports =
  src:
    coffee: 'src/coffee/**/*.{coffee, cjsx}'
    sass: 'src/scss/**/*.scss'
    images: 'src/images/**/*.{png, jpg, gif}'
    haml: 'src/haml/**/*.haml'
    root: 'src/'

  dst:
    js: 'build/js'
    css: 'build/css'
    images: 'build/images'
    html: 'build/'
    root: 'build/'

  spec: '__tests__'
