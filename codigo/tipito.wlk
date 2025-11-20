import wollok.game.*
import llave.*

class Tipito {
  var property position = game.at(14, 4)
  var property image = "otroPersonajito.png"

  method tipitoHablar() = "¡Hola! ¿Deberia confiar en ti?."
  
  method tipitoTriunfante() = "¡Consegui la llave!"
  
  method tipitoMuyTriunfante() = "¡Muere monstruo, muere!"
}




class Pepito inherits Tipito {

  var property estaVivo = true
  
  method movimiento(){

    keyboard.w().onPressDo({self.position(self.position().up(1))})
    keyboard.s().onPressDo({self.position(self.position().down(1))})
    keyboard.a().onPressDo({self.position(self.position().left(1))})
    keyboard.d().onPressDo({self.position(self.position().right(1))})


  }
}

const tipito = new Tipito()
const pepito = new Pepito(image ="pepito.png")
const invisible = new Pepito (image = "invisible.png")