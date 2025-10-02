import personaje.*
import wollok.game.*
import pepito.*
import keybinds.*

object juego {
  var property width = 0
  var property height = 0
  var property boardGround = "background.png"
  var property cellSize = 0
  var property title = "Juego"
  
  method iniciar() {
    self.configuracionInicial()
    game.title("Juego")
    game.addVisualCharacter(tipito)
    game.addVisual(personaje)
    game.say(personaje, personaje.hablar())
  } 

  method configuracionInicial(){
    game.width(257)
    game.height(100)
    game.boardGround("fondoDecente.png")
    game.cellSize(5)
  }

  }


