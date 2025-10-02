import wollok.game.*
import pepito.*
import personaje.*
import juego.*




object teclas{
    
    method dialogos(){
    keyboard.p().onPressDo(game.say(tipito, tipito.pepitoHablar()))
    
    }
}