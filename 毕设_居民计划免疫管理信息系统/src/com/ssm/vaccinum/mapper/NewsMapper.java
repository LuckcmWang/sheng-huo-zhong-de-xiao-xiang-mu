package com.ssm.vaccinum.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.vaccinum.pojo.T_Notice;
import com.ssm.vaccinum.pojo.T_Parameter;
import com.ssm.vaccinum.pojo.T_Va_Planning;

public interface NewsMapper {

	public double count();

	public List<T_Parameter> getNews(@Param("startrow")int startrow, @Param("length")int length);

	public void insertNews(T_Parameter news);

	public void deleteNews(@Param("news_id")int news_id);

	public T_Parameter selectNews(String news_id);

}
