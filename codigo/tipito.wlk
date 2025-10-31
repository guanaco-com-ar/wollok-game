import wollok.game.*

class Tipito {
  var property position = game.at(14,4)
  var property image = "otroPersonajito.png"
  
  method tipitoHablar() = "¡Hola! ¿Deberia confiar en ti?."

}

class Tipito2 inherits Tipito {
  override method tipitoHablar() = "¿Y esto que es?"
} 

const tipito = new Tipito() 
const pepito = new Tipito2(image = "pepito.png")


