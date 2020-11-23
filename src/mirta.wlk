import wollok.game.*
import personaje.*
import pepe.*

object mirta {
	
	var property position = game.at(5,5)
	var property image = "mirtha.png"
	var property vida = 5
	
	method moverAleatorio(){
		
		game.onTick(4400, "moverse" , {self.moverSiEstoyEnZona()})
		
	}
	method aleatorio(posicion){
		return [posicion.up(1) ,
				posicion.left(1) ,
				posicion.down(1) ,
				posicion.right(1)].anyOne()
	}
	method moverSiEstoyEnZona(){
		const lugarAMoverse = self.aleatorio(self.position())
		if(self.estoyEnZona(lugarAMoverse)) {position = lugarAMoverse} 
	}
	method estoyEnZona(lugarAMoverse){
		return lugarAMoverse.x().between(1, 7) and lugarAMoverse.y().between(1, 7)
	}
	method disparar(){
		game.onTick(2000, "disparar", {self.realizarDisparos()})
		
	}
	method realizarDisparos(){
		self.realizarDisparosIzquierda()
		self.realizarDisparosDerecha()
		self.realizarDisparosArriba()
		self.realizarDisparosAbajo()
	}
	method realizarDisparosIzquierda(){	
		const disp = new Disparo(position = self.position().up(1))
		game.addVisual(disp)
		disp.cambiarPosicionIzquierda()
		disp.cambiarPosicionIzquierda()		
		game.schedule(200, {game.removeVisual(disp)})
	}
	method realizarDisparosDerecha(){
		
		const disp = new Disparo(position = self.position().left(1))
		game.addVisual(disp)
		disp.cambiarPosicionDerecha()
		disp.cambiarPosicionDerecha()		
		game.schedule(200, {game.removeVisual(disp)})
		}
	method realizarDisparosAbajo(){
		
		const disp = new Disparo(position = self.position().down(1))
		game.addVisual(disp)
		disp.cambiarPosicionAbajo()
		disp.cambiarPosicionAbajo()		
		game.schedule(200, {game.removeVisual(disp)})
	}
	method realizarDisparosArriba(){
		
		const disp = new Disparo(position = self.position().right(1))
		game.addVisual(disp)
		disp.cambiarPosicionArriba()
		disp.cambiarPosicionArriba()		
		game.schedule(200, {game.removeVisual(disp)})
		}
	method teEncontro(personaje){
		personaje.reaccionar()
	}
}

class Disparo {
	var property position
	
	method image(){
		return "laser_naranja.png"
	}
	method teEncontro(personaje){
		personaje.reaccionar()
	}
	method cambiarPosicionIzquierda(){
		game.schedule(100, {position = self.position().right(1)} )
	}
	method cambiarPosicionDerecha(){
		game.schedule(100, {position = self.position().left(1)} )	}
	method cambiarPosicionArriba(){
		game.schedule(100, {position = self.position().up(1)} )	}
	method cambiarPosicionAbajo(){
		game.schedule(100, {position = self.position().down(1)} )	}
	method cambiarizqyborrar(disparo){
		self.cambiarPosicionIzquierda()
		game.removeVisual(disparo)
	}
}
