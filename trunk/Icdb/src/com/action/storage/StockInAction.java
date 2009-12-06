package com.action.storage;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import net.sf.json.JSONObject;

import com.manage.storage.CargoSpaceManage;
import com.manage.storage.MaterielManage;
import com.manage.storage.StockInManage;
import com.manage.storage.StorehouseManage;
import com.manage.storage.SupplierManange;
import com.mydomain.bean.baseset.CargoSpaceBean;
import com.mydomain.bean.baseset.EmployeeBean;
import com.mydomain.bean.baseset.StorehouseBean;
import com.mydomain.bean.baseset.SupplierBean;
import com.mydomain.bean.storage.MaterielBean;
import com.mydomain.bean.storage.Page;
import com.mydomain.bean.storage.PageUtil;
import com.mydomain.bean.storage.StockInBean;
import com.mydomain.bean.storage.StockInCheckMaterielBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;
import com.tools.StringUtil;

public class StockInAction extends ActionSupport {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private StockInBean stock;

	private Page page;
	private String flag;
	private StockInCheckMaterielBean stockInCheckMaterielBean;

	private List<StockInCheckMaterielBean> StockInCheckMaterielBeanList;

	private PageUtil<StockInBean> stockInList;

	private List<MaterielBean> materielList;

	private List<CargoSpaceBean> cargoSpaceList;

	private List<StorehouseBean> storehouseList;

	private List<SupplierBean> supplierList;

	private String materielIds;

	private String storehouseCode;
	

