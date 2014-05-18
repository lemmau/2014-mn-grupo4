package com.dds.grupo4.helper

import java.util.Properties
import javax.mail.Session
import javax.mail.internet.MimeMessage
import javax.mail.internet.InternetAddress
import javax.mail.Message
import javax.mail.Transport
import java.util.List

class MailHelper {

	static Properties props
	static MimeMessage message
	static Session session
	val static ISO_8859_1 = "ISO-8859-1"
	val static SMTP = "smtp"
	static Transport t

	def static void  sendMail(String from, String pass,List<String> to, String subject, String mess) {

		props = new Properties()

		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.starttls.enable", "true");
		props.setProperty("mail.smtp.port", "587");
		props.setProperty("mail.smtp.user", from);
		props.setProperty("mail.smtp.auth", "true");

		session = Session.getDefaultInstance(props);
		session.setDebug(true);

		message = new MimeMessage(session);

		message.setFrom(new InternetAddress(from))
		
		to.forEach[ destinatary |  message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatary));]
		//message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

		message.setSubject(subject);
		message.setText(mess, ISO_8859_1);

		try {

			t = session.getTransport(SMTP);

			t.connect(from, pass)
			t.sendMessage(message, message.getAllRecipients());
			t.close();

		} catch (Exception ex) {
			//EXCEPTION
		}
		

	}
}
