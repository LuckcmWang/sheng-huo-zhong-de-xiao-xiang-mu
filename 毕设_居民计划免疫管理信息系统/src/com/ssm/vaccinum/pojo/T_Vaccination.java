package com.ssm.vaccinum.pojo;

import java.util.Date;

public class T_Vaccination {
	private int vaccination_id;
	private int resident_id;
	private Date vaccination_date;
	private int va_id;
	private String vaccination_charge;
	private String vaccination_result;
	private String vaccination_place;
	private String vaccination_remarks;
	private T_Resident resident;
	private T_Vaccinum vaccinum;
	public T_Vaccinum getVaccinum() {
		return vaccinum;
	}
	public void setVaccinum(T_Vaccinum vaccinum) {
		this.vaccinum = vaccinum;
	}
	public T_Resident getResident() {
		return resident;
	}
	public void setResident(T_Resident resident) {
		this.resident = resident;
	}
	@Override
	public String toString() {
		return "T_Vaccination [vaccination_id=" + vaccination_id + ", resident_id=" + resident_id
				+ ", vaccination_date=" + vaccination_date + ", va_id=" + va_id + ", vaccination_charge="
				+ vaccination_charge + ", vaccination_result=" + vaccination_result + ", vaccination_place="
				+ vaccination_place + ", vaccination_remarks=" + vaccination_remarks + ", resident=" + resident
				+ ", vaccinum=" + vaccinum + "]";
	}
	public int getVaccination_id() {
		return vaccination_id;
	}
	public void setVaccination_id(int vaccination_id) {
		this.vaccination_id = vaccination_id;
	}
	public int getResident_id() {
		return resident_id;
	}
	public void setResident_id(int resident_id) {
		this.resident_id = resident_id;
	}
	public Date getVaccination_date() {
		return vaccination_date;
	}
	public void setVaccination_date(Date vaccination_date) {
		this.vaccination_date = vaccination_date;
	}
	public int getVa_id() {
		return va_id;
	}
	public void setVa_id(int va_id) {
		this.va_id = va_id;
	}
	public String getVaccination_charge() {
		return vaccination_charge;
	}
	public void setVaccination_charge(String vaccination_charge) {
		this.vaccination_charge = vaccination_charge;
	}
	public String getVaccination_result() {
		return vaccination_result;
	}
	public void setVaccination_result(String vaccination_result) {
		this.vaccination_result = vaccination_result;
	}
	public String getVaccination_place() {
		return vaccination_place;
	}
	public void setVaccination_place(String vaccination_place) {
		this.vaccination_place = vaccination_place;
	}
	public String getVaccination_remarks() {
		return vaccination_remarks;
	}
	public void setVaccination_remarks(String vaccination_remarks) {
		this.vaccination_remarks = vaccination_remarks;
	}
}
