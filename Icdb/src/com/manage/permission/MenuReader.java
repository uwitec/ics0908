package com.manage.permission;

import java.io.File;
import java.util.Map;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.dbserver.conf.Environment;
import com.mydomain.bean.permission.Menu;

public class MenuReader {

	private static Map<String, Menu> ims = null;

	public static Menu readMenu(String name) {
		if (null != name) {
			if (null == ims) {
				String filename = null;
				filename = Environment.getContext() + "/menu.xml";
				SAXParserFactory spf = SAXParserFactory.newInstance();
				SAXParser saxParser = null;
				MenuHandler mr = new MenuHandler();
				mr.setKeepName(name);
				try {
					saxParser = spf.newSAXParser();
					saxParser.parse(new File(filename), mr);
					ims = mr.getIms();
				} catch (Exception ex) {
					System.err.println(ex);
					System.exit(1);
				}
			}
			return ims.get(name);
		}
		return null;
	}

	public MenuReader() {
	}

	public static void main(String[] args) {
		Menu menu = readMenu("userMenu");
		System.out.println(menu.getItemList().size());
		System.out.println(menu.viewMenu());
	}

}
