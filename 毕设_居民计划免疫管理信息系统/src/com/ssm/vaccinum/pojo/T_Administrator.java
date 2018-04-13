package com.ssm.vaccinum.pojo;

public class T_Administrator {
	private int administrator_id;
	private String administrator_name;
	private String administrator_password;
	public int getAdministrator_id() {
		return administrator_id;
	}
	@Override
	public String toString() {
		return "T_Administrator [administrator_id=" + administrator_id + ", administrator_name=" + administrator_name
				+ ", administrator_password=" + administrator_password + "]";
	}
	public void setAdministrator_id(int administrator_id) {
		this.administrator_id = administrator_id;
	}
	public String getAdministrator_name() {
		return administrator_name;
	}
	public void setAdministrator_name(String administrator_name) {
		this.administrator_name = administrator_name;
	}
	public String getAdministrator_password() {
		return administrator_password;
	}
	public void setAdministrator_password(String administrator_password) {
		this.administrator_password = administrator_password;
	} 
}
