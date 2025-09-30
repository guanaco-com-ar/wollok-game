import wollok.game.*

object tipito {
  var property position = game.at(234,40)
  var property image = "pepito.png"
  

  method mover(direccion){
    position = direccion.cambiarPosicion(position)
  }

}
