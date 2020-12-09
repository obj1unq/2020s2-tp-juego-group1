import wollok.game.*
import extras.*
import nivel.*
import divisas.*
import personajes.*


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
		argento.chocadoPor(self)
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
object nivelsuperado inherits ImagenPantalla{
	override method image() {
		return "imagen_nivelsuperado.png"
	}
}
class Item {
	const property nombre
	var property valor
	var property potencia
	
	method usarEn(personaje)
	
}
class Arma inherits Item{
	var property position=null
	var property cantidadDeBalas
	const property nombreDeBala
	override method usarEn(personaje){
		personaje.equiparArma(self)

	}
	method dispararEn(_direccion){
		cantidadDeBalas = 0.max(cantidadDeBalas-1)
		const disparo = new DisparoPepe(position=_direccion.mover(self.position()),nombre= nombreDeBala)
		disparo.ejecutarEn(_direccion)
	}

}
class Comida inherits Item{
	override method usarEn(personaje){
		personaje.consumir(self)
	}
}
class Disparo {
	var property position
	const property nombre
	var property image = nombre
	
	method esAtravesable(){
		return true
	}
	
	method teEnvistio(personaje){
		personaje.heridoPor(self)
	}
	method ejecutarEn(_direccion)
}
class DisparoPepe inherits Disparo{
	const property haceDanioAPepe = false
	const property haceDanioAEnemigo = true
	override method ejecutarEn(_direccion){
		image = nombre+_direccion.nombre()+".png"
		game.addVisual(self)
		game.schedule(100, {position = _direccion.mover(position)})
		game.schedule(200, {game.removeVisual(self)})
	}
}
class DisparoEnemigo inherits Disparo{
	const property haceDanioAPepe = true
	const property haceDanioAEnemigo = false
	override method ejecutarEn(_direccion){
		image = nombre+_direccion.nombre()+".png"
		game.addVisual(self)
		game.schedule(500, {position = _direccion.mover(position)})
		game.schedule(600, {game.removeVisual(self)})
	}
}