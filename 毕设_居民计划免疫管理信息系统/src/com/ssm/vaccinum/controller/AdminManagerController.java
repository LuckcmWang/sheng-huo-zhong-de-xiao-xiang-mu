package com.ssm.vaccinum.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.vaccinum.pojo.T_Administrator;
import com.ssm.vaccinum.pojo.T_Vaccination;
import com.ssm.vaccinum.service.AdminService;


@Controller
public class AdminManagerController {
	@Resource
	private AdminService adminService;
	
	@RequestMapping("/AdminLogin.do")
	public String AdminLogin(String administrator_name, String administrator_password, HttpServletRequest request, Model mode) throws Exception {
		T_Administrator admin = null;
		if (administrator_name != null && !"".equals(administrator_name) && administrator_password != null && !"".equals(administrator_password)
				&& (admin = adminService.AdminLogin(administrator_name, administrator_password)) != null) {
			request.getSession().setAttribute("currentAdmin", admin);
			return "redirect:DashBoard.do";
		}
		return "AdminLogin";
	}
	
	@RequestMapping("/DashBoard.do")
	public String  Detail(){
		return "DashBoard";
	}
	
}
