package com.ssm.vaccinum.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.vaccinum.mapper.AdminMapper;
import com.ssm.vaccinum.pojo.T_Administrator;
import com.ssm.vaccinum.pojo.T_Vaccination;

@Service
public class AdminService {
	@Resource
	private AdminMapper adminMapper;
	
	public T_Administrator AdminLogin(String administrator_name,String administrator_password) throws Exception{
		T_Administrator admin = adminMapper.findAdminByLogin(administrator_name, administrator_password);
		return admin;
	}
}
