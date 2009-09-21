package com.mydomain.bean.permission;

import java.util.List;

public class Item {
	private String viewName;
	private String code;
	private Integer permissionIndex;
	private List<Item> subItemList;
	private Integer level;

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public List<Item> getSubItemList() {
		return subItemList;
	}

	public void setSubItemList(List<Item> subItemList) {
		this.subItemList = subItemList;
	}

	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getPermissionIndex() {
		return permissionIndex;
	}

	public void setPermissionIndex(Integer permissionIndex) {
		this.permissionIndex = permissionIndex;
	}

}
