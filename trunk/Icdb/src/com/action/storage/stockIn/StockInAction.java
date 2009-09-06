package com.action.storage.stockIn;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import net.sf.json.JSONObject;

import com.manage.storage.CargoSpaceManage;
import com.manage.storage.MaterielManage;
import com.manage.storage.StockInManage;
import com.manage.storage.SupplierManange;
import com.mydomain.bean.baseset.CargoSpaceBean;
import com.mydomain.bean.baseset.SupplierBean;
import com.mydomain.bean.storage.MaterielBean;
import com.mydomain.bean.storage.Page;
import com.mydomain.bean.storage.PageUtil;
import com.mydomain.bean.storage.StockInBean;
import com.mydomain.bean.storage.StockInCheckMaterielBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class StockInAction extends ActionSupport {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private StockInBean stock;

	private Page page;

	private StockInCheckMaterielBean stockInCheckMaterielBean;

	private List<StockInCheckMaterielBean> StockInCheckMaterielBeanList;

	private PageUtil<StockInBean> stockInList;

	private List<MaterielBean> materielList;

	private List<CargoSpaceBean> cargoSpaceList;

	private List<SupplierBean> supplierList;

	private String materielIds;

	public String searchStockIn() {

		if (page == null) {
			page = new Page();
		}

		if (stock == null) {
			stock = new StockInBean();
			stock.setStockInStateType(2);
			stock.setStockInCheckState(-2);
		}
		StockInManage stockInManage = new StockInManage();

		try {
			stockInList = stockInManage.findStockIn(stock, page);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return ERROR;
		}

		return SUCCESS;
	}

	public String goAddStockIn() throws SQLException {
		stock = new StockInBean();
		stockInCheckMaterielBean = new StockInCheckMaterielBean();
		stock.setStockInCode(ICTools.randId("SI"));
		CargoSpaceManage cargoSpaceManage = new CargoSpaceManage();
		this.cargoSpaceList = cargoSpaceManage.getCargoSpaceList();

		SupplierManange supplierManage = new SupplierManange();
		this.supplierList = supplierManage.getSupliers();
		return SUCCESS;
	}

	public String goEditStockIn() throws SQLException{

		StockInManage stockInManage = new StockInManage();
		stock = stockInManage.getStockInInfo(stock.getStockInCode());
		this.StockInCheckMaterielBeanList = stockInManage.getStockInCheckMateriel(stock.getStockInCode());
		CargoSpaceManage cargoSpaceManage = new CargoSpaceManage();
		this.cargoSpaceList = cargoSpaceManage.getCargoSpaceList();

		SupplierManange supplierManage = new SupplierManange();
		this.supplierList = supplierManage.getSupliers();
		return SUCCESS;

	}

	public String addMaterielList() throws SQLException {

		MaterielManage materielManage = new MaterielManage();
		MaterielBean materelBean = new MaterielBean();
		if (this.materielIds != null && !this.materielIds.equals("")) {
			String[] materiels = this.materielIds.split(",");
			List<String> materielList = new ArrayList<String>();
			for (int i = 0; i < materiels.length; i++) {
				materielList.add(materiels[i]);
			}
			materelBean.setMaterielIds(materielList);
		}
		this.materielList = materielManage.getAllMateriel(materelBean);
		return SUCCESS;
	}

	/**
	 * 保存入库单
	 *
	 * @return
	 * @throws SQLException
	 */
	// public String saveStockIn() {
	// stock.setStockInDate(new Date());
	//
	// return SUCCESS;
	// }
	public String saveStockIn(String json, String[] json2) throws SQLException {
		StockInManage stockInManage = new StockInManage();
		JSONObject jsonObject = JSONObject.fromObject(json);
		StockInBean stockInBean = (StockInBean) JSONObject.toBean(jsonObject,
				StockInBean.class);

		List<StockInCheckMaterielBean> stockInCheckMaterielList = new ArrayList<StockInCheckMaterielBean>();
		for (int i = 0; i < json2.length; i++) {
			stockInCheckMaterielList.add((StockInCheckMaterielBean) JSONObject
					.toBean(JSONObject.fromObject(json2[i]),
							StockInCheckMaterielBean.class));
		}

		if (stockInManage.save(stockInBean, stockInCheckMaterielList)) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	public String submitStockIn(String json, String[] json2) throws SQLException {
		StockInManage stockInManage = new StockInManage();
		JSONObject jsonObject = JSONObject.fromObject(json);
		StockInBean stockInBean = (StockInBean) JSONObject.toBean(jsonObject,
				StockInBean.class);

		List<StockInCheckMaterielBean> stockInCheckMaterielList = new ArrayList<StockInCheckMaterielBean>();
		for (int i = 0; i < json2.length; i++) {
			stockInCheckMaterielList.add((StockInCheckMaterielBean) JSONObject
					.toBean(JSONObject.fromObject(json2[i]),
							StockInCheckMaterielBean.class));
		}

		if (stockInManage.submit(stockInBean, stockInCheckMaterielList)) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
	public String deleteStockIn() {
		return SUCCESS;
	}

	public String deleteStockInMateriel(String materielCode, String stockInCode)
			throws SQLException {
		StockInManage stockInManage = new StockInManage();
		if (stockInManage.deleteStockInCheckMateriel(materielCode, stockInCode)) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String deleteStockIn(String stockInCode) throws SQLException{
		StockInManage stockInManage = new StockInManage();
		if(stockInManage.deleteStockIn(stockInCode)){
			return SUCCESS;
		}
		return ERROR;
	}

	public String getMaterielCode() {
		return ICTools.randId("M");
	}

	public StockInBean getStock() {
		return stock;
	}

	public void setStock(StockInBean stock) {
		this.stock = stock;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public PageUtil<StockInBean> getStockInList() {
		return stockInList;
	}

	public void setStockInList(PageUtil<StockInBean> stockInList) {
		this.stockInList = stockInList;
	}

	public List<StockInCheckMaterielBean> getStockInCheckMaterielBeanList() {
		return StockInCheckMaterielBeanList;
	}

	public void setStockInCheckMaterielBeanList(
			List<StockInCheckMaterielBean> stockInCheckMaterielBeanList) {
		StockInCheckMaterielBeanList = stockInCheckMaterielBeanList;
	}

	public StockInCheckMaterielBean getStockInCheckMaterielBean() {
		return stockInCheckMaterielBean;
	}

	public void setStockInCheckMaterielBean(
			StockInCheckMaterielBean stockInCheckMaterielBean) {
		this.stockInCheckMaterielBean = stockInCheckMaterielBean;
	}

	public List<MaterielBean> getMaterielList() {
		return materielList;
	}

	public void setMaterielList(List<MaterielBean> materielList) {
		this.materielList = materielList;
	}

	public String getMaterielIds() {
		return materielIds;
	}

	public void setMaterielIds(String materielIds) {
		this.materielIds = materielIds;
	}

	public List<CargoSpaceBean> getCargoSpaceList() {
		return cargoSpaceList;
	}

	public void setCargoSpaceList(List<CargoSpaceBean> cargoSpaceList) {
		this.cargoSpaceList = cargoSpaceList;
	}

	public List<SupplierBean> getSupplierList() {
		return supplierList;
	}

	public void setSupplierList(List<SupplierBean> supplierList) {
		this.supplierList = supplierList;
	}

}
