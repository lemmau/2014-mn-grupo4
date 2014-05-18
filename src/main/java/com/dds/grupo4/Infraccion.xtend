package com.dds.grupo4

import org.joda.time.DateTime

class Infraccion {
	@Property private String motivo
	@Property private DateTime limitDate 
	
	new(String motivo,DateTime limitDate){
		this.motivo = motivo
		this.limitDate = limitDate
	}
}