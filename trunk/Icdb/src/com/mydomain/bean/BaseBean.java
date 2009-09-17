package com.mydomain.bean;

import propeties.IcdbOption;

public class BaseBean extends ReSourceBean{

	private int countValue;
	private int countSize;
	private int startSize;
	private int startValue;
	private int endValue;
	public  int countNumber=Integer.valueOf(IcdbOption.getValue("pageCount"));
	
	public BaseBean(){
		this.countValue=0;
		this.startSize=1;
		this.startValue=0;
		this.countSize=0;
		this.endValue=this.startSize*countNumber;
	}

	
	/**
	 * @return the startSize
	 */
	public int getStartSize() {
		return startSize;
	}

	/**
	 * @param startSize the startSize to set
	 */
	public void setStartSize(int startSize) {
		this.startSize = startSize;
		this.startValue=(startSize-1)*countNumber;
		this.endValue=countNumber;
	}


	/**
	 * @return the endValue
	 */
	public int getEndValue() {
		return endValue;
	}

	/**
	 * @return the startValue
	 */
	public int getStartValue() {
		return startValue;
	}

	/**
	 * @param endValue the endValue to set
	 */
	public void setEndValue(int endValue) {
		this.endValue = endValue;
	}

	/**
	 * @param startValue the startValue to set
	 */
	public void setStartValue(int startValue) {
		this.startValue = startValue;
	}

	/**
	 * @return the countValue
	 */
	public int getCountValue() {
		return countValue;
	}

	/**
	 * @param countValue the countValue to set
	 */
	public void setCountValue(int countValue) {
		this.countValue = countValue;
	}

	/**
	 * @return the countSize
	 */
	public int getCountSize() {
		return countSize;
	}

	/**
	 * @param countSize the countSize to set
	 */
	public void setCountSize(int countSize) {
		this.countSize = countSize;
	}

	public void print(){
		System.out.println("*****************");
		System.out.println("countValue:"+countValue);
		System.out.println("countSize:"+countSize);
		System.out.println("startSize:"+startSize);
		System.out.println("startValue:"+startValue);
		System.out.println("endValue:"+endValue);
		System.out.println("******************");
	}

	/**
	 * @return the countNumber
	 */
	public int getCountNumber() {
		return countNumber;
	}

	/**
	 * @param countNumber the countNumber to set
	 */
	public void setCountNumber(int countNumber) {
		this.countNumber = countNumber;
	}

}