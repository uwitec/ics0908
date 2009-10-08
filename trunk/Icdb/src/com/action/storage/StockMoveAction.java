package com.action.storage;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.manage.baseset.CargoSpaceManage;
import com.manage.baseset.StorehouseManage;
import com.manage.storage.StockManage;
import com.manage.storage.TransferMoveManage;
import com.mydomain.bean.baseset.CargoSpaceBean;
import com.mydomain.bean.baseset.StorehouseBean;
import com.mydomain.bean.storage.StockBean;
import com.mydomain.bean.storage.TransferOrderBean;
import com.mydomain.bean.storage.TransferOrderHasMaterielBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class StockMoveAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<TransferOrderBean> lhp;
	private LinkedHashMap<String, List<CargoSpaceBean>> cardoublelist;
	private List<TransferOrderHasMaterielBean> transferlist;
	private TransferOrderHasMaterielBean tranfermater;
	private TransferOrderBean transferOrder;
	private List<StorehouseBean> houselist;
	private LinkedHashMap<String, String> tranf_state;
	private LinkedHashMap<String, String> tranf_type;
	private StorehouseBean storhouse;
	private List<StockBean> stockmater;
	
	
	
	/**
	 * @return the cardoublelist
	 */
	public LinkedHashMap<String, List<CargoSpaceBean>> getCardoublelist() {
		return cardoublelist;
	}
	/**
	 * @param cardoublelist the cardoublelist to set
	 */
	public void setCardoublelist(
			LinkedHashMap<String, List<CargoSpaceBean>> cardoublelist) {
		this.cardoublelist = cardoublelist;
	}
	/**
	 * @return the stockmater
	 */
	public List<StockBean> getStockmater() {
		return stockmater;
	}
	/**
	 * @param stockmater the stockmater to set
	 */
	public void setStockmater(List<StockBean> stockmater) {
		this.stockmater = stockmater;
	}
	/**
	 * @return the storhouse
	 */
	public StorehouseBean getStorhouse() {
		return storhouse;
	}
	/**
	 * @param storhouse the storhouse to set
	 */
	public void setStorhouse(StorehouseBean storhouse) {
		this.storhouse = storhouse;
	}
	/**
	 * @return the tranf_state
	 */
	public LinkedHashMap<String, String> getTranf_state() {
		return tranf_state;
	}
	/**
	 * @return the tranf_type
	 */
	public LinkedHashMap<String, String> getTranf_type() {
		return tranf_type;
	}
	/**
	 * @param tranf_state the tranf_state to set
	 */
	public void setTranf_state(LinkedHashMap<String, String> tranf_state) {
		this.tranf_state = tranf_state;
	}
	/**
	 * @param tranf_type the tranf_type to set
	 */
	public void setTranf_type(LinkedHashMap<String, String> tranf_type) {
		this.tranf_type = tranf_type;
	}
	/**
	 * @return the houselist
	 */
	public List<StorehouseBean> getHouselist() {
		return houselist;
	}
	/**
	 * @param houselist the houselist to set
	 */
	public void setHouselist(List<StorehouseBean> houselist) {
		this.houselist = houselist;
	}

	/**
	 * @return the transferOrder
	 */
	public TransferOrderBean getTransferOrder() {
		return transferOrder;
	}
	/**
	 * @param transferOrder the transferOrder to set
	 */
	public void setTransferOrder(TransferOrderBean transferOrder) {
		this.transferOrder = transferOrder;
	}
	/**
	 * @return the tranfermater
	 */
	public TransferOrderHasMaterielBean getTranfermater() {
		return tranfermater;
	}
	/**
	 * @param tranfermater the tranfermater to set
	 */
	public void setTranfermater(TransferOrderHasMaterielBean tranfermater) {
		this.tranfermater = tranfermater;
	}
	
	/**
	 * @return the lhp
	 */
	public List<TransferOrderBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the transferlist
	 */
	public List<TransferOrderHasMaterielBean> getTransferlist() {
		return transferlist;
	}

	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<TransferOrderBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param transferlist the transferlist to set
	 */
	public void setTransferlist(List<TransferOrderHasMaterielBean> transferlist) {
		this.transferlist = transferlist;
	}
	
	private List<TransferOrderHasMaterielBean> getList(){
		List<TransferOrderHasMaterielBean> temp_list=new ArrayList<TransferOrderHasMaterielBean>();	
		int list_size=tranfermater.getMaterielCode().split(",").length;
		for(int i=0;i<list_size;i++){
			TransferOrderHasMaterielBean change_transfer=new TransferOrderHasMaterielBean();
			change_transfer.setCargoSpaceCode(tranfermater.getCargoSpaceCode().split(",")[i].trim());
			change_transfer.setNewcargoSpaceCode(tranfermater.getNewcargoSpaceCode().split(",")[i].trim());
			change_transfer.setMaterielCode(tranfermater.getMaterielCode().split(",")[i].trim());
			change_transfer.setMoveAmount(Double.valueOf(tranfermater.getStr_mouveAmoutn().split(",")[i].trim()));
			change_transfer.setTransferOrderCode(transferOrder.getTransferOrderCode());
			change_transfer.setStockPrice(tranfermater.getStockPrice().split(",")[i].trim());
			temp_list.add(change_transfer);
		}
		return temp_list;
	}
	
	/*
	private List<CargoSpaceBean> getCargoSapceList(String houseCode){
		CargoSpaceManage csm=new CargoSpaceManage();
		StorehouseBean storehouse=new StorehouseBean();
		storehouse.setStorehouseCode(houseCode);
		return csm.getCargoSapceOfStoreHouse(storehouse);
	}
	*/
	
	private void getStockMater(){
		StockManage sm=new StockManage();
		StockBean temp_stock=new StockBean();
		temp_stock.setStorehouseCode(storhouse.getStorehouseCode());
		stockmater=sm.getStockListOfStoreHouse(temp_stock);
	}
	
	private List<TransferOrderHasMaterielBean> stockChangetoTransfer(List<StockBean> stocklist){
		 List<TransferOrderHasMaterielBean> temp_transferlist=new ArrayList<TransferOrderHasMaterielBean>();
		 for(StockBean temp_stock:stocklist){
			 TransferOrderHasMaterielBean temp_transferma=new TransferOrderHasMaterielBean();
			 temp_transferma.setMaterielCode(temp_stock.getMaterielCode());
			 temp_transferma.setMaterielName(temp_stock.getMaterielName());
			 temp_transferma.setCargoSpaceCode(temp_stock.getCargoSpaceCode());
			 temp_transferma.setCargoSpaceName(temp_stock.getCargoSpaceName());
			 temp_transferma.setStockAmount(temp_stock.getStockAmount());
			 temp_transferma.setMoveAmount(Double.valueOf(temp_stock.getStockAmount()));
			 temp_transferma.setStockPrice(String.valueOf(temp_stock.getStockPrice()));
			 temp_transferlist.add(temp_transferma);
		 }
		 
		 return temp_transferlist;
	}
	
	private void gethouselist(){
		StorehouseManage shm=new StorehouseManage();
		houselist=shm.getStorhouseAllList();
	}
	
	private void gethouseName(String Id){
		StorehouseManage sb=new StorehouseManage();
		storhouse=sb.getStorehouseOne(Id);
	}
	
	@SuppressWarnings("unchecked")
	private void getAllState(){
		tranf_state=(LinkedHashMap<String, String>) IcdbOption.getTableState();
		tranf_type=(LinkedHashMap<String, String>) IcdbOption.getMoveStype();
	}
	
	
	private LinkedHashMap<String, List<CargoSpaceBean>> getDoubleCarSelect(){
		StorehouseManage sm=new StorehouseManage();
		CargoSpaceManage cm=new CargoSpaceManage();
		LinkedHashMap<String, List<CargoSpaceBean>> doublelist=new LinkedHashMap<String, List<CargoSpaceBean>>();
		List<StorehouseBean> houselist=sm.getStorhouseAllList();
		for(StorehouseBean temp_house:houselist){
			List<CargoSpaceBean> temp_carg=cm.getCargoSapceOfStoreHouse(temp_house);
			doublelist.put(temp_house.getStorehouseCode(), temp_carg);
		}
		return doublelist;
	}
	public String showStockMove(){
		TransferMoveManage tmm=new TransferMoveManage();
		transferOrder=tmm.getTransferOrderPage(transferOrder);
		lhp=tmm.getTransferOrderList(transferOrder);
		getAllState();
		gethouselist();
		return SUCCESS;
	}
	
	public String goAddStockMove(){
		
		transferOrder.setTransferOrderCode(ICTools.randId("TM"));
		transferOrder.setTransferOrderTime(ICTools.getTime());
		transferOrder.setRePath("add");
		
		getAllState();
		gethouselist();
		getStockMater();
		transferlist=this.stockChangetoTransfer(stockmater);
		gethouseName(storhouse.getStorehouseCode());
		cardoublelist=this.getDoubleCarSelect();
		return SUCCESS;
	}
	
	public String addOrUpdateStockMove(){
		TransferMoveManage tmm=new TransferMoveManage();
		List<TransferOrderHasMaterielBean> addTranfList=this.getList();
		
		if(transferOrder.getRePath().equals("add")){
			tmm.addTransfer(transferOrder, addTranfList);
		}else if(transferOrder.getRePath().equals("update")){
			tmm.updateTransfer(transferOrder, addTranfList);
		}
		
		return SUCCESS;
	}
	
	public String getOneStockMove(){
		TransferMoveManage tmm=new TransferMoveManage();
		transferOrder=tmm.getTransferOrderOne(transferOrder.getTransferOrderCode());
		transferOrder.setRePath("update");
		transferlist=tmm.getTransferOrderMaterList(transferOrder);
		gethouselist();
		getAllState();
		cardoublelist=this.getDoubleCarSelect();
		gethouseName(transferOrder.getStorehouseCode());
		return SUCCESS;
	}
}
