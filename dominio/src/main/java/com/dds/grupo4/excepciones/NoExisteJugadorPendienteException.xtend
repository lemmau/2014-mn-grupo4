package com.dds.grupo4.excepciones

import java.lang.RuntimeException

class NoExisteJugadorPendienteException extends RuntimeException {
	new(String message) {
		super(message)
	}
}
