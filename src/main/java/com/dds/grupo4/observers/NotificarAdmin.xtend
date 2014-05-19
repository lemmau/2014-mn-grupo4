package com.dds.grupo4.observers

import com.dds.grupo4.Partido

class NotificarAdmin {

	def void notificarConfirmacion(Partido partido){
		partido.getAdmin.recibirMail(partido.mail)				
	}
	
	

}
