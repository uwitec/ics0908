package com.dbserver.test;

import org.junit.Test;

import com.dbserver.xml.XMLBean;
import com.dbserver.xml.XMLReader;
import com.dbserver.xml.XMLWriter;
import com.mydomain.data.Person;

public class DBTest {
	String[] tgarr = { "��", "��", "��", "��", "��", "��", "��", "��", "��", "��" };
	String[] dzarr = { "��", "��", "��", "î", "��", "��", "��", "δ", "��", "��", "��",
			"��" };
	String[] tgparr = { "ji��", "y��", "b��ng", "d��ng", "w��", "j��", "g��ng", "x��n",
			"r��n", "gu��" };
	String[] dzparr = { "z��", "ch��u", "y��n", "m��o", "ch��n", "s��", "w��", "w��i",
			"sh��n", "y��u", "x��", "h��i" };

	int[] beforeZero = { 5, 6, 1, 2, 3, 4 };
	int[] afterZero = { 5, 4, 3, 2, 1, 6 };

	public void test() {
		int a = 0;
		int b = 0;
		int maxLoop = 1000;
		do {
			System.out.println((1000 - maxLoop + 1) + " " + tgarr[a++]
					+ dzarr[b++]);
			if (a == tgarr.length) {
				a = 0;
			}
			if (b == dzarr.length) {
				b = 0;
			}
		} while (--maxLoop == 0 || a != 0 || b != 0);
	}

	public String getHYear(int year, boolean isBeforeZero) {
		int a = 6 - (year % 10) / 2;
		int b = (year - a) / 10 % 6;

		return tgarr[(year % 10 - 5) % 10]
				+ dzarr[afterZero[(a + b) % 6] * 2 - 1];

	}

	@Test
	public void testXML() {

		XMLBean b = new XMLBean("/ibatisconf/NewFile.xml");
		XMLReader.readXMLBean(b);
		System.out.println(b.getItemList());
		b.setPath("/ibatisconf/test.xml");
		XMLWriter.writeXMLBean(b);

	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// new DBTest().test();
		new DBTest().testXML();
//		System.out.println(new DBTest().getHYear(2009, false));
//
//		System.out.println("end!");
		// com.dbserver.DBServer.logger.exception(e);
	}
}
