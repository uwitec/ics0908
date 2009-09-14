package com.action.storage;

import java.util.ArrayList;
import java.util.List;

import propeties.IcdbOption;

import com.manage.baseset.StorehouseManage;
import com.manage.storage.CheckStockManage;
import com.manage.storage.StockManage;
import com.mydomain.bean.baseset.StorehouseBean;
import com.mydomain.bean.storage.CheckStockBean;
import com.mydomain.bean.storage.CheckStockListBean;
import com.mydomain.bean.storage.StockBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class CheckStockAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<StorehouseBean> lsb;
	private CheckStockBean checkStock;
	private String checkTime;
	private List<StockBean> list_stock;
	private CheckStockListBean checkStockList;
	
	/**
	 * @return the checkStockList
	 */
	public CheckStockListBean getCheckStockList() {
		return checkStockList;
	}
	/**
	 * @param checkStockList the checkStockList to set
	 */
	public void setCheckStockList(CheckStockListBean checkStockList) {
		this.checkStockList = checkStockList;
	}
	/**
	 * @return the checkTime
	 */
	public String getCheckTime() {
		return checkTime;
	}
	/**
	 * @param checkTime the checkTime to set
	 */
	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}
	/**
	 * @return the checkStock
	 */
	public CheckStockBean getCheckStock() {
		return checkStock;
	}
	/**
	 * @param checkStock the checkStock to set
	 */
	public void setCheckStock(CheckStockBean checkStock) {
		this.checkStock = checkStock;
	}
	/**
	 * @return the lsb
	 */
	public List<StorehouseBean> getLsb() {
		return lsb;
	}
	/**
	 * @param lsb the lsb to set
	 */
	public void setLsb(List<StorehouseBean> lsb) {
		this.lsb = lsb;
	}
	/**
	 * @return the list_stock
	 */
	public List<StockBean> getList_stock() {
		return list_stock;
	}
	/**
	 * @param list_stock the list_stock to set
	 */
	public void setList_stock(List<StockBean> list_stock) {
		this.list_stock = list_stock;
	}
	
	public String showCheckStock(){
		StorehouseManage sm=new StorehouseManage();
		String date=ICTools.getDate();
		checkStock=new CheckStockBean();
		if(date.equals(IcdbOption.getValue("Data_date"))){
			checkTime="";
		}else{
			checkTime="disabled";
			checkStock.setMessage("现在不能进行盘点，每月"+IcdbOption.getValue("Data_date")+"日,为盘点日期。");
		}
		lsb=sm.getStorhouseAllList();
		return SUCCESS;
	}
	
	public String goAddCheckStock(){
		StockManage sm=new StockManage();
		StorehouseManage storem=new StorehouseManage();
		StockBean stock=new StockBean();
		StorehouseBean storehouse=new StorehouseBean();
		storehouse=storem.getStorehouseOne(checkStock.getStorehouseCode());
		storehouse.setIsEnabled(2);
		storem.updateStorehouse(storehouse);
		
		checkStock.setCsCode(ICTools.randId("CS"));
		checkStock.setCsDate(ICTools.getTime());
		checkStock.setStorehouseName(storehouse.getStorehouseName());
		stock.setStorehouseCode(checkStock.getStorehouseCode());
		list_stock=sm.getStockListOfStoreHouse(stock);
		return SUCCESS;
	}
	
	public String addCheckStock(){
		CheckStockManage csm=new CheckStockManage();
		List<CheckStockListBean> cslist=getCheckList(checkStockList,checkStock.getCsCode());
		if(csm.addCheckStockALL(cslist, checkStock)){
			checkStock.setMessage(ICTools.MESSAGE_OK);
		}else{
			checkStock.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	private List<CheckStockListBean> getCheckList(CheckStockListBean checkStockList,String Id){
		List<CheckStockListBean> get_List=new ArrayList<CheckStockListBean>();
		int listSize=checkStockList.getMaterielCode().split(",").length;
		for(int i=0;i<listSize;i++){
			CheckStockListBean cslb=new CheckStockListBean();
			cslb.setCsCode(Id);
			cslb.setMaterielCode(checkStockList.getMaterielCode().split(",")[i].trim());
			cslb.setCargoSpaceCode(checkStockList.getCargoSpaceCode().split(",")[i].trim());
			cslb.setCsStartNumber(Double.valueOf(checkStockList.getT_StartNumber().split(",")[i].trim()));
			cslb.setCsStartPrice(Double.valueOf(checkStockList.getT_StartPrice().split(",")[i].trim()));
			cslb.setCsCheckNumber(Double.valueOf(checkStockList.getT_CheckNumber().split(",")[i].trim()));
			cslb.setCsCheckPrice(Double.valueOf(checkStockList.getT_CheckPrice().split(",")[i].trim()));
			cslb.setCsDiffMessage(checkStockList.getCsDiffMessage().split(",")[i].trim());
			cslb.setCsRemark(checkStockList.getCsRemark().split(",")[i].trim());
			cslb.setCsGM(checkStockList.getCsGM().split(",")[i].trim());
			get_List.add(cslb);
		}
		return get_List;
	}
}
