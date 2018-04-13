package com.ssm.vaccinum.pojo;

import java.sql.Date;

public class T_Parameter {
	private int news_id;
	private int va_id;
	private String news_title;
	private String news_source;
	private Date news_date;
	@Override
	public String toString() {
		return "T_Parameter [news_id=" + news_id + ", va_id=" + va_id + ", news_title=" + news_title + ", news_source="
				+ news_source + ", news_date=" + news_date + "]";
	}
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public int getVa_id() {
		return va_id;
	}
	public void setVa_id(int va_id) {
		this.va_id = va_id;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_source() {
		return news_source;
	}
	public void setNews_source(String news_source) {
		this.news_source = news_source;
	}
	public Date getNews_date() {
		return news_date;
	}
	public void setNews_date(Date news_date) {
		this.news_date = news_date;
	}
}
