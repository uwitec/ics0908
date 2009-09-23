package com.mydomain.bean.permission;

import java.util.List;

public class Item {
	private String viewName;
	private String code;
	private Integer permissionIndex;
	private List<Item> subItemList;
	private Integer level;
	private Integer userPermissionCode;

	private String action;

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

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Integer getUserPermissionCode() {
		return userPermissionCode;
	}

	public void setUserPermissionCode(Integer userPermissionCode) {
		this.userPermissionCode = userPermissionCode;
	}

}
