package com.action.baseset;

import java.util.List;

import com.manage.baseset.CustomerManage;
import com.mydomain.bean.baseset.CustomerBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class CustomerAction extends ActionSupport{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CustomerBean customer;
	private List<CustomerBean> lhp;
	/**
	 * @return the customer
	 */
	public CustomerBean getCustomer() {
		return customer;
	}
	/**
	 * @return the lhp
	 */
	public List<CustomerBean> getLhp() {
		return lhp;
	}
	/**
	 * @param customer the customer to set
	 */
	public void setCustomer(CustomerBean customer) {
		this.customer = customer;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<CustomerBean> lhp) {
		this.lhp = lhp;
	}
	
	public String showCustomer(){
		CustomerManage cm=new CustomerManage();
		customer=cm.getCustomerPage(customer);
		lhp=cm.getCustomerList(customer);
		return SUCCESS;
	}
	
	public String goAddCustomer(){
		customer=new CustomerBean();
		customer.setCustomerCode(ICTools.randId("CUS"));
		return SUCCESS;
	}
	
	public String getOneCustomer(){
		CustomerManage cm=new CustomerManage();
		customer=cm.getCustomerOne(customer);
		return SUCCESS;
	}
	
	public String updateCustomer(){
		CustomerManage cm=new CustomerManage();
		if(cm.updateCustomer(customer)){
			customer.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			customer.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String addCustomer(){
		CustomerManage cm=new CustomerManage();
		if(cm.addCustomer(customer)){
			customer.setMessage(ICTools.MESSAGE_OK);
		}else{
			customer.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String deleteCustomer(){
		CustomerManage cm=new CustomerManage();
		if(cm.deleteCustomer(customer)){
			customer.setMessage(ICTools.MESSAGE_OK);
		}else{
			customer.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
}
