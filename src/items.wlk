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
	
}
class ObstaculoMovimiento inherits Obstaculo{
	var property posicionInicial
	var property posicionFinal
	
	method avanzarSegunDireccion(){
		if(posicionInicial.x()== 18){
			position = position.left(1)
		}else(position = position.right(1))
	}
	method avanzar(){
		if(position == posicionFinal){
			position = posicionInicial
		}else{self.avanzarSegunDireccion()}
	}
	method moverse(){
		game.onTick(100, "moverse", {self.avanzar()})
	}
	override method esAtravesable(){
		return true
	}
	method teEnvistio(argento){
		argento.heridoPor(self)
	}
}

object columna{
	
	method crearColumna(xInicial, yInicial, tamanio,imagen){
		(0..(tamanio)).forEach({iterador => game.addVisual(new Obstaculo(image=imagen,position=game.at(xInicial,yInicial+iterador)))})
	}
	
}

class ImagenPantalla {
	const property position = game.origin()
	const property image 
	
}
object gameover inherits ImagenPantalla{
	override method image() {
		return "imagen_gameover.png"
	}
}
object tituloInicio inherits ImagenPantalla {
	override method image() {
		return "pantalla_titulo.jpg"
	}
}
