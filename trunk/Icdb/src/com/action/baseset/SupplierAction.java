package com.action.baseset;

import java.util.List;

import com.manage.baseset.SupplierManage;
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
	private SupplierManage sm=new SupplierManage();
	
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
		if(sm.addSupplier(supplier)){
			res.setMessage(ICTools.MESSAGE_OK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String getOneSupplier(){
		supplier=sm.getSupplierOne(supplier.getSupplierCode());
		return SUCCESS;
	}
	
	/*
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
	*/
	
	@SuppressWarnings("unchecked")
	public String showSupplier(){
		if(supplier==null){
			supplier=new SupplierBean();
		}
		if(res==null){
			res=new ReSourceBean();
			ICTools.setBean(supplier, "");
			res.setS_value("");
		}else{
			ICTools.setBean(supplier,res.getS_value());
		}
		supplier=sm.getPageSupplier(supplier);
		lhp=sm.getSupplierList(supplier);
		return SUCCESS;
	}
	
	public String updateSupplier(){
		if(sm.updateSupplier(supplier)){
			res.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String deleteSupplierString(){
		supplier=new SupplierBean();
		if(sm.deleteSupplier(supplier)){
			res.setMessage(ICTools.MESSAGE_DELETEOK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}

	
}
