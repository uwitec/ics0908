package com.action.storage;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.manage.baseset.StorehouseManage;
import com.manage.storage.PriceChangeManage;
import com.manage.storage.StockManage;
import com.mydomain.bean.baseset.StorehouseBean;
import com.mydomain.bean.storage.PriceChangeBean;
import com.mydomain.bean.storage.PriceChangeMaterBean;
import com.mydomain.bean.storage.StockBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class PriceChangeAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PriceChangeBean priceChange;
	private List<PriceChangeBean> lhp;
	private PriceChangeMaterBean pricechangeMater;
	private List<PriceChangeMaterBean> lpm;
	private List<StorehouseBean> lsb;
	private StorehouseBean storeHouse;
	
	private LinkedHashMap<String, String> price_type;
	/**
	 * @return the price_type
	 */
	public LinkedHashMap<String, String> getPrice_type() {
		return price_type;
	}
	/**
	 * @param price_type the price_type to set
	 */
	public void setPrice_type(LinkedHashMap<String, String> price_type) {
		this.price_type = price_type;
	}
	/**
	 * @return the lhp
	 */
	public List<PriceChangeBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the lpm
	 */
	public List<PriceChangeMaterBean> getLpm() {
		return lpm;
	}
	/**
	 * @return the lsb
	 */
	public List<StorehouseBean> getLsb() {
		return lsb;
	}
	/**
	 * @return the priceChange
	 */
	public PriceChangeBean getPriceChange() {
		return priceChange;
	}
	/**
	 * @return the pricechangeMater
	 */
	public PriceChangeMaterBean getPricechangeMater() {
		return pricechangeMater;
	}
	/**
	 * @return the storeHouse
	 */
	public StorehouseBean getStoreHouse() {
		return storeHouse;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<PriceChangeBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param lpm the lpm to set
	 */
	public void setLpm(List<PriceChangeMaterBean> lpm) {
		this.lpm = lpm;
	}
	/**
	 * @param lsb the lsb to set
	 */
	public void setLsb(List<StorehouseBean> lsb) {
		this.lsb = lsb;
	}
	/**
	 * @param priceChange the priceChange to set
	 */
	public void setPriceChange(PriceChangeBean priceChange) {
		this.priceChange = priceChange;
	}
	/**
	 * @param pricechangeMater the pricechangeMater to set
	 */
	public void setPricechangeMater(PriceChangeMaterBean pricechangeMater) {
		this.pricechangeMater = pricechangeMater;
	}
	/**
	 * @param storeHouse the storeHouse to set
	 */
	public void setStoreHouse(StorehouseBean storeHouse) {
		this.storeHouse = storeHouse;
	}
	
	@SuppressWarnings("unchecked")
	public String showPriceChange(){
		PriceChangeManage pcm=new PriceChangeManage();
		StorehouseManage sm=new StorehouseManage();
		priceChange=pcm.getPriceChangePage(priceChange);
		lhp=pcm.getPriceChangeList(priceChange);
		price_type=(LinkedHashMap<String, String>) IcdbOption.getTableState();
		lsb=sm.getStorhouseAllList();
		return SUCCESS;
	}
	
	public String goAddPriceChange(){
		StockManage sm=new StockManage();
		StockBean stock=new StockBean();
		stock.setStorehouseCode(storeHouse.getStorehouseCode());
		List<StockBean> stock_list=sm.getStockListOfStoreHouse(stock);
		lpm=this.changeStockToPriceChange(stock_list);
		priceChange=new PriceChangeBean();
		priceChange.setPchangeCode(ICTools.randId("PC"));
		priceChange.setPchangeDate(ICTools.getTime());
		priceChange.setRePath("add");
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getOnePriceChange(){
		PriceChangeManage pcm=new PriceChangeManage();
		priceChange=pcm.getOnePriceChange(priceChange);
		priceChange.setRePath("update");
		lpm=pcm.getPriceMaterList(priceChange);
		price_type=(LinkedHashMap<String, String>) IcdbOption.getTableState();
		return SUCCESS;
	}
	
	public String addOrUpdate(){
		PriceChangeManage pcm=new PriceChangeManage();
		lpm=this.getPriceMaterList();
		if(priceChange.getRePath().equals("add")){
			pcm.addPriceChange(priceChange, lpm);
		}else if(priceChange.getRePath().equals("update")) {
			pcm.updatePriceChange(priceChange, lpm);
		}
		return SUCCESS;
	}
	
	public String deletePriceChange(){
		PriceChangeManage pcm=new PriceChangeManage();
		pcm.deletePriceChange(priceChange);
		return SUCCESS;
	}
	
	private List<PriceChangeMaterBean> changeStockToPriceChange(List<StockBean> stock_list){
		List<PriceChangeMaterBean> temp_priceChange=new ArrayList<PriceChangeMaterBean>();
		for(StockBean temp_stock:stock_list){
			PriceChangeMaterBean temp_priceBean=new PriceChangeMaterBean();
			temp_priceBean.setCargoSpaceCode(temp_stock.getCargoSpaceCode());
			temp_priceBean.setCargoSpaceName(temp_stock.getCargoSpaceName());
			temp_priceBean.setMaterielCode(temp_stock.getMaterielCode());
			temp_priceBean.setMaterielName(temp_stock.getMaterielName());
			temp_priceBean.setStockPriceOld(temp_stock.getStockPrice());
			temp_priceBean.setStockPriceNew(temp_stock.getStockPrice());
			temp_priceChange.add(temp_priceBean);
		}
		return temp_priceChange;
	}
	
	private List<PriceChangeMaterBean> getPriceMaterList(){
		List<PriceChangeMaterBean> temp_priceChange=new ArrayList<PriceChangeMaterBean>();
		int indexSize=pricechangeMater.getMaterielCode().split(",").length;
		for(int i=0;i<indexSize;i++){
			PriceChangeMaterBean temp_pcMater=new PriceChangeMaterBean();
			temp_pcMater.setCargoSpaceCode(pricechangeMater.getCargoSpaceCode().split(",")[i].trim());
			temp_pcMater.setMaterielCode(pricechangeMater.getMaterielCode().split(",")[i].trim());
			temp_pcMater.setStockPriceNew(Double.valueOf(pricechangeMater.getStr_stockPriceNew().split(",")[i].trim()));
			temp_pcMater.setStockPriceOld(Double.valueOf(pricechangeMater.getStr_stockPriceOld().split(",")[i].trim()));
			temp_pcMater.setPchangeCode(priceChange.getPchangeCode());
			temp_priceChange.add(temp_pcMater);
		}
		return temp_priceChange;
	}
	
}
