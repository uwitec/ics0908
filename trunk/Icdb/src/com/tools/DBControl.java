package com.tools;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dbserver.DBServer;

public class DBControl {

	public boolean insert(Object obj){
		try {
			DBServer.quider.insertObject(obj);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteBank(Object obj){
		try {
			DBServer.quider.deleteObject(obj);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}		
	}
	public boolean check(Object obj,String id){
		try {
			DBServer.quider.queryForObjectById(id, obj.getClass());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

	public static String randId(String id_char){
		StringBuffer id_code=new StringBuffer();
		SimpleDateFormat sdf=new SimpleDateFormat( "yyyyMMddHHmmss");
		int num=(int)(Math.random()*100);
		id_code.append(id_char);
		id_code.append(sdf.format(new Date()));
		id_code.append(num);
		
		return id_code.toString(); 
		//return id_code;
	}
}
