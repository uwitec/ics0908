package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.ReSourceBean;
import com.mydomain.bean.baseset.StructBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class StructAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ReSourceBean res;
	private StructBean struct;
	private List<StructBean> lhp;
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
	public String addStruct(){
		res=new ReSourceBean();
		try {
			DBServer.quider.insertObject(struct);
			res.setMessage(ICTools.MESSAGE_OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		res.setNextPath("/baseset/GoAddStruct.action");
		res.setRePath("/baseset/ShowStruct.action");
		return SUCCESS;
	}
	public String getOneStruct(){
		try {
			struct=(StructBean) DBServer.quider.queryForObjectById(struct.getStructCode(), StructBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String selectStructDef(){
		ICTools.setBean(struct, ICTools.likeString(res.getS_value()));
		try {
			lhp=(List<StructBean>) DBServer.quider.queryForList("selectStructDef", struct, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showStruct(){
		try {
			lhp=(List<StructBean>) DBServer.quider.queryForList(StructBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String updateStruct(){
		try {
			DBServer.quider.updateObject(struct);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String goAddStruct(){
		struct=new StructBean();
		struct.setStructCode(ICTools.randId("S"));
		return SUCCESS;
	}

}
