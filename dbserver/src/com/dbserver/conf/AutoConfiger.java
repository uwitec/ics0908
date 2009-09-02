/**
 * 
 */
package com.dbserver.conf;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author Zhong Lizhi
 */
public class AutoConfiger {
    
    private static final long MIN_RELOAD_TIME = 180000L;
    
    private String path = "regexp.properties";
    private Properties prop = new Properties();
    
    private long lastModifyTime = 0L;
    private long oldCheckTime = System.currentTimeMillis();
    
    private ReentrantLock lock = new ReentrantLock();
    
    private boolean isReloadComplete = false;
    
    public AutoConfiger(String path) throws FileNotFoundException, IOException {
        this.path = Environment.getContext() + path;
        this.loadFile(this.path);
    }
    
    private void loadFile(String path) throws FileNotFoundException,
            IOException {
        
        try {
            lock.lock();
            
            if (isReloadComplete)
                return;
            
            // Properties p = new
            // Properties();
            File file = new File(path);
            if (file.exists()) {
                lastModifyTime = file.lastModified();
                InputStream inStream = null;
                try {
                    inStream = new FileInputStream(file);
                    prop.clear();
                    prop.load(inStream);
                    isReloadComplete = true;
                } finally {
                    if (null != inStream) {
                        inStream.close();
                        inStream = null;
                    }
                }
                
            } else {
                throw new FileNotFoundException("文件没找到: "
                        + file.getAbsolutePath());
            }
        } finally {
            lock.unlock();
        }
        // return p;
    }
    
    private Properties getProperties() {
        long currentTime = System.currentTimeMillis();
        if (MIN_RELOAD_TIME <= currentTime - oldCheckTime) {
            oldCheckTime = currentTime;
            File file = new File(path);
            if (file.exists()) {
                long fileModifyTime = file.lastModified();
                if (fileModifyTime != lastModifyTime) {
                    lastModifyTime = fileModifyTime;
                    isReloadComplete = false;
                    try {
                        loadFile(path);
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return prop;
    }
    
    public void setPath(String path) {
        if (null == this.path)
            this.path = path;
    }
    
    public String getPath() {
        return this.path;
    }
    
    public String getValue(String key) {
        String tempString = getProperties().getProperty(key);
        if (null != tempString) {
            try {
                byte[] isoBs = tempString.getBytes("ISO-8859-1");
                String gbkString = new String(isoBs, "GBK");
                return gbkString.trim();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        } else {
            Exception e = new NullPointerException("属性文件中没有关键字: " + key);
            e.printStackTrace();
        }
        return null;
    }
    
}
