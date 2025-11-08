import wollok.game.*
import tipito.*
import personaje.*
import juego.*
import enemigos.*

class Llaves {
  var property centrado = true
  var property image = "keys1.png"

  method position() = if (centrado) game.center() else game.origin()
}

const llaveInicial = new Llaves()