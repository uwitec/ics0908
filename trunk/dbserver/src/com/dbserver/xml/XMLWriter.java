package com.dbserver.xml;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.dbserver.conf.Environment;

public class XMLWriter {

	public static void writeXMLBean(XMLBean xmlBean) {
		if (null != xmlBean) {
			File file = new File(Environment.getContext() + xmlBean.getPath());
			if (!file.exists()) {
				try {
					file.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (file.canWrite()) {
				List<?> itemList = xmlBean.getItemList();
				int size = itemList.size();
				StringBuilder sbd = new StringBuilder();
				final String END_LINE = "\r\n";
				sbd.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")
						.append(END_LINE);
				sbd.append("<");
				sbd.append(xmlBean.getRootName());
				sbd.append(" class=\"")
						.append(xmlBean.getBeanClass().getName());
				sbd.append("\" >").append(END_LINE);
				for (int i = 0; i < size; i++) {
					Object obj = itemList.get(i);
					sbd.append("<").append(obj.getClass().getSimpleName());
					Method[] ms = obj.getClass().getDeclaredMethods();
					for (int msIndex = 0; msIndex < ms.length; msIndex++) {
						String name = ms[msIndex].getName();
						if (0 == name.indexOf("get")) {
							String value = "";
							try {
								Object valueObj = ms[msIndex].invoke(obj,
										new Object[] {});
								if (!(valueObj instanceof Date)) {
									value = valueObj.toString();
								} else {
									SimpleDateFormat sdf = new SimpleDateFormat(
											"yyyy-MM-dd HH-mm-ss");
									value = sdf.format((Date) valueObj);
								}
							} catch (Exception e) {
								e.printStackTrace();
								value = "";
							}
							sbd.append(" ").append(name.substring(3));
							sbd.append("=\"").append(value).append("\"");
						}
					}
					sbd.append(" />").append(END_LINE);
				}
				sbd.append("</").append(xmlBean.getRootName()).append(">");
				FileWriter fw = null;
				try {
					fw = new FileWriter(file);
					fw.append(sbd.toString());
					fw.flush();

					System.out.println("write over.\r\n" + sbd.toString());
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					if (null != fw)
						try {
							fw.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
				}
			}
		}
	}
}
