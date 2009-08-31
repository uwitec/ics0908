package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.ReSourceBean;
import com.mydomain.bean.baseset.SupplierBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class SupplierAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ReSourceBean res;
	private List<SupplierBean> lhp;
	private SupplierBean supplier;
	
	/**
	 * @return the lhp
	 */
	public List<SupplierBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the supplier
	 */
	public SupplierBean getSupplier() {
		return supplier;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<SupplierBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param supplier the supplier to set
	 */
	public void setSupplier(SupplierBean supplier) {
		this.supplier = supplier;
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
	
	public String goAddSupplier(){
		supplier=new SupplierBean();
		supplier.setSupplierCode(ICTools.randId("S"));
		return SUCCESS;
	}
	
	public String addSupplier(){
		res=new ReSourceBean();
		try {
			DBServer.quider.insertObject(supplier);
			res.setMessage(ICTools.MESSAGE_OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		res.setNextPath("/baseset/GoAddSupplier.action");
		res.setRePath("/baseset/ShowSupplier.action");
		return SUCCESS;
	}
	
	public String getOneSupplier(){
		try {
			supplier=(SupplierBean) DBServer.quider.queryForObjectById(supplier.getSupplierCode(), SupplierBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String selectSupplierDef(){
		ICTools.setBean(supplier, ICTools.likeString(res.getS_value()));
		try {
			lhp=(List<SupplierBean>) DBServer.quider.queryForList("selectSupplierDef", supplier, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showSupplier(){
		try {
			lhp=(List<SupplierBean>) DBServer.quider.queryForList(0, 10, SupplierBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String updateSupplier(){
		try {
			DBServer.quider.updateObject(supplier);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteSuString(){
		supplier=new SupplierBean();
		try {
			DBServer.quider.deleteObject(supplier);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	
}
