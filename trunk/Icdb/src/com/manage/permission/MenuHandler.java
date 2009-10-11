package com.manage.permission;

import java.util.ArrayList;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.mydomain.bean.permission.Item;
import com.mydomain.bean.permission.Menu;

public class MenuHandler extends DefaultHandler {
    // private Map<String, Menu> ims = null;
    private boolean isFilter = false;
    private Menu menu = null;

    private Item parentItem = null;
    private Item oldItem = null;

    private String keepName = null;

    public void setKeepName(String keepName) {
        this.keepName = keepName;
    }

    public Menu getMenu() {
        return this.menu;
    }

    // public Map<String, Menu> getIms() {
    // return ims;
    // }

    @Override
    public void startDocument() throws SAXException {
        // if (null == this.ims) {
        // ims = new HashMap<String, Menu>();
        // }
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
                    // ims.put(this.menu.getName(), this.menu);
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

                    if (1 == lev && null != this.menu) {
                        this.menu.getItemList().add(aItem);
                        this.parentItem = aItem;
                    } else {

                        if (lev - oldItem.getLevel() ==1) {
                            this.parentItem = oldItem;
                        }
                        
                        if (lev - parentItem.getLevel() == 1) {
                            aItem.setParent(this.parentItem);
                            this.parentItem.getSubItemList().add(aItem);
                        }
                        
                        if (lev == parentItem.getLevel()) {
                            this.parentItem = parentItem.getParent();
                            aItem.setParent(this.parentItem);
                            this.parentItem.getSubItemList().add(aItem);
                        }
                        
                        if (lev < parentItem.getLevel()) {
                            int step = Math.abs(aItem.getLevel() - this.parentItem
                                    .getLevel());
                            for (int j = 0; j < step - 1; j++) {
                                this.parentItem = this.parentItem.getParent();
                            }
                            aItem.setParent(this.parentItem);
                            this.parentItem.getSubItemList().add(aItem);
                        }
                        
                        
                  
                    }

                    oldItem = aItem;
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
