package com.mydomain.bean.permission;

import java.util.List;

public class Menu {
	private String code;
	private String name;
	private List<Item> itemList;
	final private int MAX_LOOP = 2000;
	private int maxLoop = MAX_LOOP;

	public String viewMenu() {
		StringBuilder sbd = new StringBuilder();

		sbd.append("<name>" + name).append("\r\n");
		if (null != itemList) {
			for (int i = 0; i < itemList.size(); i++) {
				addMenuString(itemList.get(i), sbd);
			}
		}
		maxLoop = MAX_LOOP;
		return sbd.toString();
	}

	public void addMenuString(Item item, StringBuilder sbd) {
		if (--maxLoop <= 0) {
			return;
		}
		if (null != item) {
			sbd.append("<viewName>").append(item.getViewName()).append("\r\n");
			List<Item> list = item.getSubItemList();
			if (null != list)
				for (int i = 0; i < list.size(); i++) {
					addMenuString(list.get(i), sbd);
				}
		}
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Item> getItemList() {
		return itemList;
	}

	public void setItemList(List<Item> itemList) {
		this.itemList = itemList;
	}

}
