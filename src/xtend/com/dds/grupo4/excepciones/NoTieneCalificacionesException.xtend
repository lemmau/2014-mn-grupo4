package com.dds.grupo4.excepciones

import java.lang.RuntimeException

class NoTieneCalificacionesException extends RuntimeException {
	new(String message) {
		super(message)
	}
}
