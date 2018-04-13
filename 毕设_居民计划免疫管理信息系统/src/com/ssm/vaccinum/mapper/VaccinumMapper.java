package com.ssm.vaccinum.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.vaccinum.pojo.T_Vaccination;

public interface VaccinumMapper {
	
	public void insertVaccinum(T_Vaccination va) throws Exception;

	public void deleteVaccinum(int id) throws Exception;
	
	public void updateVaccinum(T_Vaccination va) throws Exception;

	public List<T_Vaccination> selectVaccination(@Param("startrow")int startrow,@Param("length")int length);
	
	public double getVaccinationCount();
	
	public double getCount(String resident_id);

	public List<T_Vaccination> selectSomeVaccination(@Param("resident_id")String resident_id, @Param("startrow")int startrow, @Param("length")int length);

	public List<T_Vaccination> selectSomeVaccinationForUser(@Param("resident_id")String resident_id, @Param("va_id")String va_id, @Param("startrow")int startrow, @Param("length")int length);

	public void updateRemarks(@Param("vaccination_id")int vaccination_id, @Param("vaccination_remarks")String vaccination_remarks);

	public int countNum(int va_id);

	public int countVaccinumWithTimezone(@Param("va_id")int va_id, @Param("timeBegin")String timeBegin, @Param("timeEnd")String timeEnd);
}
