package com.ssm.vaccinum.pojo;

public class T_Resident {
	private int resident_id;
	private String login_name;
	private String login_password;
	private String resident_telephone;
	private String resident_email;
	private String resident_idnumber;
	private T_Resident_Detail t_resident_detail;
	public int getResident_id() {
		return resident_id;
	}
	public void setResident_id(int resident_id) {
		this.resident_id = resident_id;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getLogin_password() {
		return login_password;
	}
	public void setLogin_password(String login_password) {
		this.login_password = login_password;
	}
	public String getResident_telephone() {
		return resident_telephone;
	}
	public void setResident_telephone(String resident_telephone) {
		this.resident_telephone = resident_telephone;
	}
	public String getResident_email() {
		return resident_email;
	}
	public void setResident_email(String resident_email) {
		this.resident_email = resident_email;
	}
	public String getResident_idnumber() {
		return resident_idnumber;
	}
	public void setResident_idnumber(String resident_idnumber) {
		this.resident_idnumber = resident_idnumber;
	}
	public T_Resident_Detail getT_resident_detail() {
		return t_resident_detail;
	}
	public void setT_resident_detail(T_Resident_Detail t_resident_detail) {
		this.t_resident_detail = t_resident_detail;
	}
	@Override
	public String toString() {
		return "T_Resident [resident_id=" + resident_id + ", login_name=" + login_name + ", login_password="
				+ login_password + ", resident_telephone=" + resident_telephone + ", resident_email=" + resident_email
				+ ", resident_idnumber=" + resident_idnumber + ", t_resident_detail=" + t_resident_detail + "]";
	}

}
