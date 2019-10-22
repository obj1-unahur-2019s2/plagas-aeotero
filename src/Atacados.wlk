import Plagas.*

class Barrio{
	const property barrio = []
	
	method agregarElemento(elemento){
		barrio.add(elemento)
	}
	
	method sacarElemento(elemento){
		barrio.remove(elemento)
	}
	
	method esCopado(){
		return (barrio.count({b=> b.esBuena()}) > barrio.count({b=> not b.esBuena()}))
	}
}

class Hogar {
	var property nivMugre
	var property nivConfort
	
	method esBuena(){
		return (nivConfort/2 >= nivMugre )
	}
	
	method recibirAtaque(plaga){
		nivMugre = nivMugre + plaga.nivelDeDanio()
	}
}

object nivelProdMed {
	var property nivel = 500
}

class Huerta {
	var property CapProdMed
	const nivel =  nivelProdMed
	
	method esBuena(){
		return (CapProdMed > nivel.nivel())
	}
	
	method recibirAtaque(plaga){
		CapProdMed = CapProdMed * 0.9
		if (plaga.transmiteEnfermedades()){
			CapProdMed = CapProdMed - 10
		}
	}	
}

class Mascota {
	var property nivSalud
	
	method esBuena (){
		return ( nivSalud > 250)
	}
	
	method recibirAtaque(plaga){
		if (plaga.transmiteEnfermedades()){
			nivSalud = 0.max(nivSalud - plaga.nivelDeDanio())
		}
	}
}
