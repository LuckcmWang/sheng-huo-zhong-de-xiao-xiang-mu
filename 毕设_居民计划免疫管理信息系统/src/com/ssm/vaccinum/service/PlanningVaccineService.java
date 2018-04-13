package com.ssm.vaccinum.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.vaccinum.mapper.NoticeMapper;
import com.ssm.vaccinum.pojo.T_Va_Planning;

@Service
public class PlanningVaccineService {
	@Resource
	NoticeMapper noticeMapper;

	public double countNum() {
		// TODO Auto-generated method stub
		return noticeMapper.count();
	}

	public List<T_Va_Planning> selectNotice(int startrow, int length) {
		// TODO Auto-generated method stub
		return noticeMapper.getNotice(startrow,length);
	}
	
	public void delete(int a, int b) {
		// TODO Auto-generated method stub
		noticeMapper.deletePlanning(a,b);
	}

	public T_Va_Planning select(int a, int b) {
		// TODO Auto-generated method stub
		return noticeMapper.select(a,b);
	}

	public void insert(T_Va_Planning signUp) {
		// TODO Auto-generated method stub
		noticeMapper.insert(signUp);
	}

	public int countPlaningAllMonth(int va_id) {
		// TODO Auto-generated method stub
		return noticeMapper.countNum(va_id);
	}

	public int countNonNum(int va_id, String begin, String end) {
		// TODO Auto-generated method stub
		return noticeMapper.countNonNum(va_id,begin,end);
	}
}
