package com.ssm.vaccinum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.vaccinum.pojo.T_Parameter;
import com.ssm.vaccinum.service.NewsService;
import com.ssm.vaccinum.vo.Page;

@Controller
public class NewsManagerController {
	
	@Resource
	private NewsService newsService;
	
	@RequestMapping("/ajax_GetVaNews")
	@ResponseBody
	public Page<T_Parameter> getNews(){
		Page<T_Parameter> news = new Page<T_Parameter>();
		news.setAllPageNum(Math.ceil(newsService.countNum()/4));
		news.setCurrentPage(1);
		news.setPageRowNum(4);
		news.setObjList(newsService.selectNews(0,4));
		return news;
	}
	
	@RequestMapping("/NewsPageTurn")
	@ResponseBody
	public Page<T_Parameter> newsPageTurn(double allPageNum,int currentPage,int pageRowNum){
		Page<T_Parameter> news = new Page<T_Parameter>();
		news.setAllPageNum(allPageNum);
		news.setCurrentPage(currentPage);
		news.setPageRowNum(pageRowNum);
		news.setObjList(newsService.selectNews((currentPage-1)*4,4));
		return news;
	}
	
	@RequestMapping("/AddNewsDo.do")
	public String AddNews(String news_title, String news_source, 
			String news_date, int va_id, String vaccination_remarks, HttpServletResponse response) throws Exception{
			T_Parameter news = new T_Parameter();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = sdf.parse(news_date);
			java.sql.Date date = new java.sql.Date(date1.getTime());
			news.setNews_title(news_title);
			news.setVa_id(va_id);
			news.setNews_date(date);
			news.setNews_source(news_source);
			newsService.insertNews(news);
			return "redirect:gotoAdNews.do";
	}
	
	@RequestMapping("/deleteNewsAction")
	public void managerPlanning(int news_id, HttpServletResponse response) throws IOException, ParseException{
		PrintWriter out = response.getWriter();
		newsService.delete(news_id);
		
		out.write("1");
	}
	
	@RequestMapping("/newsSourceForm.do")
	public void learnMore(String newsSourceInput, HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException, ServletException{
		T_Parameter news = newsService.selectNews(newsSourceInput);
		request.setAttribute("news", news);
		request.getRequestDispatcher("/WEB-INF/jsp/URLInfo.jsp").forward(request, response);
	}

}
