package com.ssm.vaccinum.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.vaccinum.pojo.T_Vaccinum;

public interface VaccineMapper {
	
	public void insertVaccine(T_Vaccinum va) throws Exception;

	public void updateVaccine(T_Vaccinum va) throws Exception;

	public double count();

	public List<T_Vaccinum> selectAll(@Param("startrow")int startrow, @Param("length")int length);

	public T_Vaccinum selectById(int va_id);

	public List<T_Vaccinum> selectAllVaccine();


}
