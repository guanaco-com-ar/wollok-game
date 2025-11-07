import wollok.game.*
import tipito.*
import personaje.*
import juego.*
import enemigos.*

class Llaves {
  var property position = game.center()
  var property image = "keys1.png"
}

const llaveInicial = new Llaves()

const llaveFinal = new Llaves(image = "keys2.png")