import wollok.game.*

object persona {
	
	var property position = game.origin()
	var property image = "pepe_adelante.png"
	
	
	method cambiarImagenPorUnosSegundos() {
		image = "pepe_der_herido.png"
		game.schedule(400, {image = "pepe_adelante.png"})
	}
	
}
