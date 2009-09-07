package com.action.baseset;


import java.util.List;


import com.manage.baseset.StorehouseManage;
import com.mydomain.bean.baseset.ReSourceBean;
import com.mydomain.bean.baseset.StorehouseBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class StorehouseAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ReSourceBean res;
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
	/**
	 * @return the res
	 */
	public ReSourceBean getRes() {
		return res;
	}
	/**
	 * @param res the res to set
	 */
	public void setRes(ReSourceBean res) {
		this.res = res;
	}
	
	
	@SuppressWarnings("unchecked")
	public String showStorehouse(){
		if(storehouse==null){
			storehouse=new StorehouseBean();
		}
		if(res==null){
			res=new ReSourceBean();
			ICTools.setBean(storehouse, "");
			res.setS_value("");
		}else{
			ICTools.setBean(storehouse,res.getS_value());
		}
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
		res=new ReSourceBean();
		if(sm.addStorehouse(storehouse)){
			res.setMessage(ICTools.MESSAGE_OK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String getOneStorehouse(){
		storehouse=sm.getStorehouseOne(storehouse.getStorehouseCode());
		return SUCCESS;
	}
	
	public String updateStorehouse(){	
		if(sm.updateStorehouse(storehouse)){
			res.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String deleteStorehouse(){
		if(sm.deleteStorehouse(storehouse)){
			res.setMessage(ICTools.MESSAGE_DELETEOK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
}
