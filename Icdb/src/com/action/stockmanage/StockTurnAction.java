package com.action.stockmanage;

import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.manage.stockmanage.StockTurnManage;
import com.mydomain.bean.stockmanage.StockTurn;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class StockTurnAction extends ActionSupport{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StockTurn stockturn;
	private List<StockTurn> lhp;
	private LinkedHashMap<String, String> lsb;
	/**
	 * @return the lhp
	 */
	public List<StockTurn> getLhp() {
		return lhp;
	}
	/**
	 * @return the lsb
	 */
	public LinkedHashMap<String, String> getLsb() {
		return lsb;
	}
	/**
	 * @return the stockturn
	 */
	public StockTurn getStockturn() {
		return stockturn;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<StockTurn> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param lsb the lsb to set
	 */
	public void setLsb(LinkedHashMap<String, String> lsb) {
		this.lsb = lsb;
	}
	/**
	 * @param stockturn the stockturn to set
	 */
	public void setStockturn(StockTurn stockturn) {
		this.stockturn = stockturn;
	}
	
	@SuppressWarnings("unchecked")
	public String showStockTurn(){
		if(stockturn==null){
			stockturn=new StockTurn();
			stockturn.setStartTime("2000-01-01");
			stockturn.setEndTime(ICTools.getSearchTime());
			stockturn.setMaterielABC("");
			stockturn.setMaterielName("");
		}
		StockTurnManage stm=new StockTurnManage();
		stockturn=stm.getStockTurnPage(stockturn);
		lhp=stm.getStockTurnList(stockturn);
		lsb=(LinkedHashMap<String, String>) IcdbOption.getABCType();
		return SUCCESS;
	}
}
