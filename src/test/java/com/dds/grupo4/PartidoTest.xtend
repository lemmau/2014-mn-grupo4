package com.dds.grupo4


import org.junit.Test
import org.junit.Assert
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Solidaria
import org.junit.Before

class PartidoTest {
	
	
//	@Before
//	def setUp(){
//		var Partido partido = new Partido;
//		
//		val Interesado diego = new Interesado("Diego","Anazonian",new Estandar);
//		val Interesado maqi = new Interesado("Maximiliano","Anazonian",new Estandar);
//		val Interesado osva = new Interesado("Osva","Cornelli",new Condicional);
//		val Interesado lean = new Interesado("Leandro","Mauro",new Solidaria);
//	}
	
	@Test
	def corroborarDesplazamientoEnLaListaFinalDeJugadores(){
		val Partido partido = new Partido;
		
		val Interesado diego = new Interesado("Diego","Anazonian",22,new Estandar);
		val Interesado maqi = new Interesado("Maximiliano","Anazonian",13,new Estandar);
		val Interesado osva = new Interesado("Osva","Cornelli",32,new Condicional);
		val Interesado lean = new Interesado("Leandro","Mauro",19,new Solidaria);
				
		//partido.inscribirA(osva);		
		partido.inscribirA(diego);
		partido.inscribirA(osva);		
		partido.inscribirA(maqi);
		partido.inscribirA(lean);
				
		Assert.assertEquals(partido.interesados.get(0),maqi);
		Assert.assertEquals(partido.interesados.get(1),diego);
		Assert.assertEquals(partido.interesados.get(2),lean);
		Assert.assertEquals(partido.interesados.get(3),osva);
				
	}
	
	@Test
	def siAgregoDiezEstandarALoUltimoEsosSonLosQueDebenQuedarComoJugadoresFinales(){
		val Partido partido = new Partido;
		
		val Interesado osva = new Interesado("Osva","Cornelli",32,new Condicional);
		val Interesado diego = new Interesado("Diego","Anazonian",22,new Estandar);
		
		partido.inscribirA(osva);
		
		while(partido.interesados.size <= 11){
			partido.inscribirA(diego);		
		}
				
		
		Assert.assertTrue(!partido.interesados.subList(0,10).contains(osva))		
			
	}
	
}