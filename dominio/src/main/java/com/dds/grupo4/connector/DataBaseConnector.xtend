package com.dds.grupo4.connector

import com.mongodb.MongoClient
import com.mongodb.DB

class DataBaseConnector {
	private MongoClient mongoClient
	private val String host = "localhost"
	private val Integer port = 27017
	private String dataBaseName

	new(String dbname){
		dataBaseName = dbname
	}

	def DB openConnection(){
		println("Opening connection to " + dataBaseName)
		mongoClient = new MongoClient(host,port)
		return mongoClient.getDB(dataBaseName)		
	}
	
	def closeConnection(){
		println("Closing connection to " + dataBaseName)
		mongoClient.close
	}

}
