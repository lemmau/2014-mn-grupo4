package com.dds.grupo4.objectstomatchrequest

import com.dds.grupo4.dominio.Jugador
import org.joda.time.DateTime

class JugadorToMatch extends Jugador {
	@Property Integer fromHandicap 
	@Property Integer toHandicap
	@Property DateTime fromDate
	@Property DateTime toDate
	
}