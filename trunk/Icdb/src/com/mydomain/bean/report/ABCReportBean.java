package com.mydomain.bean.report;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class ABCReportBean {

	private String beginDate; // 开始时间
	private String endDate; // 结束时间
	private String searchType; // 查询类型
	private String csCode; // 盘点编码
	private String oldCsCode; // 上次盘点单编码

	private String name; // 物品名
	private String materielType; // 物品类型
	private String specification; // 规格
	private String unit; // 单位

	private Integer lastAmount; // 上次盘点数量
	private Double lastPrice; // 上次盘点单价
	private Double lastTotalPrice; // 上次总金额

	private Integer amount; // 本次盘点数量
	private Double price; // 本次单价
	private Double totalPrice; // 本次总金额

	private Integer inAmount; // 入库数量
	private Double inPrice; // 入库单价
	private Double inTotalPrice; // 入库金额

	private Integer outAmount; // 出库数量
	private Double outPrice; // 出库单价
	private Double outTotalPrice; // 出库金额

	private Integer maxStore; // 最大库存
	private Integer minStore; // 最小库存

	private Integer storeState; // 实际状态
	private Double storePercent; // 实际状态百分比,超存百分比或短缺百分比

	private Double turnoverRate; // 周转率

	private String remark; // 备注

	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		beginDate = convertDate(beginDate);
		System.out.println("beginDate: " + beginDate);
		this.beginDate = beginDate;
	}

	private String convertDate(String dateString) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(
					"EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);
			Date date = sdf.parse(dateString);
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			dateString = sdf.format(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dateString;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = convertDate(endDate);
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getCsCode() {
		return csCode;
	}

	public void setCsCode(String csCode) {
		this.csCode = csCode;
	}

	public String getOldCsCode() {
		return oldCsCode;
	}

	public void setOldCsCode(String oldCsCode) {
		this.oldCsCode = oldCsCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMaterielType() {
		return materielType;
	}

	public void setMaterielType(String materielType) {
		this.materielType = materielType;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Integer getLastAmount() {
		return lastAmount;
	}

	public void setLastAmount(Integer lastAmount) {
		if (null == lastAmount) {
			lastAmount = 0;
		}
		this.lastAmount = lastAmount;
	}

	public Double getLastPrice() {
		return lastPrice;
	}

	public void setLastPrice(Double lastPrice) {
		if (null == lastPrice) {
			lastPrice = 0.0;
		}
		this.lastPrice = lastPrice;
	}

	public Double getLastTotalPrice() {
		setLastTotalPrice(0d);
		return lastTotalPrice;
	}

	public void setLastTotalPrice(Double lastTotalPrice) {
		this.lastTotalPrice = getLastPrice() * getLastAmount();
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		if (null == amount) {
			amount = 0;
		}
		this.amount = amount;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		if (null == price) {
			price = 0.0;
		}
		this.price = price;
	}

	public Double getTotalPrice() {
		setTotalPrice(0d);
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = getPrice() * getAmount();
	}

	public Integer getInAmount() {
		return inAmount;
	}

	public void setInAmount(Integer inAmount) {
		if (null == inAmount) {
			inAmount = 0;
		}
		this.inAmount = inAmount;
	}

	public Double getInPrice() {
		return inPrice;
	}

	public void setInPrice(Double inPrice) {
		if (null == inPrice) {
			inPrice = 0.0;
		}
		this.inPrice = inPrice;
	}

	public Double getInTotalPrice() {
		setInTotalPrice(0d);
		return inTotalPrice;
	}

	public void setInTotalPrice(Double inTotalPrice) {
		this.inTotalPrice = getInPrice() * getInAmount();
	}

	public Integer getOutAmount() {
		return outAmount;
	}

	public void setOutAmount(Integer outAmount) {
		if (null == outAmount) {
			outAmount = 0;
		}
		this.outAmount = outAmount;
	}

	public Double getOutPrice() {
		return outPrice;
	}

	public void setOutPrice(Double outPrice) {
		if (null == outPrice) {
			outPrice = 0.0;
		}
		this.outPrice = outPrice;
	}

	public Double getOutTotalPrice() {
		setOutTotalPrice(0d);
		return outTotalPrice;
	}

	public void setOutTotalPrice(Double outTotalPrice) {
		this.outTotalPrice = getOutPrice() * getOutAmount();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getMinStore() {
		return minStore;
	}

	public void setMinStore(Integer minStore) {
		this.minStore = minStore;
	}

	public Integer getMaxStore() {
		return maxStore;
	}

	public void setMaxStore(Integer maxStore) {
		this.maxStore = maxStore;
	}

	public Integer getStoreState() {
		Integer amt = getAmount();
		if (amt < this.minStore) {
			storeState = -1;
			storePercent = divide(minStore - amt, minStore);
		} else if (amt > this.maxStore) {
			storeState = 1;
			storePercent = divide(amt - maxStore, maxStore);
		} else {
			storeState = 0;
			storePercent = 0d;
		}
		return storeState;
	}

	private double divide(Integer na, Integer nb) {
		BigDecimal a = new BigDecimal(na.toString());
		BigDecimal b = new BigDecimal(nb.toString());
		return b.divide(a, 2, RoundingMode.HALF_UP).doubleValue();
	}

	public void setStoreState(Integer storeState) {
		this.storeState = storeState;
	}

	public Double getStorePercent() {
		getStoreState();
		return storePercent;
	}

	public void setStorePercent(Double storePercent) {
		this.storePercent = storePercent;
	}

	public Double getTurnoverRate() {
		Integer amt = getAmount();
		if (0 == amt) {
			return 0d;
		}
		BigDecimal a = new BigDecimal(amt.toString());
		BigDecimal b = new BigDecimal(getOutAmount().toString());
		this.turnoverRate = b.divide(a, 2, RoundingMode.HALF_UP).doubleValue();
		return this.turnoverRate;
	}

	public void setTurnoverRate(Double turnoverRate) {
		this.turnoverRate = turnoverRate;
	}

}
