package com.ssm.vaccinum.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.vaccinum.mapper.ResidentDetailMapper;
import com.ssm.vaccinum.mapper.ResidentMapper;
import com.ssm.vaccinum.pojo.T_Resident;
import com.ssm.vaccinum.pojo.T_Resident_Detail;
import com.ssm.vaccinum.vo.Page;

@Service
public class ResidentManagerService {
	@Resource
	private ResidentMapper residentMapper;
	
	@Resource
	private ResidentDetailMapper residentDetailMapper;
	
	
	public T_Resident UserLogin(String login_name,String login_password) throws Exception{
		T_Resident resident = residentMapper.findResidentByLogin(login_name, login_password);
		return resident;
	}
	
	public T_Resident selectUser(String login_name) throws Exception{
		T_Resident resident = residentMapper.findResidentByLoginName(login_name);
		return resident;
	}
	
	public void insertUser(T_Resident re) throws Exception{
		residentMapper.insertResident(re);
	}
	
	public List<T_Resident> selectAll(int startrow , int length){
		return residentMapper.selectResident(startrow,length);
	}
	
	public List<T_Resident> selectAll(String resident_id, int startrow, int length) {
		// TODO Auto-generated method stub
		return residentMapper.selectSomeResident(resident_id,startrow,length);
	}
	
	public double selectNum(){
		return residentMapper.selectNum();
	}
	
	public double selectNum(String resident_id) {
		// TODO Auto-generated method stub
		return residentMapper.selectSomeNum(resident_id);
	}
	
	public Page<T_Resident> QueryUser(T_Resident resident,Page<T_Resident> page) throws Exception{
		int pageMAXRow = page.getPageRowNum();
		int startrow = (page.getCurrentPage()-1)*page.getPageRowNum();
		
		List<T_Resident> residentList = residentMapper.queryResident(resident,startrow,page.getPageRowNum());
		page.setObjList(residentList);
		
		int allRowNum = residentMapper.queryResidentCount(resident);
		int allPageNum = allRowNum%pageMAXRow==0?allRowNum/pageMAXRow:allRowNum/pageMAXRow+1;
		page.setAllPageNum(allPageNum);
		
		return page;
	}
	
	public T_Resident QueryUserById(int id) throws Exception{
		
		T_Resident resident = residentMapper.findResidentById(id);
		return resident;
	}
	
	/**
	 * 修改用户信息
	 * @param user
	 * @throws Exception 
	 */
	public void UpdateUserInfo(T_Resident resident) throws Exception{
		residentMapper.updateResident(resident);
	}

	public int selectDetailCount(int resident_id) {
		// TODO Auto-generated method stub
		return residentDetailMapper.select(resident_id);
	}

	public void insertDetail(T_Resident_Detail detail) throws Exception {
		// TODO Auto-generated method stub
		residentDetailMapper.insertDetail(detail);
	}

	public void updateDetail(T_Resident_Detail detail) throws Exception {
		// TODO Auto-generated method stub
		residentDetailMapper.updateDetail(detail);
	}

}