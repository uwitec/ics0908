package com.action.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.manage.storage.BackOrderManage;
import com.manage.storage.StockOutManage;
import com.mydomain.bean.storage.BackStockBean;
import com.mydomain.bean.storage.BackStockMaterielBean;
import com.mydomain.bean.storage.Page;
import com.mydomain.bean.storage.PageUtil;
import com.mydomain.bean.storage.StockOutBean;
import com.mydomain.bean.storage.StockOutHasMaterielBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class BackStockAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<BackStockBean> lhp;
	private List<BackStockMaterielBean> lbh;
	private BackStockBean backstock;
	private LinkedHashMap<String, String> back_type;
	private BackStockMaterielBean backStockMater;
	
	private Page page;
	private StockOutBean stock;
	private PageUtil<StockOutBean> stockOutList;
	private List<StockOutHasMaterielBean> stockOutHasMaterielList;
	
	
	
	/**
	 * @return the backStockMater
	 */
	public BackStockMaterielBean getBackStockMater() {
		return backStockMater;
	}
	/**
	 * @param backStockMater the backStockMater to set
	 */
	public void setBackStockMater(BackStockMaterielBean backStockMater) {
		this.backStockMater = backStockMater;
	}
	/**
	 * @return the stockOutHasMaterielList
	 */
	public List<StockOutHasMaterielBean> getStockOutHasMaterielList() {
		return stockOutHasMaterielList;
	}
	/**
	 * @param stockOutHasMaterielList the stockOutHasMaterielList to set
	 */
	public void setStockOutHasMaterielList(
			List<StockOutHasMaterielBean> stockOutHasMaterielList) {
		this.stockOutHasMaterielList = stockOutHasMaterielList;
	}
	/**
	 * @return the page
	 */
	public Page getPage() {
		return page;
	}
	/**
	 * @return the stock
	 */
	public StockOutBean getStock() {
		return stock;
	}
	/**
	 * @return the stockOutList
	 */
	public PageUtil<StockOutBean> getStockOutList() {
		return stockOutList;
	}
	/**
	 * @param page the page to set
	 */
	public void setPage(Page page) {
		this.page = page;
	}
	/**
	 * @param stock the stock to set
	 */
	public void setStock(StockOutBean stock) {
		this.stock = stock;
	}
	/**
	 * @param stockOutList the stockOutList to set
	 */
	public void setStockOutList(PageUtil<StockOutBean> stockOutList) {
		this.stockOutList = stockOutList;
	}
	/**
	 * @return the back_type
	 */
	public LinkedHashMap<String, String> getBack_type() {
		return back_type;
	}
	/**
	 * @param back_type the back_type to set
	 */
	public void setBack_type(LinkedHashMap<String, String> back_type) {
		this.back_type = back_type;
	}
	/**
	 * @return the backstock
	 */
	public BackStockBean getBackstock() {
		return backstock;
	}
	/**
	 * @return the lbh
	 */
	public List<BackStockMaterielBean> getLbh() {
		return lbh;
	}
	/**
	 * @return the lhp
	 */
	public List<BackStockBean> getLhp() {
		return lhp;
	}
	/**
	 * @param backstock the backstock to set
	 */
	public void setBackstock(BackStockBean backstock) {
		this.backstock = backstock;
	}
	/**
	 * @param lbh the lbh to set
	 */
	public void setLbh(List<BackStockMaterielBean> lbh) {
		this.lbh = lbh;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<BackStockBean> lhp) {
		this.lhp = lhp;
	}

	@SuppressWarnings("unchecked")
	private void getState(){
		back_type=(LinkedHashMap<String, String>) IcdbOption.getTableState();
	}
	
	public String showBackStock(){
		BackOrderManage bom=new BackOrderManage();
		backstock=bom.getBackPage(backstock);
		lhp=bom.getBackStockList(backstock);
		this.getState();
		return SUCCESS;
	}
	
	public String goAddBackStock(){
		StockOutManage stockOutManage = new StockOutManage();
		backstock.setBackOrderCode(ICTools.randId("BS"));
		backstock.setStockOutDate(ICTools.getTime());
		backstock.setRePath("add");
		try {
			stockOutHasMaterielList = stockOutManage.getStockOutHaskMaterielAndStock(backstock.getStockOutOrderCode());
			lbh=this.changeOuttoBack(stockOutHasMaterielList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
		}
		
		return SUCCESS;
	}
	
	public String addOrUpdateBackOrder(){
		BackOrderManage bom=new BackOrderManage();
		lbh=this.getBackOrderList();
		if(backstock.getRePath().equals("add")){
			bom.addBackStock(backstock,lbh);
		}else if(backstock.getRePath().equals("update")){
			bom.updateBackStock(backstock,lbh);
		}
		return SUCCESS;
	}
	
	public String getOneBackOrder(){
		BackOrderManage bom=new BackOrderManage();
		backstock=bom.getBackStockOne(backstock);
		backstock.setRePath("update");
		lbh=bom.getBackStockMaterList(backstock);
		return SUCCESS;
	}
	
	
	
	private List<BackStockMaterielBean> getBackOrderList(){
		List<BackStockMaterielBean> temp_backmater=new ArrayList<BackStockMaterielBean>();
		int indexSize=backStockMater.getMaterielCode().split(",").length;
		for(int i=0;i<indexSize;i++){
			BackStockMaterielBean temp_bean=new BackStockMaterielBean();
			temp_bean.setCargoSpaceCode(backStockMater.getCargoSpaceCode().split(",")[i].trim());
			temp_bean.setMaterielCode(backStockMater.getMaterielCode().split(",")[i].trim());
			temp_bean.setMaterelCount(Double.valueOf(backStockMater.getStr_materelCount().split(",")[i].trim()));
			temp_bean.setMaterelPrice(Double.valueOf(backStockMater.getStr_materelPrice().split(",")[i].trim()));
			temp_bean.setBackOrderCode(backstock.getBackOrderCode());
			temp_backmater.add(temp_bean);
		}
		return temp_backmater;
	}
	
	private List<BackStockMaterielBean> changeOuttoBack(List<StockOutHasMaterielBean> stockOutHasMaterielList){
		List<BackStockMaterielBean> temp_backmater=new ArrayList<BackStockMaterielBean>();
		for(StockOutHasMaterielBean temp_outmateri :stockOutHasMaterielList){
			BackStockMaterielBean temp_materiel=new BackStockMaterielBean();
			temp_materiel.setCargoSpaceCode(temp_outmateri.getCargoSpaceCode());
			temp_materiel.setMaterelPrice(temp_outmateri.getStockOutPrice());
			temp_materiel.setMaterielCode(temp_outmateri.getMaterielCode());
			temp_materiel.setMaterielName(temp_outmateri.getMaterielName());
			temp_materiel.setMaterelCount(temp_outmateri.getStockOutAmount());
			temp_materiel.setStr_materelCount(String.valueOf(temp_outmateri.getStockOutAmount()));
			temp_materiel.setStr_materelPrice(String.valueOf(temp_outmateri.getStockOutPrice()));
			temp_backmater.add(temp_materiel);
		}
		return temp_backmater;
	}
	
	public String findStockOutOver(){
		if (page == null) {
			page = new Page();
		}

		if (stock == null) {
			stock = new StockOutBean();
		}

		StockOutManage stockOutManage = new StockOutManage();
		try {
			stockOutList = stockOutManage.findStockOut(stock, page);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return ERROR;
		}

		return SUCCESS;
	}
	
}