	/**
	 * 查询入库申请单
	 * @return
	 */
	public String searchStockIn() {

		if (page == null) {
			page = new Page();
		}

		if (stock == null) {
			stock = new StockInBean();
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

	/**
	 * 查询入库检查
	 * @return
	 */
	public String searchCheckStockIn() {

		if (page == null) {
			page = new Page();
		}

		if (stock == null) {
			stock = new StockInBean();
		}
		stock.setStockInStateType(1);
		stock.setStockInCheckState(1);

		StockInManage stockInManage = new StockInManage();

		try {
			stockInList = stockInManage.findStockIn(stock, page);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 查询入库审核
	 * @return
	 */
	public String searchApprovalStockIn() {

		if (page == null) {
			page = new Page();
		}

		if (stock == null) {
			stock = new StockInBean();
		}

		stock.setStockInStateType(1);

		StockInManage stockInManage = new StockInManage();

		try {
			stockInList = stockInManage.findStockIn(stock, page);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 查询入库
	 * @return
	 */
	public String searchStockInOver() {

		if (page == null) {
			page = new Page();
		}

		if (stock == null) {
			stock = new StockInBean();
			stock.setStockInStateType(4);
		}
		stock.setCheckResult(1);

		StockInManage stockInManage = new StockInManage();

		try {
			stockInList = stockInManage.findStockIn(stock, page);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return ERROR;
		}

		return SUCCESS;
	}
	
	/**
	 * 跳转到添加入库单
	 * @return
	 * @throws SQLException
	 */
	public String goAddStockIn() throws SQLException {
		stock = new StockInBean();
		stockInCheckMaterielBean = new StockInCheckMaterielBean();
		stock.setStockInCode(ICTools.randId("SI"));
		CargoSpaceManage cargoSpaceManage = new CargoSpaceManage();
		this.cargoSpaceList = cargoSpaceManage.getCargoSpaceList();
		stock.setEmployeeCode(this.getUserSession().getEmployeeCode()+this.getUserSession().getPersonName());
		SupplierManange supplierManage = new SupplierManange();
		this.supplierList = supplierManage.getSupliers();
		return SUCCESS;
	}

    /**
     * 跳转到修改入库申请单
     * @return
     * @throws SQLException
     */	
	public String goEditStockIn() throws SQLException {

		StockInManage stockInManage = new StockInManage();
		stock = stockInManage.getStockInInfo(stock.getStockInCode());
		this.StockInCheckMaterielBeanList = stockInManage
				.getStockInCheckMateriel(stock.getStockInCode());
		CargoSpaceManage cargoSpaceManage = new CargoSpaceManage();
		this.cargoSpaceList = cargoSpaceManage.getCargoSpaceList();

		SupplierManange supplierManage = new SupplierManange();
		this.supplierList = supplierManage.getSupliers();
		return SUCCESS;

	}

	/**
	 * 跳转到检查入库申请
	 * @return
	 * @throws SQLException
	 */
	public String goCheckStockIn() throws SQLException {
		StockInManage stockInManage = new StockInManage();
		stock = stockInManage.getStockInInfo(stock.getStockInCode());
		this.StockInCheckMaterielBeanList = stockInManage
				.getStockInCheckMateriel(stock.getStockInCode());
		CargoSpaceManage cargoSpaceManage = new CargoSpaceManage();
		this.cargoSpaceList = cargoSpaceManage.getCargoSpaceList();

		SupplierManange supplierManage = new SupplierManange();
		this.supplierList = supplierManage.getSupliers();
		return SUCCESS;
	}

	/**
	 * 跳转至入库审核
	 * @return
	 * @throws SQLException
	 */
	public String goApprovalStockIn() throws SQLException {
		StockInManage stockInManage = new StockInManage();
		stock = stockInManage.getStockInInfo(stock.getStockInCode());
		this.StockInCheckMaterielBeanList = stockInManage
				.getStockInCheckMateriel(stock.getStockInCode());
		CargoSpaceManage cargoSpaceManage = new CargoSpaceManage();
		this.cargoSpaceList = cargoSpaceManage.getCargoSpaceList();

		SupplierManange supplierManage = new SupplierManange();
		this.supplierList = supplierManage.getSupliers();

		return SUCCESS;
	}

	/**
	 * 跳转到入库
	 * @return
	 * @throws SQLException
	 */
	public String goStockInOver() throws SQLException {
		StockInManage stockInManage = new StockInManage();
		stock = stockInManage.getStockInInfo(stock.getStockInCode());
		this.StockInCheckMaterielBeanList = stockInManage
				.getStockInCheckMateriel(stock.getStockInCode());
		CargoSpaceManage cargoSpaceManage = new CargoSpaceManage();
		this.cargoSpaceList = cargoSpaceManage.getCargoSpaceList();

		SupplierManange supplierManage = new SupplierManange();
		this.supplierList = supplierManage.getSupliers();

		return SUCCESS;
	}

	/**
	 * 新增物料
	 * @return
	 * @throws SQLException
	 */
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
			materelBean.setIsEnabled(1);
		}
		this.materielList = materielManage.getAllMateriel(materelBean);
		return SUCCESS;
	}

	/**
	 * 查的货位
	 * @param storehouseCode
	 * @return
	 * @throws SQLException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 */
	@SuppressWarnings("unchecked")
	public List<?> findCargoSpaceList(String storehouseCode)
			throws SQLException, IllegalAccessException,
			InvocationTargetException, NoSuchMethodException {

		StorehouseManage storehouseManage = new StorehouseManage();
		this.storehouseList = storehouseManage.findStorehouse();
		CargoSpaceBean cargoSpaceBean = new CargoSpaceBean();

		if (StringUtil.isNotEmpty(storehouseCode)) {
			cargoSpaceBean.setStorehouseCode(storehouseCode);
		}
		CargoSpaceManage cargoSpaceManage = new CargoSpaceManage();
		cargoSpaceList = cargoSpaceManage
				.getCargoSListByCondition(cargoSpaceBean);

		List list = new ArrayList<String>();
		for (CargoSpaceBean ca : cargoSpaceList) {
			Map<String, String> map = BeanUtils.describe(ca);
			list.add(map);
		}

		return list;
	}

    /**
     * 添加货位
     * @return
     * @throws SQLException
     */
	public String addCargoSpaceList() throws SQLException {

		StorehouseManage storehouseManage = new StorehouseManage();
		this.storehouseList = storehouseManage.findStorehouse();
		CargoSpaceBean cargoSpaceBean = new CargoSpaceBean();

		if (StringUtil.isNotEmpty(storehouseCode)) {
			cargoSpaceBean.setStorehouseCode(storehouseCode);
		}
		CargoSpaceManage cargoSpaceManage = new CargoSpaceManage();
		cargoSpaceList = cargoSpaceManage
				.getCargoSListByCondition(cargoSpaceBean);

		return SUCCESS;
	}

	/**
	 * 保存入库卄1�7
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

	/**
	 * 提交入库单申请
	 * @param json
	 * @param json2
	 * @return
	 * @throws SQLException
	 */
	public String submitStockIn(String json, String[] json2)
			throws SQLException {
		StockInManage stockInManage = new StockInManage();
		JSONObject jsonObject = JSONObject.fromObject(json);
		StockInBean stockInBean = (StockInBean) JSONObject.toBean(jsonObject,
				StockInBean.class);
		stockInBean.setEmployeeCode(this.getUserSession().getEmployeeCode());
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

	/**
	 * 保存入库检查
	 * @param json
	 * @param json2
	 * @return
	 * @throws SQLException
	 */
	public String saveCheckStockIn(String json, String[] json2)
			throws SQLException {
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

		if (stockInManage.checkSave(stockInBean, stockInCheckMaterielList)) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	/**
	 * 提交入库检查
	 * @param json
	 * @param json2
	 * @return
	 * @throws SQLException
	 */
	public String submitCheckStockIn(String json, String[] json2)
			throws SQLException {
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

		if (stockInManage.checkSave(stockInBean, stockInCheckMaterielList)) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	/**
	 * 完成入库
	 * @param json
	 * @param json2
	 * @return
	 * @throws SQLException
	 */
	public String complStockIn(String json, String[] json2) throws SQLException {
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

		if (stockInManage.complStockIn(stockInBean, stockInCheckMaterielList)) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	/**
	 * 审核入库
	 * @param json
	 * @return
	 * @throws SQLException
	 */
	public String approvalStockIn(String json) throws SQLException {
		StockInManage stockInManage = new StockInManage();
		JSONObject jsonObject = JSONObject.fromObject(json);
		StockInBean stockInBean = (StockInBean) JSONObject.toBean(jsonObject,
				StockInBean.class);

		if (stockInManage.approvalSave(stockInBean)) {
			return SUCCESS;
		} else {
			return ERROR;
		}

	}

	/**
	 * 删除物料
	 * @param materielCode
	 * @param stockInCode
	 * @return
	 * @throws SQLException
	 */
	public String deleteStockInMateriel(String materielCode, String stockInCode)
			throws SQLException {
		StockInManage stockInManage = new StockInManage();
		if (stockInManage.deleteStockInCheckMateriel(materielCode, stockInCode)) {
			return SUCCESS;
		}
		return ERROR;
	}

	/**
	 * 删除入库申请
	 * @param stockInCode
	 * @return
	 * @throws SQLException
	 */
	public String deleteStockIn(String stockInCode) throws SQLException {
		StockInManage stockInManage = new StockInManage();
		if (stockInManage.deleteStockIn(stockInCode)) {
			return SUCCESS;
		}
		return ERROR;
	}

	private EmployeeBean getUserSession(){
		return (EmployeeBean) ActionContext.getContext().getSession().get("user");
		
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

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getStorehouseCode() {
		return storehouseCode;
	}

	public void setStorehouseCode(String storehouseCode) {
		this.storehouseCode = storehouseCode;
	}

	public List<StorehouseBean> getStorehouseList() {
		return storehouseList;
	}

	public void setStorehouseList(List<StorehouseBean> storehouseList) {
		this.storehouseList = storehouseList;
	}

}
