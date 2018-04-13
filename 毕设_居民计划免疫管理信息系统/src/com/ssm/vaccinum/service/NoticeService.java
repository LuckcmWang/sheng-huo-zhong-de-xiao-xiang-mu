package com.ssm.vaccinum.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.vaccinum.mapper.NoticeMapper;
import com.ssm.vaccinum.mapper.NoticedMapper;
import com.ssm.vaccinum.pojo.T_Notice;
import com.ssm.vaccinum.pojo.T_Va_Planning;

@Service
public class NoticeService {
	@Resource
	NoticedMapper noticedMapper;

	public double countNum() {
		// TODO Auto-generated method stub
		return noticedMapper.count();
	}

	public List<T_Notice> selectNotice(int startrow, int length) {
		// TODO Auto-generated method stub
		return noticedMapper.getNotice(startrow,length);
	}

	public void insert(T_Notice notice) {
		// TODO Auto-generated method stub
		noticedMapper.insertNotice(notice);
	}

	public void delete(int resident_id, int va_id) {
		// TODO Auto-generated method stub
		noticedMapper.deleteNotice(resident_id,va_id);
	}

	public T_Notice select(int resident_id, int va_id) {
		// TODO Auto-generated method stub
		return noticedMapper.select(resident_id, va_id);
	}

	public int countNum(int va_id) {
		// TODO Auto-generated method stub
		return noticedMapper.countNum(va_id);
	}

	public int countNonNum(int va_id, String timeBegin, String timeEnd) {
		// TODO Auto-generated method stub
		return noticedMapper.countNonNum(va_id, timeBegin, timeEnd);
	}

}
