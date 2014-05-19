package com.dds.grupo4

import org.junit.Test
import org.junit.Before
import org.junit.Assert
import com.dds.grupo4.tipoDeInscripcion.Estandar
import org.joda.time.DateTime
import org.junit.runner.RunWith
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner
import static org.powermock.api.mockito.PowerMockito.*
import com.dds.grupo4.tipoDeInscripcion.Condicional
import com.dds.grupo4.tipoDeInscripcion.Solidario

@RunWith(typeof(PowerMockRunner))
@PrepareForTest(typeof(DateTime))
class PartidoTest {

	Partido partido
	Interesado diego
	Interesado maqi
	Interesado osva
	Interesado osva2
	Interesado lean
	Interesado pepe
	Interesado gonza
	(Partido)=>Boolean condicionInteresadoCondicional
	(Partido)=>Boolean condicionPorFecha
	Infraccion infraccion
	
	@Before
	def void setUp() {
		partido = new Partido
		
		mockStatic(typeof(DateTime));
		when(DateTime.now).thenReturn(new DateTime(2014,5,21,14,32))
		
		infraccion = new Infraccion("un motivo",DateTime.now.plusDays(5))

		condicionInteresadoCondicional = [Partido partido|
			partido.interesados.filter[interesado|interesado.getEdad > 22].size > 2]
			
		condicionPorFecha = [Partido partido|
			!(partido.fechaInicio.getDayOfMonth.equals(21))]	

		partido.setFechaInicio(DateTime.now)
		
		diego = new Interesado("Diego", "Anazonian", 23, new Estandar)
		maqi = new Interesado("Maximiliano", "Anazonian", 23, new Estandar)
		gonza = new Interesado("Gonzalo", "Franchino", 33, new Estandar)
		osva = new Interesado("Osva", "Cornelli", 32, new Condicional(condicionInteresadoCondicional))
		osva2 = new Interesado("Osva", "Cornelli", 22, new Condicional(condicionPorFecha))
		lean = new Interesado("Leandro", "Mauro", 25, new Solidario)
		pepe = new Interesado("Leandro", "Mauro", 25, new Solidario)

	}
	
	@Test
	def corroboroPosicionesDeInteresadosSegunOrdenDeInscripciones() {

		partido.inscribirA(diego)
		partido.inscribirA(maqi)
		partido.inscribirA(lean)
		partido.inscribirA(osva)
		
		Assert.assertEquals(partido.interesados.get(0), diego)
		Assert.assertEquals(partido.interesados.get(1), maqi)
		Assert.assertEquals(partido.interesados.get(2), lean)
		Assert.assertEquals(partido.interesados.get(3), osva)

	}

	@Test(expected=typeof(RuntimeException))
	def void corroboroExceptionCuandoHayMenosDeDiezJugadores() {

		partido.inscribirA(diego)
		partido.inscribirA(osva)
		partido.inscribirA(maqi)
		partido.inscribirA(lean)

		partido.jugadoresFinales
	}

	@Test
	def siAgregoDiezEstandarALoUltimoEsosSonLosQueDebenQuedarComoJugadoresFinales() {
		
		while (partido.interesados.size < 10) {
			partido.inscribirA(diego)
		}

		partido.inscribirA(osva)

		Assert.assertTrue(!partido.jugadoresFinales.contains(osva))
	}
	
	@Test
	def probarReemplazoDeJugadorCuandoSeLoDaDeBaja(){
		diego.agregarAmigo(maqi)
		
		partido.inscribirA(diego)
		partido.darDeBajaA(diego,infraccion)
		
		Assert.assertTrue(partido.interesados.contains(maqi))
		Assert.assertFalse(diego.getInfracciones.contains(infraccion))
	}
	
	@Test
	def multarConInfraccionSiNoTieneReemplazante(){
		partido.inscribirA(diego)
		partido.darDeBajaA(diego,infraccion)	
	
		Assert.assertTrue(diego.getInfracciones.contains(infraccion))				
					
	}
	
	def comprobarSiInteresadoCondicionalEsDeplazadoTresLugaresLuegoDeInscribirTresNuevos() {

		partido.inscribirA(diego)	// estandar
		partido.inscribirA(maqi)	// estandar
		partido.inscribirA(lean)	// estandar
		partido.inscribirA(osva)	// CONDICIONAL
		partido.inscribirA(lean)	// solidario
		partido.inscribirA(pepe)	// solidario

		Assert.assertEquals(partido.interesados.get(5), osva)
	}

	@Test
	def comprobarSiCondicionSeAplicaAlPartidoConExito() {

		partido.inscribirA(gonza)
		partido.inscribirA(maqi)
		partido.inscribirA(lean)
		partido.inscribirA(osva)	

		Assert.assertEquals(osva.estasConfirmado(partido), true)
	}
	
	@Test
	def comprobarUmbralDe10Jugadores() {

		gonza.inscribite(partido)
		maqi.inscribite(partido)
		lean.inscribite(partido)
		osva.inscribite(partido)
		gonza.inscribite(partido)
		maqi.inscribite(partido)
		lean.inscribite(partido)
		osva.inscribite(partido)
		osva.inscribite(partido)
		gonza.inscribite(partido)
		maqi.inscribite(partido)
		lean.inscribite(partido)
		osva.inscribite(partido)
		gonza.inscribite(partido)
		maqi.inscribite(partido)
		lean.inscribite(partido)
		osva.inscribite(partido)		

		Assert.assertEquals(partido.jugadoresFinales.size, 10)

	}	
	
	@Test
	def chequearEnvioDeMailsDeAmigos(){
		diego.agregarAmigo(osva)
		diego.agregarAmigo(lean)
		diego.mail = ("diego.anazonian@gmail.com")
		
		diego.inscribite(partido)
		
		Assert.assertEquals(osva.quantityMailsFromPerson(diego),1)
		Assert.assertEquals(lean.quantityMailsFromPerson(diego),1)	
	}	
	
	@Test
	def chequeoMockDeFecha(){
		val DateTime dateTimeMocked = DateTime.now()
		
		Assert.assertEquals(dateTimeMocked.getYear,2014)
		Assert.assertEquals(dateTimeMocked.getMonthOfYear,5)
		Assert.assertEquals(dateTimeMocked.getDayOfMonth,21)
		Assert.assertEquals(dateTimeMocked.getHourOfDay,14)
		Assert.assertEquals(dateTimeMocked.getMinuteOfHour,32)
	}
	
	@Test
	def validarQueUnInteresadoCondicionalAunqueEsteEnListaDeJugadoresNoJueguePorSucondicionImpuestaAlPartido(){
		lean.inscribite(partido)
		osva2.inscribite(partido)
		
		while(partido.interesados.size < 10){
			lean.inscribite(partido)
		}
		
		osva.inscribite(partido)
		
		Assert.assertFalse(partido.jugadoresFinales.contains(osva2))
				
		
	}
	
	@Test
	def chequearLaNotificacionAlAdminAlLLegarALosDiezInteresadosConfirmados(){
		partido.setMail("partidoUno@gmail.com")
		partido.setAdmin(new Admin)
		
		while(partido.interesados.size <= 10){
			lean.inscribite(partido)
		}	
		
		Assert.assertTrue(partido.getAdmin.getMailsRecibidos.keySet.contains(partido.getMail))
		Assert.assertEquals(partido.getAdmin.mailsRecibidos.get(partido.getMail),1)
	}
	
	
}
