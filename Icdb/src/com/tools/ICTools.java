package com.tools;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

public class ICTools {
	
	public static String MESSAGE_OK="";
	public static String MESSAGE_ERROR="�����д�������";
	private static final int BUFFER_SIZE = 16 * 1024 ;
	
	public static int mathCeil(double arg0,double arg1){
		return (int) Math.ceil(arg0/arg1);
	}
	
	public static int mathCeil(int arg0,int arg1){
		return (int) Math.ceil(arg0*1.0/arg1);
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
	
	 
	 private static void copy(File src, File dst)  {
	        try {
	           InputStream in = null ;
	           OutputStream out = null ;
	            try {                
	               in = new BufferedInputStream( new FileInputStream(src), BUFFER_SIZE);
	               out = new BufferedOutputStream( new FileOutputStream(dst), BUFFER_SIZE);
	                byte [] buffer = new byte [BUFFER_SIZE];
	                while (in.read(buffer) > 0 ) {
	                   out.write(buffer);
	               }
	           } finally {
	                if ( null != in) {
	                   in.close();
	               }
	                if ( null != out) {
	                   out.close();
	               }
	           }
	       } catch (Exception e) {
	           e.printStackTrace();
	       }
	   } 
	 
	 private static String getExtention(String fileName)  {
	        int pos = fileName.lastIndexOf(".");
	        return fileName.substring(pos);
	 } 
	 
	 public static String sendImg(String fileName,File upLoadFile){
		 String imageFileName = new Date().getTime() + getExtention(fileName);
	     File imageFile = new File(ServletActionContext.getServletContext().getRealPath("/upLoadImg" ) + "/" + imageFileName);
		 copy(upLoadFile, imageFile);

	     return imageFileName;
	 }
}