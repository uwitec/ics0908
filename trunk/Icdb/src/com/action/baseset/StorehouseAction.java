package com.action.baseset;


import java.util.List;


import com.manage.baseset.StorehouseManage;
import com.mydomain.bean.baseset.StorehouseBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class StorehouseAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<StorehouseBean> lhp;
	private StorehouseBean storehouse;
	private StorehouseManage sm=new StorehouseManage();
	/**
	 * @return the lhp
	 */
	public List<StorehouseBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the storehouse
	 */
	public StorehouseBean getStorehouse() {
		return storehouse;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<StorehouseBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param storehouse the storehouse to set
	 */
	public void setStorehouse(StorehouseBean storehouse) {
		this.storehouse = storehouse;
	}

	
	
	@SuppressWarnings("unchecked")
	public String showStorehouse(){
		storehouse=sm.getPageStorehouse(storehouse);
		lhp=sm.getStorhouesList(storehouse);
		return SUCCESS;
	}
	
	public String goAddStorehouse(){
		storehouse=new StorehouseBean();
		storehouse.setStorehouseCode(ICTools.randId("ST"));
		return SUCCESS;
	}
	
	public String addStorehouse(){
		if(sm.addStorehouse(storehouse)){
			storehouse.setMessage(ICTools.MESSAGE_OK);
		}else{
			storehouse.setMessage(ICTools.MESSAGE_ERROR);
		}
		if(storehouse.getS_value()!=null && !storehouse.getS_value().equals("")){
			return SUCCESS;
		}else{
			return "next";
		}
	}
	
	public String getOneStorehouse(){
		storehouse=sm.getStorehouseOne(storehouse.getStorehouseCode());
		return SUCCESS;
	}
	
	public String updateStorehouse(){	
		storehouse.setIsEnabled(1);
		if(sm.updateStorehouse(storehouse)){
			storehouse.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			storehouse.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String deleteStorehouse(){
		if(sm.deleteStorehouse(storehouse)){
			storehouse.setMessage(ICTools.MESSAGE_DELETEOK);
		}else{
			storehouse.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
}
