package com.action.stockmanage;

import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.manage.stockmanage.StockMaxMinManage;
import com.mydomain.bean.stockmanage.StockMaxMin;
import com.opensymphony.xwork2.ActionSupport;

public class StockMaxMinAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private StockMaxMin stockmm;
	private LinkedHashMap<String, String> lsb;
	private List<StockMaxMin> lhp;
	private StockMaxMinManage stockGM=new StockMaxMinManage();
	/**
	 * @return the lhp
	 */
	public List<StockMaxMin> getLhp() {
		return lhp;
	}
	/**
	 * @return the lsb
	 */
	public LinkedHashMap<String, String> getLsb() {
		return lsb;
	}
	/**
	 * @return the stockmm
	 */
	public StockMaxMin getStockmm() {
		return stockmm;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<StockMaxMin> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param lsb the lsb to set
	 */
	public void setLsb(LinkedHashMap<String, String> lsb) {
		this.lsb = lsb;
	}
	/**
	 * @param stockmm the stockmm to set
	 */
	public void setStockmm(StockMaxMin stockmm) {
		this.stockmm = stockmm;
	}
	
	public String showMax(){
		if(stockmm==null){
			stockmm=new StockMaxMin();
			stockmm.setMaterielABC("-1");
		}
		if(stockmm.getMaterielABC().equals("-1")){
			showMaxAll();
		}else{
			showDefMax();
		}
		
		return SUCCESS;
	}
	
	public String showMin(){
		if(stockmm==null){
			stockmm=new StockMaxMin();
			stockmm.setMaterielABC("-1");
		}
		if(stockmm.getMaterielABC().equals("-1")){
			showMinAll();
		}else{
			showDefMin();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	private void showMaxAll(){
		 stockmm=stockGM.getStocMaxAllPage(stockmm);
		 lhp=stockGM.getStockMaxAll(stockmm);
		 lsb=(LinkedHashMap<String, String>) IcdbOption.getABCType();
	}
	
	@SuppressWarnings("unchecked")
	private void showMinAll(){
		stockmm=stockGM.getStockMinAllPage(stockmm);
		lhp=stockGM.getStockMinAll(stockmm);
		lsb=(LinkedHashMap<String, String>) IcdbOption.getABCType();
	}
	
	@SuppressWarnings("unchecked")
	private void showDefMax(){
		stockmm=stockGM.getStockMaxDefPage(stockmm);
		lhp=stockGM.getStockMaxDef(stockmm);
		lsb=(LinkedHashMap<String, String>) IcdbOption.getABCType();
	}
	
	@SuppressWarnings("unchecked")
	private void showDefMin(){
		stockmm=stockGM.getStockMinDefPage(stockmm);
		lhp=stockGM.getStockMinDef(stockmm);
		lsb=(LinkedHashMap<String, String>) IcdbOption.getABCType();
	}
}
