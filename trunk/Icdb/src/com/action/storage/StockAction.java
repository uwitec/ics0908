package com.action.storage;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.CargoSpaceBean;
import com.mydomain.bean.baseset.StorehouseBean;
import com.mydomain.bean.storage.StockBean;
import com.opensymphony.xwork2.ActionSupport;

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
		StorehouseBean shb=new StorehouseBean();
		try {
			lsb=(List<StorehouseBean>) DBServer.quider.queryForList("seletStorehouseALL", shb);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getStockMaterielList(){
		try {
		
			storehouse=(StorehouseBean) DBServer.quider.queryForObjectById(storehouse.getStorehouseCode(), StorehouseBean.class);
			System.out.println(storehouse.getStorehouseCode());
			lcsb=(List<CargoSpaceBean>) DBServer.quider.queryForList("getHouseSpace",storehouse);
			lhp=(List<StockBean>) DBServer.quider.queryForList("selectStockOfStoreHouse", stock);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addStock(){
		try {
			DBServer.quider.insertObject(storehouse);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

}
