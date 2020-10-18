import wollok.game.*

object persona {
	
	var property position = game.origin()
	var property image = "pepe2.png"
	
	
	method cambiarImagenPorUnosSegundos() {
		image = "pepita.png"
		game.schedule(400, {image = "pepe2.png"})
	}
	
}
