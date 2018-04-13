package com.ssm.vaccinum.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.vaccinum.pojo.T_Va_Planning;

public interface NoticeMapper {

	public double count();

	public List<T_Va_Planning> getNotice(@Param("startrow")int startrow, @Param("length")int length);
	
	public void deletePlanning(@Param("resident_id")int resident_id, @Param("va_id")int va_id);

	public T_Va_Planning select(@Param("resident_id")int resident_id, @Param("va_id")int va_id);

	public void insert(T_Va_Planning signUp);

	public int countNum(int va_id);

	public int countNonNum(@Param("va_id")int va_id, @Param("begin")String begin, @Param("end")String end);
}
