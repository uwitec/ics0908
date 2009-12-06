package com.action.login;

import com.manage.baseset.EmployeeManage;
import com.mydomain.bean.baseset.EmployeeBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdatePassWord extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String newpassword;

	/**
	 * @return the newpassword
	 */
	public String getNewpassword() {
		return newpassword;
	}

	/**
	 * @param newpassword the newpassword to set
	 */
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	
	public String changePassWord(){
		EmployeeBean emp=(EmployeeBean) ActionContext.getContext().getSession().get("user");
		EmployeeManage em=new EmployeeManage();
		if(newpassword==null){
			return "PASS";
		}else{
			emp.setPassWord(LoginAction.toSHA(this.newpassword));
		}
		if(em.changePassword(emp)){
			return SUCCESS;
		}else{
			return "PASS";
		}
	}
	
}
