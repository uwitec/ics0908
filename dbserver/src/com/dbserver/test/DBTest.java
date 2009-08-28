package com.dbserver.test;

public class DBTest {
	String[] tgarr = { "¼×", "ÒÒ", "±û", "¶¡", "Îì", "¼º", "¸ý", "ÐÁ", "ÈÉ", "¹ï" };
	String[] dzarr = { "×Ó", "³ó", "Òú", "Ã®", "³½", "ËÈ", "Îç", "Î´", "Éê", "ÓÏ", "Ðç",
			"º¥" };
	String[] tgparr = { "ji¨£", "y¨«", "b¨«ng", "d¨©ng", "w¨´", "j¨«", "g¨¥ng", "x¨©n",
			"r¨¦n", "gu¨«" };
	String[] dzparr = { "z¨«", "ch¨¯u", "y¨ªn", "m¨£o", "ch¨¦n", "s¨¬", "w¨³", "w¨¨i",
			"sh¨¥n", "y¨¯u", "x¨±", "h¨¤i" };

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
		System.out.println(year % (10));
		System.out.println(Integer.toBinaryString(year));
		System.out.println(Integer.toBinaryString(0x000f));
		System.out.println(Integer.toBinaryString(year & 0x000f));
		return dzarr[afterZero[(a + b) % 6] * 2 - 1];

	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// new DBTest().test();
		System.out.println(new DBTest().getHYear(2009, false));

		System.out.println("end!");
	}
}
