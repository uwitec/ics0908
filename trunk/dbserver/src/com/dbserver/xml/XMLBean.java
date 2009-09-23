package com.dbserver.xml;

import java.util.List;

public class XMLBean {
    private final String ROOT_NAME = "root";
    private String path;
    private String rootName;
    private Class<?> beanClass;
    private List<?> itemList;
    private Integer number;

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public XMLBean(String path, String rootName, Class<?> beanClass) {
        this.path = path;
        this.rootName = rootName;
        this.beanClass = beanClass;
        if (null == path) {
            throw new NullPointerException("path is Null.");
        }
        if (null == beanClass) {
            throw new NullPointerException("beanClass is Null.");
        }

        if (null == this.rootName || "".equals(this.rootName)) {
            this.rootName = this.ROOT_NAME;
        }
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Class<?> getBeanClass() {
        return beanClass;
    }

    public void setBeanClass(Class<?> beanClass) {
        this.beanClass = beanClass;
    }

    public List<?> getItemList() {
        return itemList;
    }

    public void setItemList(List<?> itemList) {
        this.itemList = itemList;
    }

    public String getRootName() {
        return rootName;
    }

    public void setRootName(String rootName) {
        this.rootName = rootName;
    }

}
