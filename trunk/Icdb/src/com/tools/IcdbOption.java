package com.tools;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.LinkedHashMap;

import propeties.StateBean;

import com.dbserver.conf.ALCFFactory;
import com.dbserver.conf.AutoConfiger;

public class IcdbOption {
	
	public static String getValue(String key){
		AutoConfiger autoConfiger = null;
		try {
			autoConfiger = ALCFFactory
					.createAutoConfiger("propeties/icdb_option.properties");
		} catch (FileNotFoundException e2) {
			//没找到文件
			e2.printStackTrace();
			System.exit(1);
		} catch (IOException e2) {
			// 流异常
			System.exit(2);
			e2.printStackTrace();
		}
		return autoConfiger.getValue(key);

	}
	
	private static LinkedHashMap<Integer, StateBean> getState(String keyValue){
		LinkedHashMap<Integer, StateBean>lhp=new LinkedHashMap<Integer, StateBean>();
		StateBean st;
		String[] tab_str=IcdbOption.getValue(keyValue).split(",");
		for(int i=0;i<tab_str.length;i++){
			st=new StateBean();
			Integer key=Integer.valueOf(tab_str[i].split(":")[2]);
			st.setKey(key);
			st.setName(tab_str[i].split(":")[0]);
			st.setValue(tab_str[i].split(":")[1]);
			lhp.put(key, st);
		}
		return lhp;
	}
	
	//表状态列表
	public static LinkedHashMap<Integer, StateBean> getTableState(){
		return IcdbOption.getState("table_state");
	}
	
	//检查状态列表
	public static LinkedHashMap<Integer, StateBean> getCheckState(){
		return IcdbOption.getState("check_state");
	}
	
	//审核状态列表
	public static LinkedHashMap<Integer, StateBean> getExamineState(){
		return IcdbOption.getState("examine_state");
	}
	
	public static LinkedHashMap<Integer, StateBean> getStockInState(){
		return IcdbOption.getState("stock_in");
	}
	
}
