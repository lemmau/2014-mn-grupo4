package com.dds.grupo4

import java.util.List
import java.util.ArrayList

public class TodosLosJugadores {
	private static List<Interesado> interesadosDelSistema = new ArrayList<Interesado>

	def static eliminarPosibleInteresado(Interesado interesado) {
		interesadosDelSistema.remove(interesado)
	}
	
	def static agregarJugadorAlSistema(Interesado interesado) {
		interesadosDelSistema.add(interesado)
	}
	
	def static List<Interesado> getInteresadosDelSistema(){
		interesadosDelSistema
	}
}
