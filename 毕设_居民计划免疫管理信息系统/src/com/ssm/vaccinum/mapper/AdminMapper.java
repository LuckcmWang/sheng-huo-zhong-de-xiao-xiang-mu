package com.ssm.vaccinum.mapper;

import org.apache.ibatis.annotations.Param;

import com.ssm.vaccinum.pojo.T_Administrator;

public interface AdminMapper {   

	public T_Administrator findAdminByLogin(@Param("administrator_name")String administrator_name,@Param("administrator_password")String administrator_password) throws Exception;
	
}

