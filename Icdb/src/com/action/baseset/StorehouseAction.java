package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.ReSourceBean;
import com.mydomain.bean.StorehouseBean;
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
	public String selectStorehouseDef(){
		ICTools.setBean(storehouse, ICTools.likeString(res.getS_value()));
		try {
			lhp=(List<StorehouseBean>) DBServer.quider.queryForList("selectStorehouseDef", storehouse, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showStorehouse(){
		try {
			lhp=(List<StorehouseBean>) DBServer.quider.queryForList(0, 10, StorehouseBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String goAddStorehouse(){
		storehouse=new StorehouseBean();
		storehouse.setStorehouseCode(ICTools.randId("ST"));
		return SUCCESS;
	}
	
	public String addStorehouse(){
		res=new ReSourceBean();
		try {
			DBServer.quider.insertObject(storehouse);
			res.setMessage(ICTools.MESSAGE_OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		res.setNextPath("/baseset/GoAddStorehouse.action");
		res.setRePath("/baseset/ShowStorehouse.action");
		return SUCCESS;
	}
	
	public String getOneStorehouse(){
		try {
			storehouse=(StorehouseBean) DBServer.quider.queryForObjectById(storehouse.getStorehouseCode(), StorehouseBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String updateStorehouse(){	
		try {
			DBServer.quider.updateObject(storehouse);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteStorehouse(){
		try {
			DBServer.quider.deleteObject(storehouse);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
