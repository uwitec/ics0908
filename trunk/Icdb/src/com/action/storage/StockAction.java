package com.action.storage;

import java.util.List;

import com.manage.baseset.CargoSpaceManage;
import com.manage.baseset.StorehouseManage;
import com.manage.storage.StockManage;
import com.mydomain.bean.baseset.CargoSpaceBean;
import com.mydomain.bean.baseset.StorehouseBean;
import com.mydomain.bean.storage.StockBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class StockAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<StorehouseBean> lsb;
	private List<StockBean> lhp;
	private StockBean stock;
	private StorehouseBean storehouse;
	private List<CargoSpaceBean> lcsb;


	

	/**
	 * @return the lcsb
	 */
	public List<CargoSpaceBean> getLcsb() {
		return lcsb;
	}

	/**
	 * @param lcsb the lcsb to set
	 */
	public void setLcsb(List<CargoSpaceBean> lcsb) {
		this.lcsb = lcsb;
	}

	
	/**
	 * @return the storehouse
	 */
	public StorehouseBean getStorehouse() {
		return storehouse;
	}

	/**
	 * @param storehouse the storehouse to set
	 */
	public void setStorehouse(StorehouseBean storehouse) {
		this.storehouse = storehouse;
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
	 * @return the lhp
	 */
	public List<StockBean> getLhp() {
		return lhp;
	}

	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<StockBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @return the stock
	 */
	public StockBean getStock() {
		return stock;
	}

	/**
	 * @param stock the stock to set
	 */
	public void setStock(StockBean stock) {
		this.stock = stock;
	}
	
	@SuppressWarnings("unchecked")
	public String getStoreHouseList(){
		StorehouseManage sm=new StorehouseManage();
		lsb=sm.getStorhouseAllList();
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getStockMaterielList(){
		StorehouseManage sm=new StorehouseManage();
		StockManage stockM=new StockManage();
		CargoSpaceManage csm=new CargoSpaceManage();
			if(stock==null){
				stock=new StockBean();
			}
			storehouse=sm.getStorehouseOne(storehouse.getStorehouseCode());
			stock.setStorehouseCode(storehouse.getStorehouseCode());
		//	System.out.println(storehouse.getStorehouseCode());
			lcsb=csm.getCargoSapceOfStoreHouse(storehouse);
			lhp=stockM.getStockListOfStoreHouse(stock);
		return SUCCESS;
	}

	public String addStock(){
		StockManage stockM=new StockManage();
		stockM.addStock(stock);
		return SUCCESS;
	}

	public String showMaterStore(){
		if(stock==null){
			stock=new StockBean();
			ICTools.setBean(stock, "");
		}
		StorehouseManage sm=new StorehouseManage();
		StockManage stockM=new StockManage();
		lsb=sm.getStorhouseAllList();
		lhp=stockM.getStockListOfStoreHouse(stock);
		return SUCCESS;
	}
}
