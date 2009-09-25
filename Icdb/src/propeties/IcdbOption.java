package propeties;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.LinkedHashMap;


import com.dbserver.conf.ALCFFactory;
import com.dbserver.conf.AutoConfiger;

public class IcdbOption {
	
	public static int state_Complete=1;
	public static int state_Delete=0;
	public static int state_Unfinished=2;
	
	public static int check_Unaudited=0;
	public static int check_Approved=1;
	public static int check_Nopass=2;
	
	public static String getValue(String key){
		AutoConfiger autoConfiger = null;
		try {
			autoConfiger = ALCFFactory
					.createAutoConfiger("propeties/icdb_option.cfg");
					//.createAutoConfiger("propeties/abc.cfg");
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
	
	
	/*
	private static LinkedHashMap<String, StateBean> getState2(String keyValue){
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
	*/
	private static LinkedHashMap<?, ?> getState(String keyValue){
		LinkedHashMap<String, String>lhp=new LinkedHashMap<String, String>();
		String[] tab_str=IcdbOption.getValue(keyValue).split(",");
		for(int i=0;i<tab_str.length;i++){
			String key=tab_str[i].split(":")[2];
			String value=tab_str[i].split(":")[1];
		//	value=ICTools.GBK(value);
		//	st.setKey(key);
		//	st.setName(tab_str[i].split(":")[1]);
		//	st.setValue(tab_str[i].split(":")[2]);
			lhp.put(key, value);
		}
		return lhp;
	}	
	
	//表状态列表
	public static LinkedHashMap<?,?> getTableState(){
		return IcdbOption.getState("table_state");
	}
	
	//检查状态列表
	public static LinkedHashMap<?,?> getCheckState(){
		return IcdbOption.getState("check_state");
	}
	
	//审核状态列表
	public static LinkedHashMap<?,?> getExamineState(){
		return IcdbOption.getState("examine_state");
	}
	
	//入库类型状态列表
	public static LinkedHashMap<?,?> getStockInState(){
		return IcdbOption.getState("stock_in");
	}
	
	//损耗状态列表
	public static LinkedHashMap<?,?> getLostState(){
		return IcdbOption.getState("lost_state");
	}
	
	public static LinkedHashMap<?,?> getAbcState(){
		return IcdbOption.getState("Materiel_abc");
	}
	
	public static LinkedHashMap<?,?> getEnough(){
		return IcdbOption.getState("Materiel_enough");
	}
	
	public static LinkedHashMap<?, ?> getABCType(){
		return IcdbOption.getState("materiel_type");
	}
	
	public static LinkedHashMap<?, ?> getManageSetMater(){
		return IcdbOption.getState("ManageSetMater");
	}
	
	public static void main(String[] args) {
		String a=(String) IcdbOption.getTableState().get("2");
		System.out.println(a);
	}
	
}
