package com.ssm.vaccinum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.vaccinum.pojo.T_Notice;
import com.ssm.vaccinum.pojo.T_Resident;
import com.ssm.vaccinum.pojo.T_Va_Planning;
import com.ssm.vaccinum.pojo.T_Vaccinum;
import com.ssm.vaccinum.service.NoticeService;
import com.ssm.vaccinum.service.PlanningVaccineService;
import com.ssm.vaccinum.service.ResidentManagerService;
import com.ssm.vaccinum.service.VaccineService;
import com.ssm.vaccinum.service.VaccinumService;
import com.ssm.vaccinum.vo.Page;

@Controller
public class PlanningVaccineManagerController {
	
	@Resource
	private PlanningVaccineService planningVaccineService;
	
	@Resource
	private NoticeService noticeService;
	
	@Resource
	private VaccinumService vaccinumService;
	
	@Resource
	private VaccineService vaccineService;
	
	@Resource
	private ResidentManagerService  residentManagerService;
	
	@RequestMapping("/signUpVaccinum")
	public void insertNotice(int va_id, int resident_id, String va_address, HttpServletResponse response) throws ParseException, IOException{
		PrintWriter out = response.getWriter();
		T_Va_Planning signUp = null;
		T_Notice notice = null;
		if((signUp = planningVaccineService.select(resident_id, va_id)) != null || (notice = noticeService.select(resident_id, va_id)) != null){
			out.write("failed");
			return;
		}
		signUp = new T_Va_Planning();
		signUp.setResident_id(resident_id);
		signUp.setVa_id(va_id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = sdf.parse(sdf.format(new Date()));
		java.sql.Date date = new java.sql.Date(date1.getTime());
		signUp.setVa_date(date);
		signUp.setVa_address(va_address);
		planningVaccineService.insert(signUp);
		out.write("ok");
	}
	
	@RequestMapping("/cancelSignUp")
	public void cancelSignUp(int va_id, int resident_id, HttpServletResponse response) throws ParseException, IOException{
		PrintWriter out = response.getWriter();
		T_Va_Planning SignUp = null;
		if((SignUp = planningVaccineService.select(resident_id, va_id)) != null){
			planningVaccineService.delete(resident_id, va_id);
			out.write("ok");
			return;
		}
		out.write("failed");
	}
	
	@RequestMapping("/smsSendAction")
	public void smsSend(int a, int b, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		T_Resident re = residentManagerService.QueryUserById(a);
		T_Va_Planning SignUp = planningVaccineService.select(a, b);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = sdf.parse(sdf.format(SignUp.getVa_date()));
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date1);
		calendar.add(Calendar.DATE,3);
		date1 = calendar.getTime();
		T_Vaccinum vaccine = vaccineService.selectVaccineById(b);
		
		String apikey = "1d5f190a30d0331b94fbde35ebe616eb";
		String mobile = URLEncoder.encode(re.getResident_telephone(),MessageManagerController.getENCODING());
		String text = "【居民计划免疫】尊敬的"+re.getT_resident_detail().getResident_name()+"，请在"+sdf.format(date1)+"之前前往"+SignUp.getVa_address()+"接种"+vaccine.getVa_name()+"。";
		System.out.println(MessageManagerController.sendSms(apikey, text, mobile));
		out.write("ok");
	}
	
	@RequestMapping("/ajax_GetNotice")
	@ResponseBody
	public Page<T_Va_Planning> getNotice(){
		Page<T_Va_Planning> notice = new Page<T_Va_Planning>();
		notice.setAllPageNum(Math.ceil(planningVaccineService.countNum()/4));
		notice.setCurrentPage(1);
		notice.setPageRowNum(4);
		notice.setObjList(planningVaccineService.selectNotice(0,4));
		return notice;
	}
	
	@RequestMapping("/NoticePageTurn")
	@ResponseBody
	public Page<T_Va_Planning> noticePageTurn(double allPageNum,int currentPage,int pageRowNum){
		Page<T_Va_Planning> notice = new Page<T_Va_Planning>();
		notice.setAllPageNum(allPageNum);
		notice.setCurrentPage(currentPage);
		notice.setPageRowNum(pageRowNum);
		notice.setObjList(planningVaccineService.selectNotice((currentPage-1)*4,4));
		return notice;
	}
	
	@RequestMapping("/ManagerPlanningVaccine")
	public void managerPlanning(int a,int b, HttpServletResponse response) throws IOException, ParseException{
		PrintWriter out = response.getWriter();
		planningVaccineService.delete(a,b);
		
		//增加已通知条目
		T_Notice notice = new T_Notice();
		notice.setResident_id(a);
		notice.setVa_id(b);
		notice.setVa_style("暂无");
		notice.setSended(1);
		notice.setVa_comment("暂无");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = sdf.parse(sdf.format(new Date()));
		java.sql.Date date = new java.sql.Date(date1.getTime());
		
		//绑定发送时间
		notice.setSend_time(date);
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date1);
		calendar.add(Calendar.DATE,3);
		date1 = calendar.getTime();
		java.sql.Date dated = new java.sql.Date(date1.getTime());
		
		//绑定截止时间
		notice.setVa_deadline(dated);
		noticeService.insert(notice);
		out.write("1");
	}
	
	@RequestMapping("/GenerateLeftlets")
	public void generateLeftlets(int resident_id,int va_id, HttpServletResponse response,HttpServletRequest request) throws Exception{
		T_Resident resident = new T_Resident();
		
		resident = residentManagerService.QueryUserById(resident_id);
		request.setAttribute("resident_name", resident.getT_resident_detail().getResident_name());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(resident.getT_resident_detail().getBirth_date());
		request.setAttribute("birth_date", date);
		request.setAttribute("resident_homeplace", resident.getT_resident_detail().getResident_homeplace());
		request.setAttribute("resident_address", resident.getT_resident_detail().getResident_address());
		
		T_Vaccinum vaccine = vaccineService.selectVaccineById(va_id);
		request.setAttribute("va_name", vaccine.getVa_name());
		
		T_Va_Planning plan = planningVaccineService.select(resident_id,va_id);
		request.setAttribute("va_address", plan.getVa_address());
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = sdf1.parse(sdf1.format(new Date()));
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date1);
		calendar.add(Calendar.DATE,3);
		date1 = calendar.getTime();
		String va_deadline = sdf1.format(date1);
		request.setAttribute("va_deadline", va_deadline);
		RequestDispatcher re = request.getRequestDispatcher("/WEB-INF/jsp/NoticeLeftlets.jsp");
		re.forward(request, response);
	}
}
