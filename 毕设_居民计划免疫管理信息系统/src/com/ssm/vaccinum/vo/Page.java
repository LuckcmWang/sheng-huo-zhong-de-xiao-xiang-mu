package com.ssm.vaccinum.vo;

import java.util.List;

public class Page<T> {
	private double allPageNum;			//总页数
	private Integer pageRowNum;			//每页行数
	private Integer currentPage;		//当前页数
	private List<T> objList;		//当前页显示的信息
	public double getAllPageNum() {
		return allPageNum;
	}
	public void setAllPageNum(double d) {
		this.allPageNum = d;
	}
	public Integer getPageRowNum() {
		return pageRowNum;
	}
	public void setPageRowNum(Integer pageRowNum) {
		this.pageRowNum = pageRowNum;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public List<T> getObjList() {
		return objList;
	}
	public void setObjList(List<T> objList) {
		this.objList = objList;
	}
	@Override
	public String toString() {
		return "Page [allPageNum=" + allPageNum + ", pageRowNum=" + pageRowNum + ", currentPage=" + currentPage
				+ ", objList=" + objList + "]";
	}
}
