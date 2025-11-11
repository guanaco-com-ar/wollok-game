import wollok.game.*

class Fuego {
  var property contadorAnimacion = 1
  var property velocidadDeAnimacion = 16.67
  var property image = "fueguito1.png"
  var property position = game.center()
  
  method animar() {
    game.onTick(velocidadDeAnimacion, "animacionFueguito", { self.animacion() })
  }
  
  method animacion() {
    if (contadorAnimacion != 1) {
      contadorAnimacion -= 1
      image = ("fueguito" + contadorAnimacion) + ".png"
    } else {
      contadorAnimacion = 5
      image = ("fueguito" + contadorAnimacion) + ".png"
    }
  }
}

const fuego = new Fuego()