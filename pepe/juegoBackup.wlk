import wollok.game.*

object tipito{
  var property position = game.center()
  var property image = "pepetito2.png"

  method irArriba(){
    const subirPosicion = position.up(1)

    if (position == subirPosicion){

      image = "pepetito2.png"
      }

      
    
  }
}