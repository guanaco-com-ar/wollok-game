import wollok.game.*

object tipito {
  var property position = game.center()
  var property image = "pepetito2.png"

  method irArriba() {
    image = "pepetito1.png"
    position = position.up(1)
    return position
  }
}