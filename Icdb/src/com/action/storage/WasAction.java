package com.action.storage;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.manage.storage.StockManage;
import com.manage.storage.WasMaterielManage;
import com.manage.storage.WasTageManage;
import com.mydomain.bean.baseset.EmployeeBean;
import com.mydomain.bean.baseset.MaterielBean;
import com.mydomain.bean.baseset.StorehouseBean;
import com.mydomain.bean.storage.StockBean;
import com.mydomain.bean.storage.WasMaterielBean;
import com.mydomain.bean.storage.WasTageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class WasAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<WasTageBean> lhp;
	private WasTageBean wasTage;
	private List<WasMaterielBean> lwb;
	private LinkedHashMap<String, String> wasTypeList;
	private LinkedHashMap<String, String> wasComplete;
	private List<StorehouseBean> lshb;
	private List<MaterielBean> lmb;
	private String materielCode;
	private String stockPrice;
	private String wasNumber;
	private String wasCause;
	private String cargoSpaceCode;
	
	private EmployeeBean emp;
	

	/**
	 * @return the emp
	 */
	public EmployeeBean getEmp() {
		return emp;
	}
	/**
	 * @param emp the emp to set
	 */
	public void setEmp(EmployeeBean emp) {
		this.emp = emp;
	}
	/**
	 * @return the cargoSpaceCode
	 */
	public String getCargoSpaceCode() {
		return cargoSpaceCode;
	}
	/**
	 * @param cargoSpaceCode the cargoSpaceCode to set
	 */
	public void setCargoSpaceCode(String cargoSpaceCode) {
		this.cargoSpaceCode = cargoSpaceCode;
	}
	/**
	 * @return the wasComplete
	 */
	public LinkedHashMap<String, String> getWasComplete() {
		return wasComplete;
	}
	/**
	 * @param wasComplete the wasComplete to set
	 */
	public void setWasComplete(LinkedHashMap<String, String> wasComplete) {
		this.wasComplete = wasComplete;
	}
	/**
	 * @return the lmb
	 */
	public List<MaterielBean> getLmb() {
		return lmb;
	}
	/**
	 * @param lmb the lmb to set
	 */
	public void setLmb(List<MaterielBean> lmb) {
		this.lmb = lmb;
	}
	/**
	 * @return the lshb
	 */
	public List<StorehouseBean> getLshb() {
		return lshb;
	}
	/**
	 * @param lshb the lshb to set
	 */
	public void setLshb(List<StorehouseBean> lshb) {
		this.lshb = lshb;
	}
	/**
	 * @return the lhp
	 */
	public List<WasTageBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the lwb
	 */
	public List<WasMaterielBean> getLwb() {
		return lwb;
	}
	/**
	 * @return the wasTage
	 */
	public WasTageBean getWasTage() {
		return wasTage;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<WasTageBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param lwb the lwb to set
	 */
	public void setLwb(List<WasMaterielBean> lwb) {
		this.lwb = lwb;
	}
	
	/**
	 * @param wasTage the wasTage to set
	 */
	public void setWasTage(WasTageBean wasTage) {
		this.wasTage = wasTage;
	}
	
	/**
	 * @return the wasTypeList
	 */
	public LinkedHashMap<String, String> getWasTypeList() {
		return wasTypeList;
	}
	/**
	 * @param wasTypeList the wasTypeList to set
	 */
	public void setWasTypeList(LinkedHashMap<String, String> wasTypeList) {
		this.wasTypeList = wasTypeList;
	}
	
	
	/**
	 * @return the materielCode
	 */
	public String getMaterielCode() {
		return materielCode;
	}
	/**
	 * @return the stockPrice
	 */
	public String getStockPrice() {
		return stockPrice;
	}
	/**
	 * @return the wasCause
	 */
	public String getWasCause() {
		return wasCause;
	}
	/**
	 * @return the wasNumber
	 */
	public String getWasNumber() {
		return wasNumber;
	}
	/**
	 * @param materielCode the materielCode to set
	 */
	public void setMaterielCode(String materielCode) {
		this.materielCode = materielCode;
	}
	/**
	 * @param stockPrice the stockPrice to set
	 */
	public void setStockPrice(String stockPrice) {
		this.stockPrice = stockPrice;
	}
	/**
	 * @param wasCause the wasCause to set
	 */
	public void setWasCause(String wasCause) {
		this.wasCause = wasCause;
	}
	/**
	 * @param wasNumber the wasNumber to set
	 */
	public void setWasNumber(String wasNumber) {
		this.wasNumber = wasNumber;
	}
	@SuppressWarnings("unchecked")
	public String showWasTage(){
		 WasTageManage wtm=new WasTageManage();
		 this.getUserSession();
		if(wasTage==null){
			wasTage=new WasTageBean();
			ICTools.setBean(wasTage, "");
		}else{
			ICTools.setBean(wasTage, wasTage.getS_value());
		}
		wasTage.setOptionor(emp.getPersonCode());
		
		wasTage=wtm.getPageWasTagePerson(wasTage);
		lhp=wtm.getWasPersonList(wasTage);
		wasTypeList=(LinkedHashMap<String, String>) IcdbOption.getLostState();
		wasComplete=(LinkedHashMap<String, String>) IcdbOption.getTableState();
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showWasHistroy(){
		WasTageManage wtm=new WasTageManage();
		wasTage=wtm.getPageWasTage(wasTage);
		wasTypeList=(LinkedHashMap<String, String>) IcdbOption.getLostState();
		wasComplete=(LinkedHashMap<String, String>) IcdbOption.getTableState();
		lhp=wtm.getWasTageList(wasTage);
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String goAddWas(){
		 this.getUserSession();

		if(wasTage==null)
			wasTage=new WasTageBean();
		wasTage.setWasCode(ICTools.randId("W"));
		wasTypeList=(LinkedHashMap<String, String>) IcdbOption.getLostState();
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getOneWas(){
		WasTageManage wtm=new WasTageManage();
		WasMaterielManage wmm=new WasMaterielManage();
		WasMaterielBean wasMateriel=new WasMaterielBean();
		 this.getUserSession();
		wasTypeList=(LinkedHashMap<String, String>) IcdbOption.getLostState();
		wasTage=wtm.getWasTageOne(wasTage.getWasCode());
		wasMateriel.setWasCode(wasTage.getWasCode());
		lwb=wmm.getWasMaterileList(wasMateriel);
		return SUCCESS;
		
	}
	
	public String updateOneWas(){
		getOneWas();
		return SUCCESS;
	}
	
	public String updateWasTage(){
		
		WasTageManage wtm=new WasTageManage();
		List<WasMaterielBean> lwmb=changeToWasMateriel();	
		this.getUserSession();
		if(!wasTage.getS_value().equals("")){
			wasTage.setWasState(2);
		}else{
			wasTage.setWasState(1);
			if(!updateStock()){
				wasTage.setWasState(2);
			}
		}
		wasTage.setOptionor(emp.getPersonCode());
		if(wtm.updateWasTageAll(lwmb,wasTage)){
			wasTage.setMessage(ICTools.MESSAGE_OK);
		}else{
			wasTage.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String addWasTage(){
		
		
		WasMaterielManage wmm=new WasMaterielManage();
		List<WasMaterielBean> lwmb=changeToWasMateriel();
		wasTage.setWasTime(ICTools.getTime());
		
		if(!wasTage.getS_value().equals("")){
			wasTage.setWasState(2);
		}else{
			wasTage.setWasState(1);
			if(!updateStock()){
				wasTage.setWasState(2);
			}
		}
		this.getUserSession();
		wasTage.setOptionor(emp.getPersonCode());
		if(wmm.addWasMaterielList(lwmb,wasTage)){
			wasTage.setMessage(ICTools.MESSAGE_OK);
		}else{
			wasTage.setMessage(ICTools.MESSAGE_ERROR);
		}
		
		
		return SUCCESS;
	}
	
	
	public String deleteWas(){
		WasTageManage wtm=new WasTageManage();
		wtm.deleteWasTage(wasTage);
		return SUCCESS;
	}
	
	private void getUserSession(){
		this.emp=(EmployeeBean) ActionContext.getContext().getSession().get("user");
		
	}
	
	
	private boolean updateStock(){
		StockManage sm=new StockManage();
		List<StockBean> list_stock=changeWasMaterToStock();
		return sm.outStockList(list_stock);
		
	}
	
	private List<StockBean> changeWasMaterToStock(){
		List<WasMaterielBean> lwmb=new ArrayList<WasMaterielBean>();
		List<StockBean> lstockb=new ArrayList<StockBean>();
		lwmb=changeToWasMateriel();
		for(int i=0;i<lwmb.size();i++){
			StockBean temp_sb=new StockBean();
			temp_sb.setCargoSpaceCode(lwmb.get(i).getCargoSpaceCode());
			temp_sb.setMaterielCode(lwmb.get(i).getMaterielCode());
			temp_sb.setStockAmount(lwmb.get(i).getWasNumber());
			lstockb.add(temp_sb);
		}
		return lstockb;
		
	}
	
	private List<WasMaterielBean> changeToWasMateriel(){
		List<WasMaterielBean> lwmb=new ArrayList<WasMaterielBean>();
		if(materielCode!=null && stockPrice!=null && wasNumber!=null && wasCause!=null){
			String []materielCodes=materielCode.split(",");
			String []stockPrices=stockPrice.split(",");
			String []wasNumbers=wasNumber.split(",");
			String []wasCauses=wasCause.split(",");
			String []cargoSpaceCodes=cargoSpaceCode.split(",");
			for(int i=0;i<materielCodes.length;i++){
				WasMaterielBean wmBean=new WasMaterielBean();
				if(Double.valueOf(wasNumbers[i])>=0){
					wmBean.setWasCode(wasTage.getWasCode());
					wmBean.setMaterielCode(materielCodes[i].trim());
					wmBean.setWasMoney(stockPrices[i].trim());
					wmBean.setWasNumber(wasNumbers[i].trim());
					wmBean.setWasCause(wasCauses[i]);
					wmBean.setCargoSpaceCode(cargoSpaceCodes[i].trim());
				//	System.out.println(wmBean.getWasCode()+":"+wmBean.getMaterielCode());
					lwmb.add(wmBean);
				}
			}
		}
		return lwmb;
	}
	
	
}
