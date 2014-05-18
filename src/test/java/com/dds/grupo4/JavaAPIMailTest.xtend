package com.dds.grupo4

import org.junit.Before
import org.junit.Test
import com.dds.grupo4.helper.MailHelper
import org.junit.runner.RunWith
import org.powermock.modules.junit4.PowerMockRunner
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.api.mockito.PowerMockito
import org.mockito.Mockito
import org.junit.Rule
import org.junit.rules.ExpectedException
import com.google.common.collect.Lists

@RunWith(typeof(PowerMockRunner))
@PrepareForTest(typeof(MailHelper))
class JavaAPIMailTest {

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


		MailHelper.sendMail("diego.anazonian@gmail.com", "somePassword", Lists.newArrayList("toSomeone@gmail.com"), "subject", "message")
	}

}
