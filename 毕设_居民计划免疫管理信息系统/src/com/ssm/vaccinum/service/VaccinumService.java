package com.ssm.vaccinum.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.ssm.vaccinum.mapper.VaccinumMapper;
import com.ssm.vaccinum.pojo.T_Vaccination;

@Service
public class VaccinumService {
	@Resource
	private VaccinumMapper vaccinumMapper;

	public void insertVaccinum(T_Vaccination vaccinum) throws Exception {
		// TODO Auto-generated method stub
		vaccinumMapper.insertVaccinum(vaccinum);
	}

	public void deleteVaccinum(int vaccination_id) throws Exception {
		// TODO Auto-generated method stub
		vaccinumMapper.deleteVaccinum(vaccination_id);
	}

	public void updateVaccinum(T_Vaccination vaccinum) throws Exception {
		// TODO Auto-generated method stub
		vaccinumMapper.updateVaccinum(vaccinum);
	}

	public List<T_Vaccination> selectAll(int startrow,int length) {
		// TODO Auto-generated method stub
		List<T_Vaccination> vas = vaccinumMapper.selectVaccination(startrow, length);
		return vas;
	}
	
	public double getCount(){
		return vaccinumMapper.getVaccinationCount();
	}

	public double getResidentCount(String resident_id) {
		// TODO Auto-generated method stub
		return vaccinumMapper.getCount(resident_id);
	}

	public List<T_Vaccination> selectAll(String resident_id, int startrow, int length) {
		// TODO Auto-generated method stub
		List<T_Vaccination> vas = vaccinumMapper.selectSomeVaccination(resident_id, startrow, length);
		return vas;
	}

	public List<T_Vaccination> selectAllForUser(String resident_id, String va_id, int startrow, int length) {
		// TODO Auto-generated method stub
		List<T_Vaccination> vas = vaccinumMapper.selectSomeVaccinationForUser(resident_id, va_id, startrow, length);
		return vas;
	}

	public void updateVaccinumRemarks(int vaccination_id, String vaccination_remarks) {
		// TODO Auto-generated method stub
		vaccinumMapper.updateRemarks(vaccination_id,vaccination_remarks);
	}

	public int countPlanningAllMonth(int va_id) {
		// TODO Auto-generated method stub
		return vaccinumMapper.countNum(va_id);
	}

	public int countVaccinumWithTimezone(int va_id, String timeBegin, String timeEnd) {
		// TODO Auto-generated method stub
		return vaccinumMapper.countVaccinumWithTimezone(va_id, timeBegin, timeEnd);
	}
}
