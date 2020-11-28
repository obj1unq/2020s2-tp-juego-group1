import wollok.game.*

class Bichos {
	
	var property position
	var property zonaMovimiento
	
	method image(){
		return "hijo_macri_der.png"
	}
	method moverAleatorio(){
		
		game.onTick(500, "moverse " , {self.moverSiEstoyEnZona()})
		
	}
	method aleatorio(posicion){
		return [posicion.up(1) ,
				posicion.left(1) ,
				posicion.down(1) ,
				posicion.right(1)].anyOne()
	}
	method moverSiEstoyEnZona(){
		const lugarAMoverse = self.aleatorio(self.position())
		if(self.estoyEnZona(lugarAMoverse , zonaMovimiento)) {position = lugarAMoverse} 
	}
	method cambiarPosicionSiDebo(posicionAIr , zona){
		
		if (self.estoyEnZona(position, zona)) {position = posicionAIr}
	}
	
	method estoyEnZona(lugarAMoverse, lista){
		return lugarAMoverse.x().between(lista.first(), lista.get(1)) and lugarAMoverse.y().between(lista.get(2), lista.get(3))
	}
}
