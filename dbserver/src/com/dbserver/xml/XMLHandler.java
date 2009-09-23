package com.dbserver.xml;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class XMLHandler extends DefaultHandler {

    private XMLBean xmlBean;
    private Field[] fields;
    private String rootName;
    private boolean isAlowRead;
    private String itemName;
    private List<Object> itemList;

    public XMLHandler(XMLBean xmlBean) {
        if (null != xmlBean) {
            this.xmlBean = xmlBean;
        } else {
            throw new NullPointerException("xmlBean is NULL.");
        }
    }

    @Override
    public void startDocument() throws SAXException {
        this.fields = this.xmlBean.getBeanClass().getDeclaredFields();
        this.rootName = this.xmlBean.getRootName();
        this.itemName = this.xmlBean.getBeanClass().getSimpleName();
    }

    @Override
    public void startElement(String uri, String localName, String qName,
            Attributes attributes) throws SAXException {
        if (this.rootName.equals(qName)) {
            isAlowRead = true;
            this.itemList = (new ArrayList<Object>());
        }

        if (isAlowRead && this.itemName.equals(qName)) {
            if (null != attributes) {
                try {
                    Class<?> c = this.xmlBean.getBeanClass();
                    Object obj = c.newInstance();
                    for (int i = 0; i < fields.length; i++) {
                        String value = attributes.getValue(fields[i].getName());
                        if (null != value && !"".equals(value)) {
                            String methodName = getMethodName(fields[i]
                                    .getName());
                            Method m = c.getMethod(methodName, fields[i]
                                    .getType());
                            Object p = null;
                            Class<?> type = fields[i].getType();
                            p = parseValue(value, type);
                            if (null != p)
                                m.invoke(obj, p);
                        }

                    }
                    this.itemList.add(obj);
                } catch (InstantiationException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (SecurityException e) {
                    e.printStackTrace();
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private Object parseValue(String value, Class<?> type) {
        Object p = null;
        try {
            if (type.equals(String.class)) {
                p = value;
            } else if (type.equals(Integer.class)
                    || "int".equals(type.getSimpleName())) {
                p = Integer.parseInt(value);
            } else if (type.equals(Double.class)
                    || "double".equals(type.getSimpleName())) {
                p = Double.parseDouble(value);
            } else if (type.equals(Long.class)
                    || "long".equals(type.getSimpleName())) {
                p = Long.parseLong(value);
            } else if (type.equals(Boolean.class)
                    || "boolean".equals(type.getSimpleName())) {
                p = Boolean.parseBoolean(value);
            } else if (type.equals(Date.class)) {
                p = DateFormat.getDateInstance().parse(value);
            } else if (type.equals(Character.class)
                    || "char".equals(type.getSimpleName())) {
                p = value.charAt(0);
            } else if (type.equals(Byte.class)
                    || "byte".equals(type.getSimpleName())) {
                p = Byte.parseByte(value);
            }
        } catch (ParseException e) {
            p = new Date();
        } catch (NumberFormatException e) {
            p = 0;
        }
        return p;
    }

    private String getMethodName(String fieldName) {
        String methodName = fieldName;
        methodName = "set".concat(methodName.substring(0, 1).toUpperCase())
                .concat(methodName.substring(1));
        return methodName;
    }

    @Override
    public void endElement(String uri, String localName, String qName)
            throws SAXException {
    }

    @Override
    public void endDocument() throws SAXException {
        this.xmlBean.setItemList(this.itemList);
    }

    public static void main(String[] args) {
        try {
            System.out.println(DateFormat.getDateInstance().parse("12-9-2009"));
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
