import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		cosas.delete(unaCosa)
	}

	method sonTodosPar (){
		return cosas.all({cosa => cosa.peso() % 2 == 0})
	}

	method hayAlgunoQuePesa (peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}

	method peso(){
		return 1000 + cosas.sum({cosa => cosa.peso()})
	}

	method estaExcedidoDePeso (){
		return self.peso() > 2500
	}

	method elDeNivel (nivelPeligrosidad){
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad})
	}

	method lasQueSuperanNivelDePeligrosidad (nivelPeligrosidad){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivelPeligrosidad})
	}

	method lasQueSonMasPeligrosasQue (cosa){
		return self.lasQueSuperanNivelDePeligrosidad (cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRutaDeNivel (nivelPeligrosidad){
		return !self.estaExcedidoDePeso() and self.lasQueSuperanNivelDePeligrosidad(nivelPeligrosidad).isEmpty()
	}

	method tieneAlgoQuePesaEntre (minimo, maximo){
		return cosas.any({cosa => cosa.peso() > minimo and cosa.peso() < maximo})
	}
	
	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso()})
	}

	method pesosDeCosasCargadas(){
		return cosas.map({cosa => cosa.peso()})
	}

	method totalBultos(){
		return cosas.sum({cosa => cosa.totalBultos()})
	}

	method sufrioAccidente(){
		cosas.forEach({cosa => cosa.sufrioAccidente()})
	}
}

object almacen{
	const cosas = #{}

	method cargarCosas(_cosas){
		cosas.addAll(_cosas)
	}
}

object ruta9{
	method superaRequerimientos (vehiculo){
		return vehiculo.puedeCircularEnRuta(20)
	}
}

object caminosVecinales(){
	var pesoMaximo = 500

	method superaRequerimientos (vehiculo){
		return vehiculo.peso() < pesoMaximo
	}

	method pesoMaximo (_pesoMaximo){
		pesoMaximo = _pesoMaximo
	}
}