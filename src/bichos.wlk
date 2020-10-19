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
	method movimientoAleatorio(){
		game.onTick(500, "movimientoAleatorio", {self.aleatorio()})
	}
	method aleatorio(){
		
		var posicion = [position.up(1) ,
				position.left(1) ,
				position.down(1) ,
				position.right(1)].anyOne()
				
		self.cambiarPosicionSiDebo(posicion, zonaMovimiento)
	}
	
	method cambiarPosicionSiDebo(posicionAIr , zona){
		
		if (self.estoyEnZona(position, zona)) self.cambiar(posicionAIr)
	}
	method cambiar(posicion){
		
		game.schedule(60, {position = posicion})
	}
	method estoyEnZona(lugarAMoverse, lista){
		return lugarAMoverse.x().between(lista.first(), lista.get(1)) and lugarAMoverse.y().between(lista.get(2), lista.get(3))
	}
}
