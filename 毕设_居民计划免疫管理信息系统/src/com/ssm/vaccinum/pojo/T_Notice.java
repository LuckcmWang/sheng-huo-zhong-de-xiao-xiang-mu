package com.ssm.vaccinum.pojo;

import java.sql.Date;

public class T_Notice {
	private int resident_id;
	private int va_id;
	private int sended;
	private String va_style;
	private String va_comment;
	private Date va_deadline;
	@Override
	public String toString() {
		return "T_Notice [resident_id=" + resident_id + ", va_id=" + va_id + ", sended=" + sended + ", va_style="
				+ va_style + ", va_comment=" + va_comment + ", va_deadline=" + va_deadline + ", send_time=" + send_time
				+ "]";
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
	public int getSended() {
		return sended;
	}
	public void setSended(int sended) {
		this.sended = sended;
	}
	public String getVa_style() {
		return va_style;
	}
	public void setVa_style(String va_style) {
		this.va_style = va_style;
	}
	public String getVa_comment() {
		return va_comment;
	}
	public void setVa_comment(String va_comment) {
		this.va_comment = va_comment;
	}
	public Date getVa_deadline() {
		return va_deadline;
	}
	public void setVa_deadline(Date va_deadline) {
		this.va_deadline = va_deadline;
	}
	public Date getSend_time() {
		return send_time;
	}
	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}
	private Date send_time;
}
