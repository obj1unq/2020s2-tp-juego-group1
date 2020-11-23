import wollok.game.*

class Bichos {
	
	var property position = null
	var property zonaMovimiento = []
	
	method image(){
		return "corazon_vivo.png"
	}
	method configurarZonaMovimiento(x1,x2,y1,y2){
		zonaMovimiento.add(x1)
		zonaMovimiento.add(x2)
		zonaMovimiento.add(y1)
		zonaMovimiento.add(y2)
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
