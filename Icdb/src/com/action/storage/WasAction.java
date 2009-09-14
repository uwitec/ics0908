package com.action.storage;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.manage.storage.WasMaterielManage;
import com.manage.storage.WasTageManage;
import com.mydomain.bean.baseset.MaterielBean;
import com.mydomain.bean.baseset.StorehouseBean;
import com.mydomain.bean.storage.WasMaterielBean;
import com.mydomain.bean.storage.WasTageBean;
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
	private List<StorehouseBean> lshb;
	private List<MaterielBean> lmb;
	private String materielCode;
	private String stockPrice;
	private String wasNumber;
	private String wasCause;
	

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
		wasTage=wtm.getPageWasTagePerson(wasTage);
		wasTage.setWasCode(ICTools.randId("W"));
		wasTypeList=(LinkedHashMap<String, String>) IcdbOption.getLostState();
		lhp=wtm.getWasPersonList(wasTage);
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showWasHistroy(){
		WasTageManage wtm=new WasTageManage();
		wasTage=wtm.getPageWasTage(wasTage);
		wasTypeList=(LinkedHashMap<String, String>) IcdbOption.getLostState();
		lhp=wtm.getWasTageList(wasTage);
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getOneWas(){
		WasTageManage wtm=new WasTageManage();
		WasMaterielManage wmm=new WasMaterielManage();
		WasMaterielBean wasMateriel=new WasMaterielBean();
		
		wasTypeList=(LinkedHashMap<String, String>) IcdbOption.getLostState();
		wasTage=wtm.getWasTageOne(wasTage.getWasCode());
		wasMateriel.setWasCode(wasTage.getWasCode());
		lwb=wmm.getWasMaterileList(wasMateriel);
		return SUCCESS;
		
	}
	/*
	public String addWasTage1(){
		WasTageManage wtm=new WasTageManage();
		WasMaterielManage wmm=new WasMaterielManage();
		if(wtm.addWasTage(wasTage)){
			if(wmm.addWasMaterielList(wasmater)){
				res.setMessage(ICTools.MESSAGE_OK);
			}else{
				res.setMessage(ICTools.MESSAGE_ERROR);
			}
		}else{
				res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	*/
	public String addWasTage(){
		WasMaterielManage wmm=new WasMaterielManage();
		List<WasMaterielBean> lwmb=new ArrayList<WasMaterielBean>();
		if(materielCode!=null && stockPrice!=null && wasNumber!=null && wasCause!=null){
			String []materielCodes=materielCode.split(",");
			String []stockPrices=stockPrice.split(",");
			String []wasNumbers=wasNumber.split(",");
			String []wasCauses=wasCause.split(",");
			for(int i=0;i<materielCodes.length;i++){
				WasMaterielBean wmBean=new WasMaterielBean();
				if(Double.valueOf(wasNumbers[i])>=0){
					wmBean.setWasCode(wasTage.getWasCode());
					wmBean.setMaterielCode(materielCodes[i].trim());
					wmBean.setWasMoney(stockPrices[i].trim());
					wmBean.setWasNumber(wasNumbers[i].trim());
					wmBean.setWasCause(wasCauses[i]);
				//	System.out.println(wmBean.getWasCode()+":"+wmBean.getMaterielCode());
					lwmb.add(wmBean);
				}
			}
		}
		wasTage.setWasTime(ICTools.getTime());
		wasTage.setWasState(1);
		if(wmm.addWasMaterielList(lwmb,wasTage)){
			wasTage.setMessage(ICTools.MESSAGE_OK);
		}else{
			wasTage.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	
	
	
}
