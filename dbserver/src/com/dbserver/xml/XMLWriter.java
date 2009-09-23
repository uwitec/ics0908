package com.dbserver.xml;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
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
                sbd.append(" class=\"").append(xmlBean.getBeanClass().getName());
                sbd.append("\" >");
                for (int i = 0; i < size; i++) {
                    Object obj = itemList.get(i);

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
