package com.ssm.vaccinum.pojo;

import java.sql.Date;

public class T_Va_Planning {
	private int resident_id;
	private int va_id;
	private Date va_date;
	private String va_address;
	public String getVa_address() {
		return va_address;
	}
	public void setVa_address(String va_address) {
		this.va_address = va_address;
	}
	@Override
	public String toString() {
		return "T_Va_Planning [resident_id=" + resident_id + ", va_id=" + va_id + ", va_date=" + va_date
				+ ", va_address=" + va_address + "]";
	}
	public int getResident_id() {
		return resident_id;
	}
	public void setResident_id(int resident_id) {
		this.resident_id = resident_id;
	}
	public int getVa_id() {
		return va_id;
	}
	public void setVa_id(int va_id) {
		this.va_id = va_id;
	}
	public Date getVa_date() {
		return va_date;
	}
	public void setVa_date(Date va_date) {
		this.va_date = va_date;
	}
}
