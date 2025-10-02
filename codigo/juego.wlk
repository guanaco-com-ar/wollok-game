import personaje.*
import wollok.game.*
import pepito.*

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
    game.whenCollideDo(tipito, { elemento =>
    const a = 1 / 0 //Se produce un error
  })
  }

  method configuracionInicial(){
    game.width(257)
    game.height(100)
    game.boardGround("fondoDecente.png")
    game.cellSize(5)
  }

  }


