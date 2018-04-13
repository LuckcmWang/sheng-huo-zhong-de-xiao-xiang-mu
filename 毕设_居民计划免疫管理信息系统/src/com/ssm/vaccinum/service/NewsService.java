package com.ssm.vaccinum.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.vaccinum.mapper.NewsMapper;
import com.ssm.vaccinum.mapper.NoticeMapper;
import com.ssm.vaccinum.mapper.NoticedMapper;
import com.ssm.vaccinum.pojo.T_Notice;
import com.ssm.vaccinum.pojo.T_Parameter;
import com.ssm.vaccinum.pojo.T_Va_Planning;

@Service
public class NewsService {
	@Resource
	NewsMapper newsMapper;

	public double countNum() {
		// TODO Auto-generated method stub
		return newsMapper.count();
	}

	public List<T_Parameter> selectNews(int startrow, int length) {
		// TODO Auto-generated method stub
		return newsMapper.getNews(startrow,length);
	}

	public void insertNews(T_Parameter news) {
		// TODO Auto-generated method stub
		newsMapper.insertNews(news);
	}

	public void delete(int news_id) {
		// TODO Auto-generated method stub
		newsMapper.deleteNews(news_id);
	}

	public T_Parameter selectNews(String news_id) {
		// TODO Auto-generated method stub
		return newsMapper.selectNews(news_id);
	}

}
