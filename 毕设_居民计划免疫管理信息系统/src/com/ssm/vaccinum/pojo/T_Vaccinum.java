package com.ssm.vaccinum.pojo;

public class T_Vaccinum {
	private int va_id;
	private String va_name;
	private String va_indication;
	private String va_reaction;
	private String va_usage;
	public int getVa_id() {
		return va_id;
	}
	public void setVa_id(int va_id) {
		this.va_id = va_id;
	}
	public String getVa_name() {
		return va_name;
	}
	public void setVa_name(String va_name) {
		this.va_name = va_name;
	}
	public String getVa_indication() {
		return va_indication;
	}
	public void setVa_indication(String va_indication) {
		this.va_indication = va_indication;
	}
	public String getVa_reaction() {
		return va_reaction;
	}
	public void setVa_reaction(String va_reaction) {
		this.va_reaction = va_reaction;
	}
	public String getVa_usage() {
		return va_usage;
	}
	public void setVa_usage(String va_usage) {
		this.va_usage = va_usage;
	}
	@Override
	public String toString() {
		return "T_Vaccine [va_id=" + va_id + ", va_name=" + va_name + ", va_indication=" + va_indication
				+ ", va_reaction=" + va_reaction + ", va_usage=" + va_usage + "]";
	}
}
