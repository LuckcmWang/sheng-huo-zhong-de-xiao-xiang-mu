package com.ssm.vaccinum.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.vaccinum.pojo.T_Resident;
import com.ssm.vaccinum.service.ResidentManagerService;

@Controller
public class PageJumpController{
	
	@Resource
	ResidentManagerService residentManagerService;
	
	@RequestMapping("/gotoCheck.do")
	public String gotoCheck(){
		return "CheckPhone";
	}
	
	@RequestMapping("/gotoReg.do")
	public String  gotoReg(){
		return "UserReg";
	}
	
	@RequestMapping("/gotoDetail.do")
	public void  gotoDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int resident_id = Integer.parseInt(request.getParameter("resident_id"));
		T_Resident resident = residentManagerService.QueryUserById(resident_id);
		request.getSession().setAttribute("currentResident", resident);
		request.getRequestDispatcher("/WEB-INF/jsp/UserDetail.jsp").forward(request, response);
	}
	
	@RequestMapping("/gotoUserVaRecord.do")
	public void  gotoRecord(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int resident_id = Integer.parseInt(request.getParameter("resident_id"));
		T_Resident resident = residentManagerService.QueryUserById(resident_id);
		request.getSession().setAttribute("currentResident", resident);
		request.getRequestDispatcher("/WEB-INF/jsp/UserVaRecord.jsp").forward(request, response);
	}
	
	@RequestMapping("/gotoUserJournling.do")
	public void  gotoUserJournling(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int resident_id = Integer.parseInt(request.getParameter("resident_id"));
		T_Resident resident = residentManagerService.QueryUserById(resident_id);
		request.getSession().setAttribute("currentResident", resident);
		request.getRequestDispatcher("/WEB-INF/jsp/UserJournaling.jsp").forward(request, response);
	}
	
	@RequestMapping("/gotoUserNews.do")
	public void  gotoUserNews(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int resident_id = Integer.parseInt(request.getParameter("resident_id"));
		T_Resident resident = residentManagerService.QueryUserById(resident_id);
		request.getSession().setAttribute("currentResident", resident);
		request.getRequestDispatcher("/WEB-INF/jsp/UserNews.jsp").forward(request, response);
	}
	
	@RequestMapping("/DashBoardLogin.do")
	public String  gotoAdmin(){
		return "AdminLogin";
	}
	
	@RequestMapping("/gotoAdVaRecord.do")
	public String  gotoAdVaRecord(){
		return "AdVaRecord";
	}
	
	@RequestMapping("/gotoAdUser.do")
	public String  gotoAdUser(){
		return "AdUser";
	}
	
	@RequestMapping("/gotoAdNotice.do")
	public String  gotoAdNotice(){
		return "AdNotice";
	}
	
	@RequestMapping("/gotoAdNews.do")
	public String  gotoAdNews(){
		return "AdNews";
	}
	
	@RequestMapping("/gotoDashBoard.do")
	public String  gotoDashBoard(){
		return "DashBoard";
	}
	
	@RequestMapping("/gotoleftlets.do")
	public String  gotoleftlets(){
		return "NoticeLeftlets";
	}
	
	@RequestMapping("/gotoAdJournaling.do")
	public String  gotoAdJournaling(){
		return "AdVaJournling";
	}
}
