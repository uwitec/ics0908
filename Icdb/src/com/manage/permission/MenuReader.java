package com.manage.permission;

import java.io.File;
import java.util.Map;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.dbserver.conf.Environment;
import com.mydomain.bean.permission.Menu;

public class MenuReader {

	public static Menu readMenu(String name) {
		if (null != name) {
			String filename = null;
			filename = Environment.getContext() + "/menu.xml";
			SAXParserFactory spf = SAXParserFactory.newInstance();
			SAXParser saxParser = null;
			MenuHandler mr = new MenuHandler();
			mr.setKeepName(name);
			try {
				saxParser = spf.newSAXParser();
				saxParser.parse(new File(filename), mr);
			} catch (Exception ex) {
			    
				ex.printStackTrace();
				System.exit(1);
			}
			return mr.getMenu();
		}
		return null;
	}

	public MenuReader() {
	}

	public static Menu readMenu(String name, String userPremi, String jobPremi) {
		Menu menu = readMenu(name);
		menu.setFilter(jobPremi);
		menu.setItemPermission(userPremi);
		return menu;

	}
}
