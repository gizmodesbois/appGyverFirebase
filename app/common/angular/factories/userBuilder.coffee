angular.module('common')
.service 'userBuilder', () ->

  randomColor = ->
    colors = [
      'navy'
      'slate'
      'olive'
      'moss'
      'chocolate'
      'buttercup'
      'maroon'
      'cerise'
      'plum'
      'orchid'
    ]
    colors[Math.random() * colors.length >>> 0]

  randomLogo = ->
    logos = [
      'bugs'
      'gooby'
      'dolan'
    ]
    logos[Math.random() * logos.length >>> 0]

  {
    build : () ->
      color = randomColor()
      logo = randomLogo()
      uuid = prompt("guve mi u nime, fagit", "dolan")
      user =
        color: color
        uuid : uuid
        avatar : 'images/' + logo + '.jpg'
  }
