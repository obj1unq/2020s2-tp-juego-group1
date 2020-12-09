import wollok.game.*
import divisas.*
import personajes.*
import extras.*
import items.*

	const arma1 = new Arma(nombre = "arma1", nombreDeBala= "laser_verde_",valor = 10, potencia = 1, cantidadDeBalas= 5)
	const arma2 = new Arma(nombre = "arma2", nombreDeBala= "laser_amarillo_", valor = 20, potencia = 2, cantidadDeBalas= 7)
	const arma3 = new Arma(nombre = "arma3", nombreDeBala= "laser_naranja_",valor = 30, potencia = 3, cantidadDeBalas= 10)

	const cafecito = new Comida(nombre = "cafecito", valor = 10, potencia = 1)
	const pizza = new Comida(nombre = "pizza", valor = 15, potencia = 2)
	const milanesa = new Comida(nombre = "milanesa", valor = 20, potencia = 3)
	const sanguchito = new Comida(nombre = "sanguchito", valor = 20, potencia = 3)

	const auto1 = new ObstaculoMovimiento(image= "auto_verde_der.png", position=game.at(0,1),posicionInicial= game.at(0,1), posicionFinal=game.at(18,1))
	const auto2 = new ObstaculoMovimiento(image= "auto_marron_izq.png", position=game.at(18,11),posicionInicial= game.at(18,11), posicionFinal=game.at(0,11))

	const obelisco = new Obstaculo(image= "obelisco.png", position= game.at(9, 12))
	const arbol1 = new Obstaculo(image="arbol1.png", position= game.at(6,12))
	const arbol2 = new Obstaculo(image="arbol2.png", position= game.at(9,2))
	const arbol3 = new Obstaculo(image="arbol2.png", position= game.at(5,2))
	const arbol4 = new Obstaculo(image="arbol2.png", position= game.at(12,2))
	const arbol5 = new Obstaculo(image="arbol1.png", position= game.at(12,12))
	const arbol6 = new Obstaculo(image="arbol2.png", position= game.at(5, 9))
	const arbol7 = new Obstaculo(image="arbol2.png", position= game.at(9, 9))
	const arbol8 = new Obstaculo(image="arbol2.png", position= game.at(12, 9))
	const arbusto = new Obstaculo(image="arbusto.png", position= game.at(9,6))
	const arbusto2 = new Obstaculo(image="arbusto.png", position= game.at(12,6))
	const arbusto3 = new Obstaculo(image="arbusto.png", position= game.at(5,6))
	const corazon1= new Corazon(position = game.at(1,13) , corazonPepe = 1)
	const corazon2= new Corazon(position = game.at(2,13) , corazonPepe = 2)
	const corazon3= new Corazon(position = game.at(3,13) , corazonPepe = 3)
	const bicho1 = new Bicho(nombre = "hijo_mirtha", posicionInicial= game.at(3,2),posicionFinal=game.at(3,9), position = game.at(3,5),direccion= arriba, energia=3)
	const bicho2 = new Bicho(nombre = "hijo_mirtha", posicionInicial= game.at(7,2),posicionFinal=game.at(7,9), position = game.at(7,8),direccion= abajo, energia=3)
	const bicho3 = new Bicho(nombre = "hijo_macri", posicionInicial= game.at(10,2),posicionFinal=game.at(10,9), position = game.at(10,3),direccion= arriba,energia=3)
	const bicho4 = new Bicho(nombre = "hijo_macri", posicionInicial= game.at(15,2),posicionFinal=game.at(15,9), position = game.at(15,8),direccion= abajo, energia=3)
	const mirtha = new Jefe(nombre= "mirtha", position= game.at(1,10), posicionInicial=game.at(0,10), posicionFinal=game.at(8,10), direccion=derecha, energia=5)
	const macri = new Jefe(nombre= "macri", position= game.at(17,10), posicionInicial=game.at(18,10), posicionFinal=game.at(10,10), direccion=izquierda, energia=5)
	


