package com.dds.grupo4

import org.junit.Before
import org.junit.Test
import com.dds.grupo4.helper.MailHelper
import java.util.ArrayList
import java.util.List
import org.junit.runner.RunWith
import org.powermock.modules.junit4.PowerMockRunner
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.api.mockito.PowerMockito
import org.mockito.Mockito
import org.junit.Rule
import org.junit.rules.ExpectedException

@RunWith(typeof(PowerMockRunner))
@PrepareForTest(typeof(MailHelper))
class JavaMailTest {

	@Rule
	val ExpectedException expectedEx = ExpectedException.none();

	@Before
	def void setUp() {

		PowerMockito.mockStatic(typeof(MailHelper));
		PowerMockito.when(typeof(MailHelper), "sendMail", Mockito.anyString(), Mockito.anyString(), Mockito.anyList,
			Mockito.anyString(), Mockito.anyString()).thenThrow(
			new RuntimeException("Mockito intervino en el envio de mails"));

	}

	@Test
	def enviarMail() {
		expectedEx.expect(typeof(RuntimeException))
		expectedEx.expectMessage("Mockito intervino en el envio de mails")

		val List<String> to = new ArrayList<String>

		to.add("diego.anazonian@gmail.com")
		to.add("diego.anazonian@gmail.com")
		MailHelper.sendMail("diego.anazonian@gmail.com", "somePassword", to, "subject", "message")
	}

}
