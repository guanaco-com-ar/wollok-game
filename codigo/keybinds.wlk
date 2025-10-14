import wollok.game.*
import tipito.*
import personaje.*
import juego.*




object teclas{
    
    method dialogos(){
    keyboard.p().onPressDo(game.say(tipito, tipito.tipitoHablar()))
    
    }
}