object inicio{
	method iniciarNivel(){
		
		game.title("Pepe vs Los Alienígenas")
		game.height(14)
		game.width(19)
		game.boardGround("escenarioobelisco.jpg")
		game.addVisual(tituloInicio)
		keyboard.enter().onPressDo{nivel1.iniciar()}
	}
}
object nivel1 {
	
	method iniciar() {
		game.clear()
		columna.crearColumna(0,3, 6, "objeto_transparente.png")
		columna.crearColumna(1,3, 6, "objeto_transparente.png")
		columna.crearColumna(2,3, 6, "objeto_transparente.png")
		columna.crearColumna(16,3, 6, "objeto_transparente.png")
		columna.crearColumna(17,3, 6, "objeto_transparente.png")
		columna.crearColumna(18,3, 6, "objeto_transparente.png")
		
		moni.position(game.at(5,4)) 
		moni.comidaDisponible([cafecito, pizza, milanesa, sanguchito])

		mariaElena.position(game.at(12,4))
		mariaElena.armasDisponibles([arma1, arma2, arma3])
		
		game.addVisual(corazon1)
		game.addVisual(corazon2)
		game.addVisual(corazon3)
		
		game.addVisual(billetera)
		game.addVisual(auto1)
		auto1.moverse()
		game.addVisual(auto2)
		auto2.moverse()
		
		game.addVisual(pepe)
		game.onTick(3000,"crearDivisas",{generadorDeDivisas.crearDivisa()})
		game.addVisual(moni)
		game.addVisual(mariaElena)
		game.addVisual(obelisco)
		game.addVisual(arbol1)
		game.addVisual(arbol2)
		game.addVisual(arbol3)
		game.addVisual(arbol4)
		game.addVisual(arbol5)
		game.addVisual(arbol6)
		game.addVisual(arbol7)
		game.addVisual(arbol8)
		game.addVisual(arbusto)
		game.addVisual(arbusto2)
		game.addVisual(arbusto3)
		
		game.addVisual(bicho1)
		bicho1.moverse()
		//game.addVisual(bicho2)
		//bicho2.moverse()
		//game.addVisual(bicho3)
		//bicho3.moverse()
		//game.addVisual(bicho4)
		//bicho4.moverse()
		
		game.addVisual(mirtha)
		mirtha.moverse()
		mirtha.disparar()
	  //game.addVisual(macri)
		//macri.moverse()
		//macri.disparar()

		enemigosDelNivel.enemigosVivos(#{mirtha,bicho1})
		config.configurarTeclas()
		config.configurarColisiones(pepe)
		config.configurarColisiones(mirtha)
		config.configurarColisiones(bicho1)
		/*config.configurarColisiones(bicho2)
		config.configurarColisiones(bicho3)
		config.configurarColisiones(bicho4)
		config.configurarColisiones(macri)*/
	}
}

object config {
	
	method configurarTeclas() {
		keyboard.left().onPressDo({pepe.irA(izquierda)})
		keyboard.right().onPressDo({pepe.irA(derecha)})
		keyboard.up().onPressDo({pepe.irA(arriba)})
		keyboard.down().onPressDo({pepe.irA(abajo)})
				
		keyboard.a().onPressDo({pepe.comprar(cafecito, moni)})
		keyboard.s().onPressDo({pepe.comprar(milanesa, moni)})
		keyboard.d().onPressDo({pepe.comprar(pizza, moni)})
		keyboard.f().onPressDo({pepe.comprar(sanguchito, moni)})
		
		keyboard.q().onPressDo({pepe.comprar(arma1, mariaElena)})
		keyboard.w().onPressDo({pepe.comprar(arma2, mariaElena)}) 
		keyboard.e().onPressDo({pepe.comprar(arma3, mariaElena)})
		
		keyboard.space().onPressDo({pepe.disparar()})
								
	}
	
	method configurarColisiones(personaje) {
		game.onCollideDo(personaje, {algo => algo.teEnvistio(personaje)})
	}
}