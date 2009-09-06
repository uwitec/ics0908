package com.mydomain.bean.storage;

public class Page {

	public static final int PAGE_SIZE = 20;

	private int currentPage = 1;
	private int pageSize;
	private int pageStart;
	private int pageEnd;
	private int totalPage;
	private int nextPage;
	private int previousPage;
	private int totalRowsAmount;
	private boolean hasNext;
	private boolean hasPrevious;
	private boolean rowsAmountSet;

	public Page() {

	}

	public Page(int totalRowsAmount) {
		setTotalRowsAmount(totalRowsAmount);
	}

	public void setTotalRowsAmount(int totalRowsAmount) {
		if (pageSize == 0)
			pageSize = PAGE_SIZE;

		if (!this.rowsAmountSet) {
			this.totalRowsAmount = totalRowsAmount;
			totalPage = (this.totalRowsAmount % pageSize == 0) ? this.totalRowsAmount
					/ pageSize
					: this.totalRowsAmount / pageSize + 1;
			setCurrentPage(this.currentPage);
			this.rowsAmountSet = true;
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;

		nextPage = this.currentPage + 1;

		this.previousPage = this.currentPage - 1;

		if (this.currentPage * pageSize < totalRowsAmount) {
			pageEnd = this.currentPage * pageSize;
			pageStart = pageEnd - pageSize;
		} else {
			pageEnd = totalRowsAmount;
			pageStart = (this.totalPage - 1) * pageSize;
		}

		if (pageStart < 0) {
			pageStart = 0;
		}

		if (nextPage > totalPage) {
			hasNext = false;
		} else {
			hasNext = true;
		}

		if (previousPage < 1) {
			hasPrevious = false;
		} else {
			hasPrevious = true;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPreviousPage() {
		return previousPage;
	}

	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}

	public int getTotalRowsAmount() {
		return totalRowsAmount;
	}

	public boolean isHasNext() {
		return hasNext;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	public boolean isHasPrevious() {
		return hasPrevious;
	}

	public void setHasPrevious(boolean hasPrevious) {
		this.hasPrevious = hasPrevious;
	}

	public boolean isRowsAmountSet() {
		return rowsAmountSet;
	}

	public void setRowsAmountSet(boolean rowsAmountSet) {
		this.rowsAmountSet = rowsAmountSet;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

}
