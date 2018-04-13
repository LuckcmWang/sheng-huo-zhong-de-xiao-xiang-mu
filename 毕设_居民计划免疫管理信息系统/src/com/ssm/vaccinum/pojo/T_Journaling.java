package com.ssm.vaccinum.pojo;

import java.sql.Date;

public class T_Journaling {
	private int journaling_id;
	private String j_type;
	private Date r_mouth;
	private int va_num;
	private int non_num;
	private float va_ratio;
	@Override
	public String toString() {
		return "T_Journaling [journaling_id=" + journaling_id + ", j_type=" + j_type + ", r_mouth=" + r_mouth
				+ ", va_num=" + va_num + ", non_num=" + non_num + ", va_ratio=" + va_ratio + "]";
	}
	public int getJournaling_id() {
		return journaling_id;
	}
	public void setJournaling_id(int journaling_id) {
		this.journaling_id = journaling_id;
	}
	public String getJ_type() {
		return j_type;
	}
	public void setJ_type(String j_type) {
		this.j_type = j_type;
	}
	public Date getR_mouth() {
		return r_mouth;
	}
	public void setR_mouth(Date r_mouth) {
		this.r_mouth = r_mouth;
	}
	public int getVa_num() {
		return va_num;
	}
	public void setVa_num(int va_num) {
		this.va_num = va_num;
	}
	public int getNon_num() {
		return non_num;
	}
	public void setNon_num(int non_num) {
		this.non_num = non_num;
	}
	public float getVa_ratio() {
		return va_ratio;
	}
	public void setVa_ratio(float va_ratio) {
		this.va_ratio = va_ratio;
	}
}
