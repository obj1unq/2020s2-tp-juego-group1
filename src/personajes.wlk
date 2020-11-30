import wollok.game.*
import extras.*
import nivel.*
import divisas.*
import items.*


object pepe{
	var property energia = 3
	var property position =game.origin()
	var property direccion = derecha
	var property image = "pepe_der.png"
	var property cuenta = billetera
	var property tieneArma = false
	var armaEquipada 
	const property personajesParaInteractuar = #{moni,mariaElena}
	
	method chequearSiInteractua(){
		if(self.estaAlLadoDe(moni)){
			game.say(moni, moni.mensaje())
		}else if(self.estaAlLadoDe(mariaElena)){
			game.say(mariaElena, mariaElena.mensaje())
		}
	}
	method image() {
		if (tieneArma){return "pepe_" + direccion.nombre() + "_"+armaEquipada.nombre()+".png"
		} else {return "pepe_" + direccion.nombre() + ".png"}
	}
	
	method equiparArma(arma){
		armaEquipada = arma
		tieneArma = true
	}
	method disparar(){
		armaEquipada.position(self.position())
		if(armaEquipada.cantidadDeBalas()==1){
			armaEquipada.dispararEn(direccion)
			tieneArma=false
			armaEquipada=null
		}else{armaEquipada.dispararEn(direccion)}
	}
	method consumir(comida){
		energia += comida.potencia()
	}
	
	method irASiEstaEnElMapa(nuevaPosicion) {
		if(game.getObjectsIn(nuevaPosicion).all({objeto => objeto.esAtravesable()}) and self.estaDentroDelMapa(nuevaPosicion)){
			position = direccion.mover(position)
		}
	}

	method irA(_direccion) {
		direccion = _direccion
		
		self.irASiEstaEnElMapa(direccion.mover(position))
		self.chequearSiInteractua()
		self.chequearSiElNivelEstaSuperado()
	}
		
	method estaDentroDelMapa(nuevaPosicion) {
		return 	nuevaPosicion.x().between(0, game.width() - 1)
		and		nuevaPosicion.y().between(0, game.height() - 2) 
	}
	
	method chocadoPor(algo){
		if(energia == 1){
			self.perder()}
			else{ energia -= 1}
	}
	method heridoPor(algo){
		if(energia == 1){
			self.perder()}
			else{ energia -= 1}
	}
	method agarrarDinero(divisa) {
		cuenta.guardar(divisa)
		if(divisa.valor()==-5){game.say(self, "¡Este billete es trucho! Pero la p...")}
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
		cuenta.sacar(algo.valor())
	}
	method validarDineroEnCuenta(algo) {
		if  (algo.valor() > cuenta.saldo()) {
			self.error("No me alcanza la guitaaa!!")
		}
	}

	method estaAlLadoDe(alguien) {
		return 	self.position().left(1) == alguien.position()
				or self.position().up(1) == alguien.position()
				or self.position().right(1) == alguien.position()
				or self.position().down(1) == alguien.position()
	}
	method perder(){
		game.removeVisual(self)
		game.addVisual(gameover)
		keyboard.enter().onPressDo{game.stop()}	
	}
	method chequearSiElNivelEstaSuperado(){
		if(enemigosDelNivel.enemigosVivos().isEmpty()){
			self.ganar()
		}
	}
	method ganar(){
		game.removeVisual(self)
		game.addVisual(nivelsuperado)
		keyboard.enter().onPressDo{game.stop()}	
	}
	method teEnvistio(personaje){}
}
class Enemigo{
	var property posicionInicial
	var property posicionFinal
	var property image=null
	var property energia
	var property position
	var property direccion
	
	method disparar(){}
	method agarrarDinero(divisa){}
	method esAtravesable(){
		return true
	}
	method moverse(){
		game.onTick(600, "moverse", {self.avanzar()})
		
	}
	method avanzar(){
		if(position == posicionFinal or position == posicionInicial){
			self.cambiarDireccion()
			position = direccion.mover(position)
		}else{ position= direccion.mover(position)}
	}
	method cambiarDireccion(){
		if(direccion.nombre() == "izq"){
			direccion = derecha
		}else if(direccion.nombre() == "atras"){
			direccion = abajo
		}else if(direccion.nombre()== "der"){
			direccion = izquierda
		}else{direccion = arriba}
	}
	method heridoPor(algo){
		self.validarDisparoEnemigoDe(algo)
		self.concretarDanio()
		
	}
	method concretarDanio(){
		if(energia==1){
			self.morir()
		}else{energia-=1}
	}
	method validarDisparoEnemigoDe(algo){
		if(algo.nombre()=="laser_azul_"){
			self.error("Eso no me hace nada")
		}
	}
	method morir(){
		enemigosDelNivel.borrar(self)
		game.removeVisual(self)
		game.removeTickEvent("disparar")
	}
	method chocadoPor(algo){}
	
}
class Bicho inherits Enemigo {
	var property nombre 
	override method image(){
		return nombre+"_"+direccion.nombre()+".png"
	}

	method teEnvistio(argento){
		argento.chocadoPor(self)
	}
}

class Jefe inherits Enemigo{
	var property nombre
	override method image(){
		return nombre+"_"+direccion.nombre()+".png"	
	}
	override method disparar(){
		game.onTick(1000, "disparar", {self.realizarDisparos()})
	}
	method teEnvistio(argento){
		argento.chocadoPor(self)
	}

	method realizarDisparos(){
//		self.realizarDisparosIzquierda()
//		self.realizarDisparosDerecha()
//		self.realizarDisparosArriba()
		self.realizarDisparosAbajo()
	}
	method realizarDisparosIzquierda(){	
		const disp = new Disparo(position = self.position().right(1), nombre = "laser_azul_")
		disp.ejecutarEn(izquierda)	
		
	}
	method realizarDisparosDerecha(){
		const disp = new Disparo(position = self.position().left(1), nombre = "laser_azul_")
		disp.ejecutarEn(derecha)	
		
		}
	method realizarDisparosAbajo(){
		const disp = new Disparo(position = self.position().down(1), nombre = "laser_azul_")
		disp.ejecutarEn(abajo)	
		
	}
	method realizarDisparosArriba(){
		const disp = new Disparo(position = self.position().up(1), nombre = "laser_azul_")
		disp.ejecutarEn(arriba)		
		
		}

}

class Ayuda {
	var property position
	
	method mensaje()
	method nombre()
	method image()
	method esAtravesable(){
		return false
	}
	
}
object moni inherits Ayuda{
	var property comidaDisponible = []
	
	override method mensaje()  {return "Hola Pepe, ¿Querés ésto?"}
	override method nombre(){ return "Moni"}
	override method image(){return "moni.png"}
	
}
object mariaElena inherits Ayuda{
	var property armasDisponibles = []
	
	override method mensaje()  {return "¿Qué pasa bigote? ¿Sos careta?"
	}
	override method nombre(){ return "Maria Elena"}
	override method image(){return "maria_elena.png"}
	
}