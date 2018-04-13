package com.ssm.vaccinum.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.vaccinum.pojo.T_Notice;
import com.ssm.vaccinum.pojo.T_Va_Planning;

public interface NoticedMapper {

	public double count();

	public List<T_Notice> getNotice(@Param("startrow")int startrow, @Param("length")int length);

	public void insertNotice(T_Notice notice);

	public void deleteNotice(@Param("resident_id")int resident_id, @Param("va_id")int va_id);

	public T_Notice select(@Param("resident_id")int resident_id, @Param("va_id")int va_id);

	public int countNum(int va_id);

	public int countNonNum(@Param("va_id")int va_id, @Param("timeBegin")String timeBegin, @Param("timeEnd")String timeEnd);

}
