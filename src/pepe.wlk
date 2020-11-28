import wollok.game.*
import extras.*
import nivel.*
import divisas.*
import comidas.*
import items.*

object izquierda {
	method nombre() {return "izq"}
	method mover(posicion) {
		return posicion.left(1)
	}
}

object derecha {
	method nombre() {return "der"}
	method mover(posicion) {
		return posicion.right(1)
	}
}

object arriba {
	method nombre() {return "atras"}
	method mover(posicion) {
		return posicion.up(1)
	}
}

object abajo {
	method nombre() {return "adelante"}
	method mover(posicion) {
		return posicion.down(1)
	}
}

object pepe {
	var property energia = 3
	var property position = game.origin()
	var property cuenta = cuentaCorriente
	var property image = "pepe_adelante.png"
	var property direccion = arriba
	var property tieneArma = false
	var armaEquipada 
	
	
	method image() {
		if (tieneArma){return "pepe_" + direccion.nombre() + "_"+armaEquipada.nombre()+".png"
		} else {return "pepe_" + direccion.nombre() + ".png"}
	}

	method equiparArma(arma){
		armaEquipada = arma
		tieneArma = true
	}
	method consumir(comida){
		energia += comida.potencia()
	}
	
	method irASiEstaEnElMapa(nuevaPosicion) {
		if(game.getObjectsIn(nuevaPosicion).all({objeto => objeto.esAtravesable()}) and self.estaDentroDelMapa(nuevaPosicion)){
			position = direccion.mover(position)
		}
		//if(self.estaDentroDelMapa(nuevaPosicion)) {
		//	position = nuevaPosicion
		//}
	}
	

	method irA(_direccion) {
		direccion = _direccion
		
		self.irASiEstaEnElMapa(direccion.mover(position))
	}
		
	method estaDentroDelMapa(nuevaPosicion) {
		return 	nuevaPosicion.x().between(0, game.width() - 1)
		and		nuevaPosicion.y().between(0, game.height() - 2) 
	}
	
	method heridoPor(proyectil){
		energia -= 1
		game.removeVisual(proyectil)
	}
	method agarrarDinero(divisa) {
		cuenta.depositar(divisa)
		generadorDeDivisas.remover(divisa)
	}
	
	method comprar(algo, alguien) {
		if (self.estaAlLadoDe(alguien)) {
			self.elegirYPagar(algo, alguien)
			algo.usarEn(self)
		}
	}
			
	method elegirYPagar(algo, alguien){
		self.validarDineroEnCuenta(algo)
		game.say(self, "Quiero "+algo.nombre()+", "+alguien.nombre())
		cuenta.extraer(algo.valor())
	}
	method validarDineroEnCuenta(algo) {
		if  (algo.valor() > cuentaCorriente.saldo()) {
			self.error("No me alcanza la guitaaa!!")
		}
	}

	method estaAlLadoDe(alguien) {
		return self.aLaDerechaDe(alguien)
				or self.abajoDe(alguien)
				or self.aLaIzquierdaDe(alguien)
				or self.arribaDe(alguien)
	}
	method aLaDerechaDe(alguien){
		return self.position().left(1) == alguien.position()
	}
	method abajoDe(alguien){
		return self.position().up(1) == alguien.position()
	}
	method aLaIzquierdaDe(alguien){
		return self.position().right(1) == alguien.position()
	}
	method arribaDe(alguien){
		return self.position().down(1) == alguien.position()
	}
	method reaccionar(){
		if (energia > 0) energia -= 1
	}
//	method irALaDerecha() {
//		image = "pepe_der.png"
//		
//		self.irASiEstaEnElMapa(position.right(1))
//	}
	
	
/*	method elegirYPagar(comida) {
		const cafecito = 50
		const milanesa = 100
		const pizza = 250
		const sanguchito = 300
		
		self.validarDineroEnCuenta(comida)
		
		if (comida == cafecito) {
			game.say(self, "Dame un cafecito, Moni " )
			}
		else if (comida == milanesa) {
			game.say(self, "Dame una mila, Moni " )
			} 
		else if (comida == pizza) {
			game.say(self, "Dame una muzza, Moni " )
			}
		else if (comida == sanguchito) {
			game.say(self, "Dame uno de bondiola, Moni " )
			} 
		else { } 
		cuenta.extraer(comida)		
	}
*/
	
/*
	method elegirArmasYPagar(armas) {
		const pistolaLaser = 700
		const escopetaConVeneno = 500
		const lanzaFuegos = 300
		
		self.validarDineroEnCuenta(armas)
		
		if (armas == pistolaLaser) {
			game.say(self, "Quiero esa Pistola Laser!" )
			}
		else if (armas == escopetaConVeneno) {
			game.say(self, "Dame la Escopeta Envenenada!" )
			} 
		else if (armas == lanzaFuegos) {
			game.say(self, "¡¡¡llamas a miiií!!! " )
			}
		else { } 
		cuenta.extraer(armas)
	}
*/

}
/* class Invisible {
	const variantex 
	const variantey
	const invisibleDe 
	
	method position() {
		return game.at(invisibleDe.position().x()+ variantex ,invisibleDe.position().y()+ variantey)
	}
	method nombre(){ invisibleDe.nombre()}
	
	method teEnvistio(argento){
		invisibleDe.vender()
	}
	method image() {
		return "muro.png"
	}
}*/
	
class Ayuda {
	var property position
	
	method mensaje()
	method nombre()
	method image()
	method vender(){
			if (self.estaAlLadoDePepe()){game.say(self, self.mensaje())}
	}
	method estaAlLadoDePepe(){
		return self.estaALaDerechaDePepe()
		or self.estaAbajoDePepe()
		or self.estaALaIzquierdaDePepe()
		or self.estaArribaDePepe()
	}
	method estaALaDerechaDePepe(){
		return self.position().right(1) == pepe.position()
	}
	method estaALaIzquierdaDePepe(){
		return self.position().left(1) == pepe.position()
	}
	method estaAbajoDePepe(){
		return self.position().down(1) == pepe.position()
	}
	method estaArribaDePepe(){
		return self.position().up(1) == pepe.position()
	}
	method esAtravesable(){
		return false
	}
}
object moni inherits Ayuda{
	var property comidaDisponible = []
	
	override method mensaje()  {return "Hola Pepe, tengo esto..."}
	override method nombre(){ return "Moni"}
	override method image(){return "moni.png"}
	
}
object mariaElena inherits Ayuda{
	var property armasDisponibles = []
	
	override method mensaje()  {return "Qué pasa bigote? ... sos careta?"}
	override method nombre(){ return "Maria Elena"}
	override method image(){return "maria_elena.png"}
	
}
