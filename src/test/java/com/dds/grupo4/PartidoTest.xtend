package com.dds.grupo4

import org.junit.Test
import org.junit.Assert
import org.junit.Before
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Solidaria

class PartidoTest {
	
	Partido partido 
	Interesado diego
	Interesado maqi
	Interesado osva
	Interesado lean
	 
	@Before
	def void setUp(){
		partido = new Partido
		
		diego = new Interesado("Diego","Anazonian",22,new Estandar)
		maqi = new Interesado("Maximiliano","Anazonian",13,new Estandar)
		osva = new Interesado("Osva","Cornelli",32,new Condicional(null))
		lean = new Interesado("Leandro","Mauro",19,new Solidaria)
	}
	
	@Test
	def corroboroComoPrioridadDeJugadoresEnListaDeInt(){
				
		
		partido.inscribirA(diego);
		partido.inscribirA(osva);		
		partido.inscribirA(maqi);
		partido.inscribirA(lean);
				
		Assert.assertEquals(partido.interesados.get(0),maqi);
		Assert.assertEquals(partido.interesados.get(1),diego);
		Assert.assertEquals(partido.interesados.get(2),lean);
		Assert.assertEquals(partido.interesados.get(3),osva);
				
	}
	
//	@Test (expected = RuntimeException)
//	def corroboroExceptionCuandoHayMenosDeDiezJugadores(){
//				
//		//partido.inscribirA(osva);
//		partido.inscribirA(diego);
//		partido.inscribirA(osva);		
//		partido.inscribirA(maqi);
//		partido.inscribirA(lean);
//				
//		partido.jugadoresFinales
//				
//	}
	
	@Test
	def siAgregoDiezEstandarALoUltimoEsosSonLosQueDebenQuedarComoJugadoresFinales(){
		val Partido partido = new Partido;
		
		val Interesado osva = new Interesado("Osva","Cornelli",32,new Condicional(null));
		val Interesado diego = new Interesado("Diego","Anazonian",22,new Estandar);
		
		partido.inscribirA(osva);
		
		while(partido.interesados.size <= 11){
			partido.inscribirA(diego);		
		}
				
		
		Assert.assertTrue(!partido.jugadoresFinales.contains(osva))		
			
	}
	
}