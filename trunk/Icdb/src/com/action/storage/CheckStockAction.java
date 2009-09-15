package com.action.storage;

import java.util.ArrayList;
import java.util.LinkedHashMap;
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
	private List<CheckStockBean> lhp;
	private CheckStockListBean checkStockList;
	private List<CheckStockListBean> list_CheckstockList;
	private LinkedHashMap<?,?> list_state;
	
	

	/**
	 * @return the list_state
	 */
	public LinkedHashMap<?, ?> getList_state() {
		return list_state;
	}
	/**
	 * @param list_state the list_state to set
	 */
	public void setList_state(LinkedHashMap<?, ?> list_state) {
		this.list_state = list_state;
	}
	/**
	 * @return the list_CheckstockList
	 */
	public List<CheckStockListBean> getList_CheckstockList() {
		return list_CheckstockList;
	}
	/**
	 * @param list_CheckstockList the list_CheckstockList to set
	 */
	public void setList_CheckstockList(List<CheckStockListBean> list_CheckstockList) {
		this.list_CheckstockList = list_CheckstockList;
	}
	/**
	 * @return the lhp
	 */
	public List<CheckStockBean> getLhp() {
		return lhp;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<CheckStockBean> lhp) {
		this.lhp = lhp;
	}
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
	
	public String showCheckStock(){
		CheckStockManage csm=new CheckStockManage();
		String date=ICTools.getDate();
		checkStock=new CheckStockBean();
		if(date.equals(IcdbOption.getValue("Data_date"))){
			checkTime="";
		}else{
			checkTime="disabled";
			checkStock.setMessage("现在不能进行盘点，每月"+IcdbOption.getValue("Data_date")+"日,为盘点日期。");
		}
		lsb=csm.getCheckHouse(ICTools.getYearMonth());
		checkStock=csm.getPageShowCheckState(checkStock);
		lhp=csm.getCheckShowStateList(checkStock);
		list_state=IcdbOption.getCheckState();
	
		return SUCCESS;
	}
	
	public String goAddCheckStock(){
		StockManage sm=new StockManage();
		StorehouseManage storem=new StorehouseManage();
		StockBean stock=new StockBean();
		StorehouseBean storehouse=new StorehouseBean();
		CheckStockManage csm=new CheckStockManage();
		
		
		storehouse=storem.getStorehouseOne(checkStock.getStorehouseCode());
		storehouse.setIsEnabled(2);
		storem.updateStorehouse(storehouse);
		
		checkStock.setCsCode(ICTools.randId("CS"));
		checkStock.setCsDate(ICTools.getTime());
		checkStock.setStorehouseName(storehouse.getStorehouseName());
		checkStock.setCsState(IcdbOption.state_Unfinished);
	    
		stock.setStorehouseCode(checkStock.getStorehouseCode());
		List<StockBean> list_stock=sm.getStockListOfStoreHouse(stock);
		list_CheckstockList=changeStockTOcheck(list_stock,checkStock.getCsCode());
		csm.addCheckStockALL(list_CheckstockList, checkStock);
		return SUCCESS;
	}
	
	public String editCheckStock(){
		CheckStockManage csm=new CheckStockManage();
		checkStock=csm.getCheckStock(checkStock.getCsCode());
		list_CheckstockList=csm.getOneCheckList(checkStock);
		return SUCCESS;
	}
	
	public String updateCheckStock(){
		CheckStockManage csm=new CheckStockManage();
		list_CheckstockList=getCheckList(checkStockList, checkStock.getCsCode());
		csm.updateCheckStockAll(list_CheckstockList, checkStock);
		return SUCCESS;
	}
	
	
	public String findCheck(){
		CheckStockManage csm=new CheckStockManage();
		checkStock=csm.getCheckStock(checkStock.getCsCode());
		list_CheckstockList=csm.getOneCheckList(checkStock);
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
	
	public String showHistroy(){
		CheckStockManage csm=new CheckStockManage();
		checkStock=csm.getPageCheckStock(checkStock);
		lhp=csm.getCheckStockList(checkStock);
		list_state=IcdbOption.getCheckState();
		return SUCCESS;
	}
	
	public String showCheckApprove(){
		CheckStockManage csm=new CheckStockManage();
		checkStock=csm.getPageCheckState(checkStock);
		lhp=csm.getCheckStateList(checkStock);
		return SUCCESS;
	}
	
	public String goCheckApprove(){
		CheckStockManage csm=new CheckStockManage();
		checkStock=csm.getCheckStock(checkStock.getCsCode());
		list_CheckstockList=csm.getOneCheckList(checkStock);
		return SUCCESS;
	}
	
	public String updateCheckApprove(){
		CheckStockManage csm=new CheckStockManage();
		list_CheckstockList=csm.getOneCheckList(checkStock);
		if(csm.updateCheckStock(checkStock)){
			if(checkStock.getCsApproveState()==IcdbOption.check_Approved){
				updateCheckAndStock(checkStock.getStorehouseCode(),changeCheckToStock(list_CheckstockList));
			}
		}else{
			checkStock.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	private boolean updateCheckAndStock(String houeID,List<StockBean> stock_list){
		StockManage sm=new StockManage();
		StorehouseManage shm=new StorehouseManage();
		StorehouseBean house_bean;
		house_bean=shm.getStorehouseOne(houeID);
		house_bean.setIsEnabled(1);
		if(sm.updateStockList(stock_list)){
			shm.updateStorehouse(house_bean);	
			return true;
			}else{
				return false;
			}

	}
	
	
	private List<StockBean> changeCheckToStock(List<CheckStockListBean> list_check){
		List<StockBean> get_List=new ArrayList<StockBean>();
		for(int i=0;i<list_check.size();i++){
			StockBean cb=new StockBean();
			CheckStockListBean cslb=list_check.get(i);
			cb.setCargoSpaceCode(cslb.getCargoSpaceCode());
			cb.setMaterielCode(cslb.getMaterielCode());
			cb.setStockAmount(String.valueOf(cslb.getCsCheckNumber()));
			cb.setStockPrice(cslb.getCsCheckPrice());
			get_List.add(cb);
		}
		return get_List;
	}
	
	private List<CheckStockListBean> changeStockTOcheck(List<StockBean> list_stock,String Id){
		List<CheckStockListBean> get_List=new ArrayList<CheckStockListBean>();
		for(int i=0;i<list_stock.size();i++){
			CheckStockListBean cslb=new CheckStockListBean();
			StockBean temp_stock=list_stock.get(i);
			cslb.setCsCode(Id);
			cslb.setMaterielCode(temp_stock.getMaterielCode());
			cslb.setMaterielName(temp_stock.getMaterielName());
			cslb.setCargoSpaceCode(temp_stock.getCargoSpaceCode());
			cslb.setCargoSpaceName(temp_stock.getCargoSpaceName());
			cslb.setCsStartNumber(Double.valueOf(temp_stock.getStockAmount()));
			cslb.setCsCheckNumber(Double.valueOf(temp_stock.getStockAmount()));
			cslb.setCsStartPrice(temp_stock.getStockPrice());
			cslb.setCsCheckPrice(temp_stock.getStockPrice());
			get_List.add(cslb);
		}
		return get_List;
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
