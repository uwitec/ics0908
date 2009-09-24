package com.action.stockmanage;

import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.manage.stockmanage.StockLevelManage;
import com.mydomain.bean.stockmanage.StockLevel;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class StockLevelAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StockLevel stockLevel;
	private List<StockLevel> lhp;
	private LinkedHashMap<String, String> lsb;
	/**
	 * @return the lhp
	 */
	public List<StockLevel> getLhp() {
		return lhp;
	}
	/**
	 * @return the lsb
	 */
	public LinkedHashMap<String, String> getLsb() {
		return lsb;
	}
	/**
	 * @return the stockLevel
	 */
	public StockLevel getStockLevel() {
		return stockLevel;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<StockLevel> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param lsb the lsb to set
	 */
	public void setLsb(LinkedHashMap<String, String> lsb) {
		this.lsb = lsb;
	}
	/**
	 * @param stockLevel the stockLevel to set
	 */
	public void setStockLevel(StockLevel stockLevel) {
		this.stockLevel = stockLevel;
	}
	
	@SuppressWarnings("unchecked")
	public String showOutLevel(){
		StockLevelManage sll=new StockLevelManage();
		if(stockLevel==null)
			stockLevel=new StockLevel();
		
		if(stockLevel.getStartTime()==null)
			stockLevel.setStartTime("2000-01-01");
		if(stockLevel.getEndTime()==null)
			stockLevel.setEndTime(ICTools.getSearchTime());
		
		stockLevel=sll.getStockLevelPage(stockLevel);
		lhp=sll.getStockLevelList(stockLevel);
		lsb=(LinkedHashMap<String, String>) IcdbOption.getABCType();
		return SUCCESS;
	}
	
}
