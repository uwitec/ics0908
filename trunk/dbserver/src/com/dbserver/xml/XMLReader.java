package com.dbserver.xml;

import java.io.File;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.dbserver.conf.Environment;

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
			} catch (Exception e) {
				e.printStackTrace();
				System.exit(1);
			}
		}
	}

}
