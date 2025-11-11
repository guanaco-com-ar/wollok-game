import wollok.game.*
import llave.*

class Tipito {
  var property position = game.at(14, 4)
  var property image = "otroPersonajito.png"
  
  method tipitoHablar() = "¡Hola! ¿Deberia confiar en ti?."
  
  method tipitoTriunfante() = "¡Consegui la llave!"
  
  method tipitoMuyTriunfante() = "¡Muere monstruo, muere!"
  
  method obtenerLlave() {
    image = "pepitoconllave.png"
    game.say(pepito, self.tipitoTriunfante())
    game.removeVisual(llaveInicial)
  }
  
  method vencerAlEnemigo() {
    if (pepito.image() == "pepitoconllave.png") {
      const pepitoTieneLLave = true
      return pepitoTieneLLave
    } else {
      const pepitoTieneLlave = false
      return pepitoTieneLlave
    }
  }
  
  method evaluacionEstadoProtagonista() {
    game.onTick(10, "evaluacionEstadoProtagonista", { self.vencerAlEnemigo() })
  }
}

class Tipito2 inherits Tipito {
  override method tipitoHablar() = "¿Y esto que es?"
}

const tipito = new Tipito()

const pepito = new Tipito2(image = "pepito.png")