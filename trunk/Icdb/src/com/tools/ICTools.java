package com.tools;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ICTools {
	
	public static String MESSAGE_OK="";
	public static String MESSAGE_ERROR="数据有错误，请检查";
	
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
	
	public static String likeString(String s_value){
			s_value="%"+s_value+"%";
		return s_value;
	}
	
	public static void setBean(Object obj,String set_value){
		 Class<?> c=obj.getClass();
		 Method[] methods = c.getDeclaredMethods();
		 for (int i=0;i<methods.length;i++) {
			 String funcName=methods[i].getName();
			 Class<?>[] c_type=methods[i].getParameterTypes();
			 if(funcName.startsWith("set") && c_type.length==1) {
				 if(c_type[0].getName().equals("java.lang.String")){
					 try {
						methods[i].invoke(obj,new Object[]{set_value});
					 } catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					 } 
				 }
			}
		}   
		
	}
	/*
	public static void main(String[] args) {
		AccountBean a=new AccountBean();
		ICTools.setBean(a, "abc");
		System.out.println(a.getAccountCode());
		System.out.println(a.getPersonName());
		System.out.println(a.getBankCode());

	}
	*/
}
