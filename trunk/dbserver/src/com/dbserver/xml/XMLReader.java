package com.dbserver.xml;

import java.io.File;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.dbserver.conf.Environment;
import com.mydomain.data.Person;

public class XMLReader {
    public static void readXMLBean(XMLBean xmlBean) {
        if (null != xmlBean) {
            String filename = null;
            filename = Environment.getContext() + xmlBean.getPath();
            SAXParserFactory spf = SAXParserFactory.newInstance();
            SAXParser saxParser = null;
            XMLHandler mr = new XMLHandler(xmlBean);
            try {
                saxParser = spf.newSAXParser();
                saxParser.parse(new File(filename), mr);
            } catch (Exception ex) {
                System.err.println(ex);
                System.exit(1);
            }
        }
    }
    
    public static void main(String[] args) {
        XMLBean b = new XMLBean("/ibatisconf/NewFile.xml", "root", Person.class);
        readXMLBean(b);
        System.out.println(b.getItemList());
        b.setPath("/ibatisconf/test.xml");
        XMLWriter.writeXMLBean(b);
    }
}
