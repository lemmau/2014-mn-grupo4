package com.dds.grupo4.persistence

import com.mongodb.MongoClient;
import com.mongodb.MongoClient
import com.mongodb.DB

class DataBaseService {
		
	MongoClient mongoClient = new MongoClient("localhost",27017)
	DB db = mongoClient.getDB( "futbol5" );
	
	
	
}