package com.dds.grupo4

import org.junit.Test
import org.junit.Before
import org.junit.Assert;
import org.powermock.modules.junit4.PowerMockRunner
import org.junit.runner.RunWith
import com.dds.grupo4.helper.MailHelper
import org.powermock.core.classloader.annotations.PrepareForTest
import static org.powermock.api.mockito.PowerMockito.*;
import org.mockito.internal.verification.*;
import static org.mockito.Mockito.*
import com.dds.grupo4.tipoDeInscripcion.Estandar
import com.dds.grupo4.tipoDeInscripcion.Solidaria
import static org.easymock.EasyMock.*
import org.easymock.EasyMock
import org.mockito.Mockito
import com.dds.grupo4.observers.NotificarAmigos

@RunWith(typeof(PowerMockRunner))
@PrepareForTest(typeof(MailHelper))
class PartidoObserverTest {
	Partido partido
	Interesado diego
	Interesado maqi
	Interesado osva
	Interesado lean
	NotificarAmigos avisarAmigos
	
	@Before
	def void setUp() {
		mockStatic(MailHelper)
		doNothing().when(MailHelper)
		
		partido = new Partido
		avisarAmigos = new NotificarAmigos

		diego = new Interesado("Diego", "Anazonian", 23, new Estandar)
		maqi = new Interesado("Maximiliano", "Anazonian", 23, new Estandar)
		lean = new Interesado("Leandro", "Mauro", 25, new Solidaria)

	}

	@Test
	def corroboroComoPrioridadDeJugadoresEnListaDeInt() {
		partido.observers.add(avisarAmigos)
		
		diego.password = ""
		diego.mail = ""
		diego.agregarAmigo(maqi)
		partido.inscribirA(diego)

		verifyStatic(Mockito.times(444))
		
		
	}

}
