import wollok.game.*
import extras.*
import nivel.*
import divisas.*
import comidas.*
import pepe.*

class Obstaculo {
	const property image
	var property position
	method esAtravesable(){
		return false
	}
	method dibujarObstaculo(){
		game.addVisual(self)
	}
	
}

class Columna inherits Obstaculo{
	var property elementosDeColumna = []
	
	method dibujarColumna(){
		elementosDeColumna.forEach({elemento => elemento.dibujarObstaculo()})
	}
	method crearColumna(xInicial, yInicial, tamanio,imagen){
		(0..(tamanio)).forEach({iterador => elementosDeColumna.add(new Obstaculo(image=imagen,position=game.at(xInicial,yInicial+iterador)))})
	}
	
}