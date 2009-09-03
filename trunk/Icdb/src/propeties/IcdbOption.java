package propeties;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.LinkedHashMap;


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
	
	
	
	private static LinkedHashMap<String, StateBean> getState(String keyValue){
		LinkedHashMap<String, StateBean>lhp=new LinkedHashMap<String, StateBean>();
		StateBean st;
		String[] tab_str=IcdbOption.getValue(keyValue).split(",");
		for(int i=0;i<tab_str.length;i++){
			st=new StateBean();
			String key=tab_str[i].split(":")[0];
			st.setKey(key);
			st.setName(tab_str[i].split(":")[1]);
			st.setValue(tab_str[i].split(":")[2]);
			lhp.put(key, st);
		}
		return lhp;
	}	
	
	//表状态列表
	public static LinkedHashMap<String, StateBean> getTableState(){
		return IcdbOption.getState("table_state");
	}
	
	//检查状态列表
	public static LinkedHashMap<String, StateBean> getCheckState(){
		return IcdbOption.getState("check_state");
	}
	
	//审核状态列表
	public static LinkedHashMap<String, StateBean> getExamineState(){
		return IcdbOption.getState("examine_state");
	}
	
	//入库类型状态列表
	public static LinkedHashMap<String, StateBean> getStockInState(){
		return IcdbOption.getState("stock_in");
	}
	
	//损耗状态列表
	public static LinkedHashMap<String, StateBean> getLostState(){
		return IcdbOption.getState("lost_state");
	}
	
	public static LinkedHashMap<String, StateBean> getAbcState(){
		return IcdbOption.getState("Materiel_abc");
	}
	
	public static LinkedHashMap<String, StateBean> getEnough(){
		return IcdbOption.getState("Materiel_enough");
	}
	/*
	public static void main(String[] args) {
		System.out.println(IcdbOption.getValue("Data_date"));
	}
	*/
}
