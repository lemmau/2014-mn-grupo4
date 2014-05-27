package com.dds.grupo4

import java.util.List
import java.util.ArrayList

static class TodosLosJugadores {
	static List<Interesado> posiblesInteresados = new ArrayList<Interesado>

	def static agregarPosibleInteresado(Interesado interesado) {
		posiblesInteresados.add(interesado)
	}

	def static eliminarPosibleInteresado(Interesado interesado) {
		posiblesInteresados.remove(interesado)
	}
}
