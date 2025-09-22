import cosas.*

object camion {
	const property cosas = #{}

	method cosas(){
		return cosas
	}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method todosTienenPesoPar (){
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
		self.validarHayAlMenosUnoDeNivel(nivelPeligrosidad)
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad})
	}

	method lasQueSuperanNivelDePeligrosidad (nivelPeligrosidad){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivelPeligrosidad})
	}

	method cosasMasPeligrosasQue (cosa){
		return self.lasQueSuperanNivelDePeligrosidad (cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRutaDeNivel (nivelPeligrosidad){
		return !self.estaExcedidoDePeso() and self.lasQueSuperanNivelDePeligrosidad(nivelPeligrosidad).isEmpty()
	}

	method tieneAlgoQuePesaEntre (minimo, maximo){
		return cosas.any({cosa => cosa.peso() > minimo and cosa.peso() < maximo})
	}
	
	method cosaMasPesada(){
		self.validarHayAlMenosUnaCosa ()
		return cosas.max({cosa => cosa.peso()})
	}

	method pesosDeCosasCargadas(){
		return cosas.map({cosa => cosa.peso()})
	}

	method totalBultos(){
		return cosas.sum({cosa => cosa.totalBultos()})
	}

	method sufrirAccidente(){
		cosas.forEach({cosa => cosa.sufrirAccidente()})
	}

	method transportar (destino, camino){
		if (camino.superaRequerimientos(self)){
			destino.cargarCosas(cosas)
			cosas.clear()
		}
	}

	method validarHayAlMenosUnaCosa(){
		if (cosas.isEmpty()){
            self.error("El camion actualmente no tiene carga.")
        }
	}

	method validarHayAlMenosUnoDeNivel(nivelPeligrosidad){
		if (!cosas.any({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad})){
            self.error("El camion actualmente no se encuentra cargando una cosa con el nivel de peligrosidad dado.")
        }
	}
}

object almacen{
	const cosas = #{}

	method cosas(){
		return cosas
	}

	method cargarCosas(_cosas){
		cosas.addAll(_cosas)
	}
}

object ruta9{
	method superaRequerimientos (vehiculo){
		return vehiculo.puedeCircularEnRutaDeNivel(20)
	}
}

object caminosVecinales{
	var pesoMaximo = 500

	method superaRequerimientos(vehiculo){
		return vehiculo.peso() < pesoMaximo
	}

	method pesoMaximo(_pesoMaximo){
		pesoMaximo = _pesoMaximo
	}
}