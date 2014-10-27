package com.dds.grupo4.connector

import com.mongodb.MongoClient
import com.mongodb.DB

class DataBaseConnector {
	private MongoClient mongoClient
	private val String host = "localhost"
	private val Integer port = 27017
	private String dataBaseName
	private Boolean isOpen = false

	new(String dbname) {
		dataBaseName = dbname
	}

	def DB openConnection() {
		if (!isOpen) {
			println("Opening connection to " + dataBaseName)
			mongoClient = new MongoClient(host, port)
			isOpen = true
		}
		return mongoClient.getDB(dataBaseName)
	}

	def void closeConnection() {
		if (isOpen) {
			println("Closing connection to " + dataBaseName)
			mongoClient.close
			isOpen = false
		}
	}

}
