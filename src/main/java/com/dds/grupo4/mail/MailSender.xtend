package com.dds.grupo4.mail

import com.dds.grupo4.dominio.Admin

class MailSender {
	
	def Boolean mandarMailA(Admin receptor,String mailEmisor){
		receptor.recibirMail(mailEmisor)	
		return true
	}
	
}