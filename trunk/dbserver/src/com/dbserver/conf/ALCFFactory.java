/**
 * 
 */
package com.dbserver.conf;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;


/**
 * @author Zhong Lizhi
 */
public class ALCFFactory {
    
    private static HashMap<String, AutoConfiger> producesMap = new HashMap<String, AutoConfiger>();
    
    public static AutoConfiger createAutoConfiger(String filePath)
            throws IOException {
        AutoConfiger autoConfiger = producesMap.get(filePath);
        if (null == autoConfiger) {
            autoConfiger = new AutoConfiger(filePath);
            producesMap.put(filePath, autoConfiger);
        }
        return autoConfiger;
    }
    
    public static void deleteAutoConfiger(String filePath) {
        producesMap.remove(filePath);
    }
    
    public static void deleteAutoConfiger(AutoConfiger autoConfiger) {
        deleteAutoConfiger(autoConfiger.getPath());
    }
    
    public static void main(String[] args) {
        // AutoConfiger autoConfiger =
        //ALCFFactory.createAutoConfiger
        // ("regex.properties");
        
        for (int i = 0; i < 10; i++) {
            new Thread() {
                public void run() {
                    while (true) {
                        try {
                            System.out.println(Thread.currentThread().getName()
                                    + " "
                                    + ALCFFactory.createAutoConfiger(
                                            "regexp.properties").getValue(
                                            "huxiTitle"));
                        } catch (FileNotFoundException e1) {
                            e1.printStackTrace();
                        } catch (IOException e1) {
                            e1.printStackTrace();
                        }
                        try {
                            Thread.sleep(300);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                            //Out.print(
                            // e);
                        }
                    }
                }
            }.start();
        }
    }
    
}
