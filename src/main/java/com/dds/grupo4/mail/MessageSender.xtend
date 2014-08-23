package com.dds.grupo4.mail

import com.dds.grupo4.mail.Mail

interface MessageSender {
	
	def void send(Mail mail)
}