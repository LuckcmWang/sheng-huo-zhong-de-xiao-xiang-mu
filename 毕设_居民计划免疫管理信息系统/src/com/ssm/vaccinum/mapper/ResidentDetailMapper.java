package com.ssm.vaccinum.mapper;

import com.ssm.vaccinum.pojo.T_Resident_Detail;

public interface ResidentDetailMapper {   

	public void insertDetail(T_Resident_Detail detail) throws Exception;

	public void deleteDetail(int id) throws Exception;
	
	public void updateDetail(T_Resident_Detail detail) throws Exception;

	public int select(int resident_id);
}
