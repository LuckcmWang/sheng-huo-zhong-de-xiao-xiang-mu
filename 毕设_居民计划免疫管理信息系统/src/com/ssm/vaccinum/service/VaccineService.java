package com.ssm.vaccinum.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.vaccinum.mapper.VaccineMapper;
import com.ssm.vaccinum.pojo.T_Vaccinum;

@Service
public class VaccineService {
	
	@Resource
	private VaccineMapper vaccineMapper;

	public void insertVaccinum(T_Vaccinum vaccine) throws Exception {
		// TODO Auto-generated method stub
		vaccineMapper.insertVaccine(vaccine);
	}

	public void updateVaccinum(T_Vaccinum vaccine) throws Exception {
		// TODO Auto-generated method stub
		vaccineMapper.updateVaccine(vaccine);
	}

	public double getVaccineCount() {
		// TODO Auto-generated method stub
		return vaccineMapper.count();
	}

	public List<T_Vaccinum> selectVaccineAll(int startrow, int length) {
		// TODO Auto-generated method stub
		return vaccineMapper.selectAll(startrow,length);
	}

	public T_Vaccinum selectVaccineById(int b) {
		// TODO Auto-generated method stub
		return vaccineMapper.selectById(b);
	}

	public List<T_Vaccinum> selectVaccineAll() {
		// TODO Auto-generated method stub
		return vaccineMapper.selectAllVaccine();
	}

}
