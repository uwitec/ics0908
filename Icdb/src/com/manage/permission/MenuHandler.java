package com.manage.permission;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.mydomain.bean.permission.Item;
import com.mydomain.bean.permission.Menu;

public class MenuHandler extends DefaultHandler {
	private Map<String, Menu> ims = null;
	private boolean isFilter = false;
	private Menu menu = null;

	private Item item = null;

	private String keepName = null;

	public void setKeepName(String keepName) {
		this.keepName = keepName;
	}

	public Map<String, Menu> getIms() {
		return ims;
	}

	@Override
	public void startDocument() throws SAXException {
		if (null == this.ims) {
			ims = new HashMap<String, Menu>();
		}
	}

	@Override
	public void startElement(String uri, String localName, String qName,
			Attributes attributes) throws SAXException {
		if ("menu".equalsIgnoreCase(qName)) {
			if (null != attributes) {
				String name = attributes.getValue("name");
				if (null != keepName && keepName.equalsIgnoreCase(name)) {
					this.menu = new Menu();
					this.menu.setName(name);
					this.menu.setCode(attributes.getValue("code"));
					this.menu.setItemList(new ArrayList<Item>());
					ims.put(this.menu.getName(), this.menu);
				} else {
					isFilter = true;
				}
			}
		}
		if ("item".equalsIgnoreCase(qName)) {
			if (!isFilter) {
				if (null != attributes) {
					Item aItem = new Item();
					aItem.setCode(attributes.getValue("code"));
					String pIndex = attributes.getValue("permissionIndex");
					String level = attributes.getValue("level");
					Integer i = 0;
					Integer lev = 0;
					try {
						i = Integer.parseInt(pIndex);
						lev = Integer.parseInt(level);
					} catch (NumberFormatException e) {
						i = -1;
						lev = -1;
					}
					aItem.setPermissionIndex(i);
					aItem.setLevel(lev);
					aItem.setViewName(attributes.getValue("viewName"));
					aItem.setAction(attributes.getValue("action"));
					aItem.setSubItemList(new ArrayList<Item>());

					if (null != this.item
							&& this.item.getLevel() < aItem.getLevel()) {
						this.item.getSubItemList().add(aItem);
					} else if (null != this.menu) {
						this.menu.getItemList().add(aItem);
					}

					if (null == this.item
							|| this.item.getLevel() >= aItem.getLevel()) {
						this.item = aItem;
					}
				}
			}
		}
	}

	@Override
	public void endElement(String uri, String localName, String qName)
			throws SAXException {
		if ("menu".equalsIgnoreCase(qName)) {
			isFilter = false;
		}
	}
}
