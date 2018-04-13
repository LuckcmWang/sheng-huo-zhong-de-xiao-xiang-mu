package com.ssm.vaccinum.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.vaccinum.pojo.T_Resident;
import com.ssm.vaccinum.pojo.T_Vaccination;
import com.ssm.vaccinum.service.NoticeService;
import com.ssm.vaccinum.service.ResidentManagerService;
import com.ssm.vaccinum.service.VaccinumService;
import com.ssm.vaccinum.vo.Page;


@Controller
public class VaccinumManagerController {
	@Resource
	private VaccinumService vaccinumService;
	
	@Resource
	private NoticeService delNoticeService;

	@RequestMapping("/AddRecord.do")
	public String AddVaccinumRecord(int resident_id, String vaccination_date, int va_id, String vaccination_charge, 
			String vaccination_result, String vaccination_place, String vaccination_remarks, HttpServletResponse response) throws Exception{
			T_Vaccination vaccinum = new T_Vaccination();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = sdf.parse(vaccination_date);
			java.sql.Date date = new java.sql.Date(date1.getTime());
			vaccinum.setResident_id(resident_id);
			vaccinum.setVa_id(va_id);
			vaccinum.setVaccination_charge(vaccination_charge);
			vaccinum.setVaccination_date(date);
			vaccinum.setVaccination_result(vaccination_result);
			vaccinum.setVaccination_place(vaccination_place);
			vaccinum.setVaccination_remarks(vaccination_remarks);
			vaccinumService.insertVaccinum(vaccinum);
			
			//删除通知表中的记录
			delNoticeService.delete(resident_id,va_id);
			return "redirect:gotoAdVaRecord.do";
	}
	
	@RequestMapping("/DelRecord.do")
	public void DelVaccinumRecord(int vaccination_id, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		vaccinumService.deleteVaccinum(vaccination_id);
		out.write("1");
	}
	
	@RequestMapping("/ModRecord.do")
	public String ModVaccinumRecord(int vaccination_id,int resident_id, String vaccination_date, int va_id, String vaccination_charge, 
			String vaccination_result, String vaccination_place, String vaccination_remarks, HttpServletResponse response) throws Exception{
			T_Vaccination vaccinum = new T_Vaccination();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = sdf.parse(vaccination_date);
			java.sql.Date date = new java.sql.Date(date1.getTime());
			vaccinum.setVaccination_id(vaccination_id);
			vaccinum.setResident_id(resident_id);
			vaccinum.setVa_id(va_id);
			vaccinum.setVaccination_charge(vaccination_charge);
			vaccinum.setVaccination_date(date);
			vaccinum.setVaccination_result(vaccination_result);
			vaccinum.setVaccination_place(vaccination_place);
			vaccinum.setVaccination_remarks(vaccination_remarks);
			vaccinumService.updateVaccinum(vaccinum);
			return "redirect:gotoAdVaRecord.do";
	}
	
	@RequestMapping("/ajax_GetRecords")
	@ResponseBody
	public Page<T_Vaccination> getRecord(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Page<T_Vaccination> page =new Page<T_Vaccination>();
		page.setAllPageNum(Math.ceil(vaccinumService.getCount()/10));
		page.setCurrentPage(1);
		page.setPageRowNum(10);
		page.setObjList(vaccinumService.selectAll(0, 10));
		return page;
	}
	
	@RequestMapping("/PageTurn")
	@ResponseBody
	public Page<T_Vaccination> turnPage(String resident_id, Integer currentPage, Integer pageRowNum, double allPageNum, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Page<T_Vaccination> page =new Page<T_Vaccination>();
		page.setAllPageNum(allPageNum);
		page.setCurrentPage(currentPage);
		page.setPageRowNum(pageRowNum);
		if(resident_id!=null && !"".equals(resident_id)){
			page.setObjList(vaccinumService.selectAll(resident_id,10*(currentPage-1), 10));
			return page;
		}
		page.setObjList(vaccinumService.selectAll(10*(currentPage-1), 10));
		return page;
	}
	
	@RequestMapping("/ResidentSearch")
	@ResponseBody
	public Page<T_Vaccination> SearchPage(String resident_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Page<T_Vaccination> page =new Page<T_Vaccination>();
		page.setAllPageNum(Math.ceil(vaccinumService.getResidentCount(resident_id)/10));
		page.setCurrentPage(1);
		page.setPageRowNum(10);
		page.setObjList(vaccinumService.selectAll(resident_id, 0, 10));
		return page;
	}
	
	@RequestMapping("/ResidentSearchForUser")
	@ResponseBody
	public Page<T_Vaccination> UserPage(String resident_id, String va_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Page<T_Vaccination> page =new Page<T_Vaccination>();
		page.setAllPageNum(Math.ceil(vaccinumService.getResidentCount(resident_id)/5));
		page.setCurrentPage(1);
		page.setPageRowNum(5);
		page.setObjList(vaccinumService.selectAllForUser(resident_id, va_id, 0, 5));
		return page;
	}
	
	@RequestMapping("/PageTurnForUser")
	@ResponseBody
	public Page<T_Vaccination> turnPageForUser(String resident_id, String va_id, Integer currentPage, Integer pageRowNum, double allPageNum, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Page<T_Vaccination> page =new Page<T_Vaccination>();
		page.setAllPageNum(allPageNum);
		page.setCurrentPage(currentPage);
		page.setPageRowNum(pageRowNum);
		page.setObjList(vaccinumService.selectAllForUser(resident_id, va_id, (currentPage-1)*5, 5));
		return page;
	}
	
	@RequestMapping("/commentVaccinum.do")
	public String ModVaccinumRemarks(String resident_id, int vaccination_id, String vaccination_remarks, HttpServletResponse response, HttpServletRequest request) throws Exception{
		vaccinumService.updateVaccinumRemarks(vaccination_id,vaccination_remarks);
		System.out.println(resident_id);
		return "redirect:gotoUserVaRecord.do?resident_id="+resident_id;
	}
}
