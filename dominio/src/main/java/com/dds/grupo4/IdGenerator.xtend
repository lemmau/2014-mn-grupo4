package com.dds.grupo4

class IdGenerator {
	private static Long lastUUIDused = 0L

	def static Long generateUUID() {
		val lastUsed = lastUUIDused
		lastUUIDused = lastUUIDused + 1L
		lastUsed
	}
}
