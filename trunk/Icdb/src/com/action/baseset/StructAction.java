package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.StructBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.DBControl;
import com.tools.ICTools;

public class StructAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String structCode;
	private String structName;
	private String message;
	private String nextPath;
	private String rePath;
	private StructBean struct;
	private List<StructBean> lhp;
	/**
	 * @return the lhp
	 */
	public List<StructBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @return the nextPath
	 */
	public String getNextPath() {
		return nextPath;
	}
	/**
	 * @return the rePath
	 */
	public String getRePath() {
		return rePath;
	}
	/**
	 * @return the struct
	 */
	public StructBean getStruct() {
		return struct;
	}
	/**
	 * @return the structCode
	 */
	public String getStructCode() {
		return structCode;
	}
	/**
	 * @return the structName
	 */
	public String getStructName() {
		return structName;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<StructBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @param nextPath the nextPath to set
	 */
	public void setNextPath(String nextPath) {
		this.nextPath = nextPath;
	}
	/**
	 * @param rePath the rePath to set
	 */
	public void setRePath(String rePath) {
		this.rePath = rePath;
	}
	/**
	 * @param struct the struct to set
	 */
	public void setStruct(StructBean struct) {
		this.struct = struct;
	}
	/**
	 * @param structCode the structCode to set
	 */
	public void setStructCode(String structCode) {
		this.structCode = structCode;
	}
	/**
	 * @param structName the structName to set
	 */
	public void setStructName(String structName) {
		this.structName = structName;
	}
	
	public String addStruct(){
		struct=new StructBean();
		struct.setStructCode(structCode);
		struct.setStructName(structName);
		DBControl db=new DBControl();
		if(db.insert(struct)){
			message="";
		}else{
			message="有已经存在为"+struct.getStructCode()+"的编号，请重新输入";
		}
		nextPath="/baseset/struct/StructAdd.jsp";
		rePath="/baseset/ShowStruct.action";
		return SUCCESS;
	}
	public String getOneStruct(){
		try {
			struct=(StructBean) DBServer.quider.queryForObjectById(structCode, StructBean.class);
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
		struct=new StructBean();
		struct.setStructCode(structCode);
		struct.setStructName(structName);
		try {
			DBServer.quider.updateObject(struct);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String goAddStruct(){
		structCode=ICTools.randId("S");
		return SUCCESS;
	}
}
