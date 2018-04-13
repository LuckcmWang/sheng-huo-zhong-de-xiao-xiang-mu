package com.ssm.vaccinum.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.vaccinum.pojo.T_Vaccinum;
import com.ssm.vaccinum.service.VaccineService;
import com.ssm.vaccinum.vo.Page;

@Controller
public class VaccineManagerController {
	@Resource
	private VaccineService vaccineService;
	
	@RequestMapping("/AddVaccine.do")
	public String AddVaccine(String va_name, String va_indication, String va_reaction, 
			String va_usage, HttpServletResponse response) throws Exception{
			T_Vaccinum vaccine = new T_Vaccinum();
			vaccine.setVa_indication(va_indication);
			vaccine.setVa_name(va_name);
			vaccine.setVa_reaction(va_reaction);
			vaccine.setVa_usage(va_usage);
			vaccineService.insertVaccinum(vaccine);
			return "redirect:gotoDashBoard.do";
	}
	
	@RequestMapping("/ModVaccine.do")
	public String ModVaccine(int va_id, String va_name, String va_indication, String va_reaction, 
			String va_usage, HttpServletResponse response) throws Exception{
			T_Vaccinum vaccine = new T_Vaccinum();
			vaccine.setVa_id(va_id);
			vaccine.setVa_indication(va_indication);
			vaccine.setVa_name(va_name);
			vaccine.setVa_reaction(va_reaction);
			vaccine.setVa_usage(va_usage);
			vaccineService.updateVaccinum(vaccine);
			return "redirect:gotoDashBoard.do";
	}
	
	@RequestMapping("/ajax_GetVaccine")
	@ResponseBody
	public Page<T_Vaccinum> getVaccine(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Page<T_Vaccinum> page =new Page<T_Vaccinum>();
		page.setAllPageNum(Math.ceil(vaccineService.getVaccineCount()/10));
		page.setCurrentPage(1);
		page.setPageRowNum(10);
		page.setObjList(vaccineService.selectVaccineAll(0, 10));
		return page;
	}
	
	@RequestMapping("/VaccinePageTurn")
	@ResponseBody
	public Page<T_Vaccinum> VaccinePageTurn(int currentPage, int pageRowNum, double allPageNum, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Page<T_Vaccinum> page =new Page<T_Vaccinum>();
		page.setAllPageNum(Math.ceil(vaccineService.getVaccineCount()/10));
		page.setCurrentPage(currentPage);
		page.setPageRowNum(pageRowNum);
		page.setObjList(vaccineService.selectVaccineAll((currentPage-1)*10, 10));
		return page;
	}
}
