package com.ssm.vaccinum.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.vaccinum.pojo.T_Resident;

public interface ResidentMapper {
	
	public T_Resident findResidentById(int id) throws Exception;
	
	public T_Resident findResidentByLogin(@Param("login_name")String login_name,@Param("login_password")String login_password) throws Exception;
	
	public T_Resident findResidentByLoginName(@Param("login_name")String login_name) throws Exception;
	
	public List<T_Resident> queryResident(@Param("Resident")T_Resident Resident,@Param("startrow")int startrow,@Param("length")int length) throws Exception;
	
	public int queryResidentCount(@Param("Resident")T_Resident Resident) throws Exception;
	
	public void insertResident(T_Resident Resident) throws Exception;
	
	public void deleteResident(int id) throws Exception;
	
	public void updateResident(T_Resident Resident) throws Exception;

	public List<T_Resident> selectResident(@Param("startrow")int startrow, @Param("length")int length);
	
	public double selectNum();

	public List<T_Resident> selectSomeResident(@Param("resident_id")String resident_id, @Param("startrow")int startrow, @Param("length")int length);

	public double selectSomeNum(@Param("resident_id")String resident_id);
}
