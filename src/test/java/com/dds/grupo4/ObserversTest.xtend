package com.dds.grupo4

import com.dds.grupo4.helper.MailHelper
import com.dds.grupo4.tipoDeInscripcion.Estandar
import org.junit.Assert
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import org.junit.runner.RunWith
import org.mockito.Mock
import org.mockito.Mockito
import org.mockito.runners.MockitoJUnitRunner
import org.powermock.api.mockito.PowerMockito
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner
import com.dds.grupo4.tipoDeInscripcion.Solidaria
import org.mockito.internal.verification.AtMost
import org.mockito.verification.VerificationMode
import org.mockito.internal.verification.Times
import static org.mockito.Mockito.*;
import org.mockito.MockitoAnnotations

@RunWith(typeof(PowerMockRunner))
@PrepareForTest(typeof(MailHelper))
class ObserversTest {
	
	Partido partido
	Interesado diego
	Interesado maqi
	Interesado lean
	
	@Before
	def void setUp(){
		MockitoAnnotations.initMocks(this);
		
		partido = new Partido
		
		diego = new Interesado("Diego", "Anazonian", 23, new Estandar)
		maqi = new Interesado("Maximiliano", "Anazonian", 23, new Estandar)
		lean = new Interesado("Leandro", "Mauro", 25, new Solidaria)
		
		PowerMockito.mockStatic(typeof(MailHelper))
		
		doNothing.when(MailHelper)
				
				
	}
	
	@Test
	def void enviarMailsAmigosDelNuevoInteresado(){
		diego.agregarAmigo(maqi)	
		diego.agregarAmigo(lean)
		
		partido.inscribirA(diego)
		
		Mockito.verify(times(0))
	
	}
	
	
}