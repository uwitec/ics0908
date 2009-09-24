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
			throws FileNotFoundException, IOException {
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
		AutoConfiger autoConfiger = null;
			try {
				autoConfiger = ALCFFactory
						.createAutoConfiger("path/filename");
			} catch (FileNotFoundException e2) {
				//没找到文件
				e2.printStackTrace();
				System.exit(1);
			} catch (IOException e2) {
				// 流异常
				System.exit(2);
				e2.printStackTrace();
			}
			autoConfiger.getValue("key");

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
							// Out.print(
							// e);
						}
					}
				}
			}.start();
		}
	}

}
