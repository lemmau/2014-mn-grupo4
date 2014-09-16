package com.dds.grupo4.excepciones

import java.lang.RuntimeException

class HandicapFueraDeRangoException extends RuntimeException {
	new(String message) {
		super(message)
	}

}