package com.action.baseset;

import java.util.List;

import com.manage.baseset.SupplierManage;
import com.mydomain.bean.baseset.SupplierBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class SupplierAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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

	
	public String goAddSupplier(){
		supplier=new SupplierBean();
		supplier.setSupplierCode(ICTools.randId("S"));
		return SUCCESS;
	}
	
	public String addSupplier(){
		if(sm.addSupplier(supplier)){
			supplier.setMessage(ICTools.MESSAGE_OK);
		}else{
			supplier.setMessage(ICTools.MESSAGE_ERROR);
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
		supplier=sm.getPageSupplier(supplier);
		lhp=sm.getSupplierList(supplier);
		return SUCCESS;
	}
	
	public String updateSupplier(){
		if(sm.updateSupplier(supplier)){
			supplier.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			supplier.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String findSupplier(){
		this.showSupplier();
		return SUCCESS;
	}
	public String deleteSupplierString(){
		supplier=new SupplierBean();
		if(sm.deleteSupplier(supplier)){
			supplier.setMessage(ICTools.MESSAGE_DELETEOK);
		}else{
			supplier.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}

	
}
