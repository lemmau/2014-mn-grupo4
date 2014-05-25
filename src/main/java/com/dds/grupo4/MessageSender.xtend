package com.dds.grupo4

import com.dds.grupo4.mail.Mail

interface MessageSender {
	
	def void send(Mail mail)
}