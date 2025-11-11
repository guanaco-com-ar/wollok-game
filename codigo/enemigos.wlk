import wollok.game.*

class Enemigo {
  var property position = game.at(2, 2)
  var property image = "result_boiled.png"
  
  method perseguir() {
    const x = 2.randomUpTo(game.width() - 3).truncate(0)
    const y = 2.randomUpTo(10).truncate(0)
    position = game.at(x, y)
  }
  
  method matarTexto() = "¡Te atrape, maldito!"
}

class Fantasmas inherits Enemigo {
  override method matarTexto() = "Buhhhh"
}

const enemigo1 = new Enemigo()

const enemigo2 = new Fantasmas(image = "masenemigoss2.png")

const enemigo3 = new Fantasmas(image = "masenemigoss1.png")