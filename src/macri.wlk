import wollok.game.*

object macri {
	
	var property position = game.at(5,5)
	
	method image (){
		return "macri.jpg"
	}
	method moverAleatorio(){
		
		
		game.onTick(4400, "moverse " , {self.moverSiEstoyEnZona()})
		
	}
	method aleatorio(posicion){
		return [game.at(posicion.x() - 1 , posicion.y()) ,
				game.at(posicion.x() + 1 , posicion.y()) ,
				game.at(posicion.x() , posicion.y() - 1) ,
				game.at(posicion.x() , posicion.y() + 1)].anyOne()
	}
	method moverSiEstoyEnZona(){
		const lugarAMoverse = self.aleatorio(self.position())
		if(self.estoyEnZona(lugarAMoverse)) {position = lugarAMoverse} 
	}
	method estoyEnZona(lugarAMoverse){
		return lugarAMoverse.x().between(1, 10) and lugarAMoverse.y().between(1, 10)
	}
	method disparar(){
		game.onTick(2000, "disparar", {self.realizarDisparos()})
	}
	method realizarDisparos(){
		
		self.realizarDisparo(new Disparo(position = game.at(self.position().x() - 1, self.position().y())))
		game.schedule(50, {self.realizarDisparo(new Disparo(position = game.at(self.position().x() - 2, self.position().y())))})
		game.schedule(100, {self.realizarDisparo(new Disparo(position = game.at(self.position().x() - 3, self.position().y())))})
	}
	
	method realizarDisparo(disparo){
		game.addVisual(disparo)
		game.schedule(50 , {game.removeVisual(disparo)})
	}
}

class Disparo {
	var property position = null
	
	method image(){
		return "muro.png"
	}
	method posicion(posicion){
		position = posicion
	}
}
