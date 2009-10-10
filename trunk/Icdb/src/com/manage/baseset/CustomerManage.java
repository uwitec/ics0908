package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.CustomerBean;
import com.tools.ICTools;

public class CustomerManage {

	
	public CustomerBean getCustomerPage(CustomerBean customer){
		PageManage pm=new PageManage();
		if(customer==null){
			customer=new CustomerBean();
			ICTools.setBean(customer, "");
		}else{
			ICTools.setBean(customer, customer.getS_value());
		}
		return (CustomerBean) pm.setPage(customer, "selectCustomerCount");
	}
	
	public CustomerBean getCustomerOne(CustomerBean customer){
		try {
			return (CustomerBean) DBServer.quider.queryForObject("getCustomerBean", customer.getCustomerCode());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new CustomerBean();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<CustomerBean> getCustomerList(CustomerBean customer){
		try {
			return (List<CustomerBean>) DBServer.quider.queryForList("selectCustomerDef", customer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<CustomerBean>();
		}
	}
	
	public boolean updateCustomer(CustomerBean customer){
		try {
			DBServer.quider.updateObject("updateCustomerBean",customer);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean addCustomer(CustomerBean customer){
		try {
			DBServer.quider.insertObject("insertCustomerBean", customer);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean deleteCustomer(CustomerBean customer){
		try {
			DBServer.quider.deleteObject("deleteCustomerBean", customer);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
}
