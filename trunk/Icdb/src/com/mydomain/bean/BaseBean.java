package com.mydomain.bean;

public class BaseBean {

	private int countValue;
	private int countSize;
	private int startSize;
	private int startValue;
	private int endValue;
	public static int countNumber=10;
	
	public BaseBean(){
		this.countValue=0;
		this.startSize=1;
		this.startValue=0;
		this.countSize=0;
		this.endValue=this.startSize*BaseBean.countNumber;
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
		this.startValue=startSize*BaseBean.countNumber;
		this.endValue=(startSize+1)*BaseBean.countNumber;
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

	

}