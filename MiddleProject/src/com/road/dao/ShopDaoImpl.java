package com.road.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.ServerAddress;
import com.road.vo.ShopVo;

@Repository
public class ShopDaoImpl implements ShopDao{

	String MongoDB_IP = "127.0.0.1";
    int MongoDB_PORT = 27017;
    String DB_NAME = "testDB";
 
    //Connect to MongoDB
    MongoClient  mongoClient = new MongoClient(new ServerAddress(MongoDB_IP, MongoDB_PORT));
    DB db = mongoClient.getDB(DB_NAME);
    DBCollection collection = db.getCollection("");

	
	@Override
	public List<ShopVo> getAll() {
		
		return null;
	}

	
}
