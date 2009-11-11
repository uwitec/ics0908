package com.action.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import com.manage.storage.MaterielManage;
import com.manage.storage.StockOutManage;
import com.mydomain.bean.storage.MaterielBean;
import com.mydomain.bean.storage.MaterielBeanExt;
import com.mydomain.bean.storage.Page;
import com.mydomain.bean.storage.PageUtil;
import com.mydomain.bean.storage.StockOutBean;
import com.mydomain.bean.storage.StockOutHasMaterielBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class StockOutAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private StockOutBean stock;

	private Page page;

	private PageUtil<StockOutBean> stockOutList;
	private List<MaterielBeanExt> materielList;
	private List<StockOutHasMaterielBean> stockOutHasMaterielList;
	private StockOutHasMaterielBean stockOutHasMaterielBean;

	private String materielIds;

	/**
	 * 查询出库申请
	 * @return
	 */
	public String searchStockOut() {

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

	/**
	 * 查询出库审核 
	 * @return
	 */
	public String searchApprovalStockOut() {

		if (page == null) {
			page = new Page();
		}

		if (stock == null) {
			stock = new StockOutBean();
		}
		stock.setStockOutStateType(1);
		StockOutManage stockOutManage = new StockOutManage();
		try {
			stockOutList = stockOutManage.findStockOut(stock, page);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 查询出库检查
	 * @return
	 */
	public String searchCheckStockOut() {

		if (page == null) {
			page = new Page();
		}

		if (stock == null) {
			stock = new StockOutBean();
		}
		stock.setStockOutCheckState(1);
		stock.setStockOutStateType(1);

		StockOutManage stockOutManage = new StockOutManage();
		try {
			stockOutList = stockOutManage.findStockOut(stock, page);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 查询出库
	 * @return
	 */
	public String searchStockOutOver() {

		if (page == null) {
			page = new Page();
		}

		if (stock == null) {
			stock = new StockOutBean();
		}
		stock.setStockOutDealState(1);
		stock.setStockOutStateType(1);
		stock.setStockOutCheckState(1);

		StockOutManage stockOutManage = new StockOutManage();
		try {
			stockOutList = stockOutManage.findStockOut(stock, page);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 跳转新增出库单
	 * @return
	 * @throws SQLException
	 */
	public String goAddStockOut() throws SQLException {
		stock = new StockOutBean();
		stockOutHasMaterielBean = new StockOutHasMaterielBean();
		stock.setStockOutOrderCode(ICTools.randId("SO"));
		return SUCCESS;
	}

	/**
	 * 获得物料列表
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
		}
		this.materielList = materielManage
				.getAllMaterielAndCargoSpace(materelBean);
		return SUCCESS;
	}

	/**
	 * 保存出库申请
	 * @param json
	 * @param json2
	 * @return
	 * @throws SQLException
	 */
	public String saveStockOut(String json, String[] json2) throws SQLException {
		StockOutManage stockOutManage = new StockOutManage();
		JSONObject jsonObject = JSONObject.fromObject(json);
		StockOutBean stockOutBean = (StockOutBean) JSONObject.toBean(
				jsonObject, StockOutBean.class);

		List<StockOutHasMaterielBean> stockOutHasMaterielList = new ArrayList<StockOutHasMaterielBean>();
		for (int i = 0; i < json2.length; i++) {
			stockOutHasMaterielList.add((StockOutHasMaterielBean) JSONObject
					.toBean(JSONObject.fromObject(json2[i]),
							StockOutHasMaterielBean.class));
		}

		if (stockOutManage.save(stockOutBean, stockOutHasMaterielList)) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	/**
	 * 提交出库申请
	 * @param json
	 * @param json2
	 * @return
	 * @throws SQLException
	 */
	public String submitStockOut(String json, String[] json2)
			throws SQLException {
		StockOutManage stockOutManage = new StockOutManage();
		JSONObject jsonObject = JSONObject.fromObject(json);
		StockOutBean stockOutBean = (StockOutBean) JSONObject.toBean(
				jsonObject, StockOutBean.class);

		List<StockOutHasMaterielBean> stockOutHasMaterielList = new ArrayList<StockOutHasMaterielBean>();
		for (int i = 0; i < json2.length; i++) {
			stockOutHasMaterielList.add((StockOutHasMaterielBean) JSONObject
					.toBean(JSONObject.fromObject(json2[i]),
							StockOutHasMaterielBean.class));
		}

		if (stockOutManage.submit(stockOutBean, stockOutHasMaterielList)) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	/**
	 * 跳转编辑出库单
	 * @return
	 * @throws SQLException
	 */
	public String goEditStockOut() throws SQLException {

		StockOutManage stockOutManage = new StockOutManage();
		stock = stockOutManage.getStockOutInfo(stock.getStockOutOrderCode());
		this.stockOutHasMaterielList = stockOutManage
				.getStockOutHaskMaterielAndStock(stock.getStockOutOrderCode());
		return SUCCESS;

	}

	/**
	 * 跳转审核出库
	 * @return
	 * @throws SQLException
	 */
	public String goApprovalStockOut()throws SQLException{
		StockOutManage stockOutManage = new StockOutManage();
		stock = stockOutManage.getStockOutInfo(stock.getStockOutOrderCode());
		this.stockOutHasMaterielList = stockOutManage.getStockOutHaskMaterielAndStock(stock.getStockOutOrderCode());
		return SUCCESS;
	}

	/**
	 * 跳转检查出库
	 * @return
	 * @throws SQLException
	 */
	public String goCheckStockOut() throws SQLException {
		StockOutManage stockOutManage = new StockOutManage();
		stock = stockOutManage.getStockOutInfo(stock.getStockOutOrderCode());
		this.stockOutHasMaterielList = stockOutManage
				.getStockOutHaskMaterielAndStock(stock.getStockOutOrderCode());
		return SUCCESS;
	}

	/**
	 * 跳转出库
	 * @return
	 * @throws SQLException
	 */
	public String goStockOutOver() throws SQLException {
		StockOutManage stockOutManage = new StockOutManage();
		stock = stockOutManage.getStockOutInfo(stock.getStockOutOrderCode());
		this.stockOutHasMaterielList = stockOutManage
				.getStockOutHaskMaterielAndStock(stock.getStockOutOrderCode());
		return SUCCESS;
	}


    /**
     * 删除物料
     * @param materielCode
     * @param stockOutCode
     * @return
     * @throws SQLException
     */
	public String deleteStockOutMateriel(String materielCode,
			String stockOutCode) throws SQLException {
		StockOutManage stockOutManage = new StockOutManage();
		if (stockOutManage.deleteStockOutMateriel(materielCode,
				stockOutCode)) {
			return SUCCESS;
		}
		return ERROR;
	}

	
	/**
	 *删除出库单
	 * @param stockOutOrderCode
	 * @return
	 * @throws SQLException
	 */
	public String deleteStockOut(String stockOutOrderCode) throws SQLException{
		StockOutManage stockOutManage = new StockOutManage();
		if(stockOutManage.deleteStockOut(stockOutOrderCode)){
			return SUCCESS;
		}
		return ERROR;
	}

	/**
	 * 审核
	 * @param json
	 * @return
	 * @throws SQLException
	 */
	public String approvalStockOut(String json) throws SQLException{
		StockOutManage stockOutManage = new StockOutManage();
		JSONObject jsonObject = JSONObject.fromObject(json);
		StockOutBean stockOutBean = (StockOutBean) JSONObject.toBean(jsonObject,
				StockOutBean.class);

		if(stockOutManage.approvalSave(stockOutBean)){
			return SUCCESS;
		}else{
			return ERROR;
		}

	}

	/**
	 * 保存检查
	 * @param json
	 * @param json2
	 * @return
	 * @throws SQLException
	 */
	public String saveCheckStockOut(String json, String[] json2) throws SQLException{
		StockOutManage stockOutManage = new StockOutManage();
		JSONObject jsonObject = JSONObject.fromObject(json);
		StockOutBean stockOutBean = (StockOutBean) JSONObject.toBean(jsonObject,
				StockOutBean.class);

		List<StockOutHasMaterielBean> stockOutHasMaterielList = new ArrayList<StockOutHasMaterielBean>();
		for (int i = 0; i < json2.length; i++) {
			stockOutHasMaterielList.add((StockOutHasMaterielBean) JSONObject
					.toBean(JSONObject.fromObject(json2[i]),
							StockOutHasMaterielBean.class));
		}

		if (stockOutManage.checkSave(stockOutBean, stockOutHasMaterielList)) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	/**
	 * 提交检查
	 * @param json
	 * @param json2
	 * @return
	 * @throws SQLException
	 */
	public String submitCheckStockOut(String json, String[] json2) throws SQLException{
		StockOutManage stockOutManage = new StockOutManage();
		JSONObject jsonObject = JSONObject.fromObject(json);
		StockOutBean stockOutBean = (StockOutBean) JSONObject.toBean(jsonObject,
				StockOutBean.class);

		List<StockOutHasMaterielBean> stockOutHasMaterielList = new ArrayList<StockOutHasMaterielBean>();
		for (int i = 0; i < json2.length; i++) {
			stockOutHasMaterielList.add((StockOutHasMaterielBean) JSONObject
					.toBean(JSONObject.fromObject(json2[i]),
							StockOutHasMaterielBean.class));
		}

		if (stockOutManage.checkSubmit(stockOutBean, stockOutHasMaterielList)) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	/**
	 * 完成出库
	 * @param json
	 * @param json2
	 * @return
	 * @throws SQLException
	 */
	public String comStockOut(String json,String[] json2) throws SQLException{
		StockOutManage stockOutManage = new StockOutManage();
		JSONObject jsonObject = JSONObject.fromObject(json);
		StockOutBean stockOutBean = (StockOutBean) JSONObject.toBean(jsonObject,
				StockOutBean.class);

		List<StockOutHasMaterielBean> stockOutHasMaterielList = new ArrayList<StockOutHasMaterielBean>();
		for (int i = 0; i < json2.length; i++) {
			stockOutHasMaterielList.add((StockOutHasMaterielBean) JSONObject
					.toBean(JSONObject.fromObject(json2[i]),
							StockOutHasMaterielBean.class));
		}

		if (stockOutManage.complStockOut(stockOutBean,stockOutHasMaterielList)) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
	// get set
	public StockOutBean getStock() {
		return stock;
	}

	public void setStock(StockOutBean stock) {
		this.stock = stock;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public PageUtil<StockOutBean> getStockOutList() {
		return stockOutList;
	}

	public void setStockOutList(PageUtil<StockOutBean> stockOutList) {
		this.stockOutList = stockOutList;
	}

	public StockOutHasMaterielBean getStockOutHasMaterielBean() {
		return stockOutHasMaterielBean;
	}

	public void setStockOutHasMaterielBean(
			StockOutHasMaterielBean stockOutHasMaterielBean) {
		this.stockOutHasMaterielBean = stockOutHasMaterielBean;
	}

	public String getMaterielIds() {
		return materielIds;
	}

	public void setMaterielIds(String materielIds) {
		this.materielIds = materielIds;
	}

	public List<MaterielBeanExt> getMaterielList() {
		return materielList;
	}

	public void setMaterielList(List<MaterielBeanExt> materielList) {
		this.materielList = materielList;
	}

	public List<StockOutHasMaterielBean> getStockOutHasMaterielList() {
		return stockOutHasMaterielList;
	}

	public void setStockOutHasMaterielList(
			List<StockOutHasMaterielBean> stockOutHasMaterielList) {
		this.stockOutHasMaterielList = stockOutHasMaterielList;
	}

}
