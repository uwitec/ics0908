package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.PersonBean;
import com.tools.ICTools;

public class PersonManage {

	@SuppressWarnings("unchecked")
	public List<PersonBean> getPersonList(PersonBean person){
		try {
			return (List<PersonBean>) DBServer.quider.queryForList("selectPersonDef", person);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<PersonBean>();
		}
	}
	
	public PersonBean getPersonOne(String Id){
		try {
			return (PersonBean) DBServer.quider.queryForObjectById(Id, PersonBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new PersonBean();
		}
	}
	
	public boolean addPerson(PersonBean person){
		try {
			DBServer.quider.insertObject(person);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updatePerson(PersonBean person){
		try {
			DBServer.quider.updateObject(person);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public PersonBean getPagePerson(PersonBean person){
		PageManage pm=new PageManage();
		if(person==null){
			person=new PersonBean();
			ICTools.setBean(person, "");
			person.setS_value("");
		}else{
			ICTools.setBean(person,person.getS_value());
		}
		return (PersonBean) pm.setPage(person, "selectPersonDefPag");
	}
}
