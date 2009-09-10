package com.action.baseset;

import java.util.List;

import com.manage.baseset.StructManage;
import com.mydomain.bean.baseset.StructBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class StructAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StructBean struct;
	private List<StructBean> lhp;
	private StructManage sm=new StructManage();
	/**
	 * @return the lhp
	 */
	public List<StructBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the struct
	 */
	public StructBean getStruct() {
		return struct;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<StructBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param struct the struct to set
	 */
	public void setStruct(StructBean struct) {
		this.struct = struct;
	}

	public String addStruct(){
		if(sm.addStruct(struct)){
			struct.setMessage(ICTools.MESSAGE_OK);
		}else{
			struct.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	public String getOneStruct(){
		struct=sm.getStructOne(struct.getStructCode());
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showStruct(){
		struct=sm.getPageStruct(struct);
		lhp=sm.getStructList(struct);
		return SUCCESS;
	}
	
	public String updateStruct(){
		if(sm.updateStruct(struct)){
			struct.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			struct.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String goAddStruct(){
		struct=new StructBean();
		struct.setStructCode(ICTools.randId("S"));
		return SUCCESS;
	}

}
