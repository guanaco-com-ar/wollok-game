import wollok.game.*
import llave.*

class Tipito {
  var property position = game.at(14, 4)
  var property image = "otroPersonajito.png"
  
  method tipitoHablar() = "¡Hola! ¿Deberia confiar en ti?."
  
  method tipitoTriunfante() = "¡Consegui la llave!"
  
  method tipitoMuyTriunfante() = "¡Muere monstruo, muere!"
}


const tipito = new Tipito()

const pepito = new Tipito(image = "pepito.png")