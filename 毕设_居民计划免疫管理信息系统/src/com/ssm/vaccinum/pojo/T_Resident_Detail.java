package com.ssm.vaccinum.pojo;

import java.util.Date;     

public class T_Resident_Detail {
	private int resident_id;
	private int detail_id;
	private String resident_name;
	private String resident_sex;
	private Date birth_date;
	private String resident_homeplace;
	private String resident_nationality;
	private String resident_nation;
	private String resident_education;
	private String resident_address;
	private String resident_job;
	private String resident_marriage;
	private String resident_household;
	public int getResident_id() {
		return resident_id;
	}
	public void setResident_id(int resident_id) {
		this.resident_id = resident_id;
	}
	public int getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}
	public String getResident_name() {
		return resident_name;
	}
	public void setResident_name(String resident_name) {
		this.resident_name = resident_name;
	}
	public String getResident_sex() {
		return resident_sex;
	}
	public void setResident_sex(String resident_sex) {
		this.resident_sex = resident_sex;
	}
	public Date getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(Date birth_date) {
		this.birth_date = birth_date;
	}
	public String getResident_homeplace() {
		return resident_homeplace;
	}
	public void setResident_homeplace(String resident_homeplace) {
		this.resident_homeplace = resident_homeplace;
	}
	public String getResident_nationality() {
		return resident_nationality;
	}
	public void setResident_nationality(String resident_nationality) {
		this.resident_nationality = resident_nationality;
	}
	public String getResident_nation() {
		return resident_nation;
	}
	public void setResident_nation(String resident_nation) {
		this.resident_nation = resident_nation;
	}
	public String getResident_education() {
		return resident_education;
	}
	public void setResident_education(String resident_education) {
		this.resident_education = resident_education;
	}
	public String getResident_address() {
		return resident_address;
	}
	public void setResident_address(String resident_address) {
		this.resident_address = resident_address;
	}
	public String getResident_job() {
		return resident_job;
	}
	public void setResident_job(String resident_job) {
		this.resident_job = resident_job;
	}
	public String getResident_marriage() {
		return resident_marriage;
	}
	public void setResident_marriage(String resident_marriage) {
		this.resident_marriage = resident_marriage;
	}
	public String getResident_household() {
		return resident_household;
	}
	public void setResident_household(String resident_household) {
		this.resident_household = resident_household;
	}
	@Override
	public String toString() {
		return "T_Resident_Detail [resident_id=" + resident_id + ", detail_id=" + detail_id + ", resident_name="
				+ resident_name + ", resident_sex=" + resident_sex + ", birth_date=" + birth_date
				+ ", resident_homeplace=" + resident_homeplace + ", resident_nationality=" + resident_nationality
				+ ", resident_nation=" + resident_nation + ", resident_education=" + resident_education
				+ ", resident_address=" + resident_address + ", resident_job=" + resident_job + ", resident_marriage="
				+ resident_marriage + ", resident_household=" + resident_household + "]";
	}
	
}
