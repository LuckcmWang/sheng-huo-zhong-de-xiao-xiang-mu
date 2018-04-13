package com.ssm.vaccinum.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.vaccinum.pojo.T_Journaling;
import com.ssm.vaccinum.pojo.T_Vaccinum;
import com.ssm.vaccinum.service.NoticeService;
import com.ssm.vaccinum.service.PlanningVaccineService;
import com.ssm.vaccinum.service.VaccineService;
import com.ssm.vaccinum.service.VaccinumService;
import com.ssm.vaccinum.vo.Page;


@Controller
public class JournlingManagerController {
	@Resource
	private PlanningVaccineService planningVaccineService;
	
	@Resource
	private NoticeService noticeService;
	
	@Resource
	private VaccinumService vaccinumService;
	
	@Resource
	private VaccineService vaccineService;

	@RequestMapping("/RefreshJournling")
	@ResponseBody
	public List<T_Journaling> getRecord(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<T_Journaling> journals = new ArrayList<T_Journaling>();
		Page<T_Vaccinum> vaccine = new Page<T_Vaccinum>(); 
		vaccine.setObjList(vaccineService.selectVaccineAll());
		for(int i=0;i< vaccine.getObjList().size();i++){
			T_Vaccinum va = new T_Vaccinum();
			va = vaccine.getObjList().get(i);
			T_Journaling journal = new T_Journaling();//java里面存储的都是地址
			journal.setJ_type(va.getVa_name());
			int non = getNonVacAll(va.getVa_id());
			int vac = getValAll(va.getVa_id());
			journal.setNon_num(non+vac);
			journal.setVa_num(vac);
			if(vac+non!=0){
				journal.setVa_ratio(((float)vac/(float)(vac+non))*100);
			}
			journals.add(journal);
		}
		return journals;
	}
	
	@RequestMapping("/addQuestionRequest")
	@ResponseBody
	public List<T_Journaling> getRecordWithCondition(String va_name, String TimeZoneBegin, String TimeZoneEnd, HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<T_Journaling> journals = new ArrayList<T_Journaling>();
		List<T_Journaling> results = new ArrayList<T_Journaling>();
		if(TimeZoneBegin.equals("false") || TimeZoneEnd.equals("false")){
			journals = getRecord(request, response);
			if(!va_name.equals("false")){
				for(int i=0;i< journals.size();i++){
					if(journals.get(i).getJ_type().equals(va_name)){
						results.add(journals.get(i));
					}
				}
				return results;
			}else{
				return journals;
			}
		}else{
			journals = selectRecordWithTimeZone(TimeZoneBegin, TimeZoneEnd);
			if(!va_name.equals("false")){
				for(T_Journaling jo : journals){
					if(jo.getJ_type().equals(va_name)){
						results.add(jo);
					}
				}
				return results;
			}else{
				return journals;
			}
		}
	}
	
	public List<T_Journaling> selectRecordWithTimeZone(String TimeZoneBegin, String TimeZoneEnd){
		List<T_Journaling> journals = new ArrayList<T_Journaling>();
		Page<T_Vaccinum> vaccine = new Page<T_Vaccinum>(); 
		vaccine.setObjList(vaccineService.selectVaccineAll());
		for(T_Vaccinum va : vaccine.getObjList()){
			T_Journaling journal = new T_Journaling();//java里面存储的都是地址
			journal.setJ_type(va.getVa_name());
			int non = getNonVacTimezone(va.getVa_id(),TimeZoneBegin,TimeZoneEnd);
			int vac = getValTimezone(va.getVa_id(),TimeZoneBegin,TimeZoneEnd);
			journal.setNon_num(non+vac);
			journal.setVa_num(vac);
			if(vac+non!=0){
				journal.setVa_ratio(((float)vac/(float)(vac+non))*100);
			}
			journals.add(journal);
		}
		return journals;
	}
	
	public int getNonVacAll(int va_id){
		return planningVaccineService.countPlaningAllMonth(va_id)+noticeService.countNum(va_id);
	}
	
	public int getValAll(int va_id){
		return vaccinumService.countPlanningAllMonth(va_id);
	}
	
	public int getNonVacTimezone(int va_id,String timeBegin,String timeEnd){
		return planningVaccineService.countNonNum(va_id,timeBegin,timeEnd)+noticeService.countNonNum(va_id,timeBegin,timeEnd);
	}
	
	public int getValTimezone(int va_id,String timeBegin,String timeEnd){
		return vaccinumService.countVaccinumWithTimezone(va_id,timeBegin,timeEnd);
	}
	
	public java.sql.Date Str2Date(String month) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(month);
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		return date1;
	}
	
}
