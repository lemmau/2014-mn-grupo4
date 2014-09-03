package ar.utn.dds.exceptions

import java.lang.RuntimeException

class SystemException extends RuntimeException {
	
	new(String msg, Throwable cause) {
		super(msg, cause)
	}
	
	def getCampo() {
		null
	}
	
}