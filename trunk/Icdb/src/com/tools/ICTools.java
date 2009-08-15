package com.tools;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ICTools {
	
	
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
