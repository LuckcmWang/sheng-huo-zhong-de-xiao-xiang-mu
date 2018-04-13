package com.ssm.vaccinum.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.vaccinum.pojo.T_Resident;
import com.ssm.vaccinum.pojo.T_Resident_Detail;
import com.ssm.vaccinum.service.ResidentManagerService;
import com.ssm.vaccinum.vo.Page;

@Controller
public class ResidentManagerController {
	
	@Resource
	private ResidentManagerService residentManagerService;
	
	/**
	 * 根据帐号，密码查询用户是否可以登录
	 * @param login_name
	 * @param login_password
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/UserLogin.do")
	public void UserLogin(String login_name, String login_password, HttpServletRequest request, HttpServletResponse response,Model mode) throws Exception {
		T_Resident resident = null;
		if (login_name != null && !"".equals(login_name) && login_password != null && !"".equals(login_password)
				&& (resident = residentManagerService.UserLogin(login_name, login_password)) != null) {
			if (residentManagerService.selectDetailCount(resident.getResident_id()) != 0){
				resident = residentManagerService.QueryUserById(resident.getResident_id());
				request.getSession().setAttribute("currentResident", resident);
				request.getRequestDispatcher("/WEB-INF/jsp/UserDetail.jsp").forward(request, response);
				return;
			}
			T_Resident_Detail detail = new T_Resident_Detail();
			detail.setResident_id(resident.getResident_id());
			detail.setResident_name("暂无");
			detail.setResident_sex("暂无");
			detail.setBirth_date(new Date());
			detail.setResident_address("暂无");
			detail.setResident_homeplace("暂无");
			residentManagerService.insertDetail(detail);
			resident = residentManagerService.QueryUserById(resident.getResident_id());
			request.getSession().setAttribute("currentResident", resident);
			request.getRequestDispatcher("/WEB-INF/jsp/UserDetail.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("/WEB-INF/jsp/UserLogin.jsp").forward(request, response);
	}
	
	@RequestMapping("/ModDetail.do")
	public void updateDetail(int resident_id, String resident_name, String resident_sex, String birth_date, String resident_address, 
			String resident_telephone, String resident_email, String resident_idnumber, String resident_homeplace, HttpServletRequest request,HttpServletResponse response) throws Exception {
		T_Resident_Detail detail = new T_Resident_Detail();
		detail.setResident_id(resident_id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(birth_date);
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		detail.setBirth_date(date1);
		detail.setResident_name(resident_name);
		detail.setResident_address(resident_address);
		detail.setResident_homeplace(resident_homeplace);
		detail.setResident_sex(resident_sex);
		residentManagerService.updateDetail(detail);
		
		T_Resident resident = new T_Resident();
		resident.setResident_id(resident_id);
		resident.setResident_telephone(resident_telephone);
		resident.setResident_idnumber(resident_idnumber);
		resident.setResident_email(resident_email);
		residentManagerService.UpdateUserInfo(resident);
		
		resident = residentManagerService.QueryUserById(resident_id);
		request.getSession().setAttribute("currentResident", resident);
		request.getRequestDispatcher("/WEB-INF/jsp/UserDetail.jsp").forward(request, response);
	}
	
	@RequestMapping("/UserDetailPage.do")
	public String  Detail(){
		return "UserDetail";
	}
	
	@RequestMapping(value="/ajax_AccoutNumCheak", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public void cheakRepeation(@RequestParam String login_name, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		Map<String, Boolean> map = new HashMap<>();
		ObjectMapper mapper = new ObjectMapper();
		String resultString = "";
		if(login_name != null && !"".equals(login_name)
				&& residentManagerService.selectUser(login_name) == null){
			map.put("valid", true);
			resultString = mapper.writeValueAsString(map);
			out.write(resultString);
			return;
		}
		map.put("valid", false);
		resultString = mapper.writeValueAsString(map);
		out.write(resultString);
	}
	
	@RequestMapping("/ajax_Regist")
	public void ResidentRegist(String login_name, String login_password, String resident_telephone, String resident_email, 
			String resident_idnumber, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		if(login_name != null && !"".equals(login_name) && login_password != null && !"".equals(login_password)){
			T_Resident resident = new T_Resident();
			resident.setLogin_name(login_name);
			resident.setLogin_password(login_password);
			resident.setResident_telephone(resident_telephone);
			resident.setResident_email(resident_email);
			resident.setResident_idnumber(resident_idnumber);
			residentManagerService.insertUser(resident);
			out.write("1");
			return;
		}
		out.write("0");
	}
	
	@RequestMapping("/ajax_GetResident")
	@ResponseBody
	public Page<T_Resident> GetResident(HttpServletRequest request,HttpServletResponse response){
		Page<T_Resident> residents = new Page<T_Resident>();
		residents.setAllPageNum(Math.ceil(residentManagerService.selectNum()/10));
		residents.setCurrentPage(1);
		residents.setPageRowNum(10);
		residents.setObjList(residentManagerService.selectAll(0, 10));
		return residents;
	}
	
	@RequestMapping("/ResidentPageTurn")
	@ResponseBody
	public Page<T_Resident> GetSelectResident(String resident_id, double allPageNum, int currentPage, int pageRowNum,HttpServletRequest request,HttpServletResponse response){
		Page<T_Resident> residents = new Page<T_Resident>();
		residents.setAllPageNum(allPageNum);
		residents.setCurrentPage(currentPage);
		residents.setPageRowNum(pageRowNum);
		if(resident_id!=null && !"".equals(resident_id)){
			residents.setObjList(residentManagerService.selectAll(resident_id, (currentPage-1)*10, 10));
			return residents;
		}
		residents.setObjList(residentManagerService.selectAll((currentPage-1)*10, 10));
		return residents;
	}
	
	@RequestMapping("/ResidentDetailSearch")
	@ResponseBody
	public Page<T_Resident> GetSomeResident(String resident_id,HttpServletRequest request,HttpServletResponse response){
		Page<T_Resident> residents = new Page<T_Resident>();
		residents.setAllPageNum(Math.ceil(residentManagerService.selectNum(resident_id)/10));
		residents.setCurrentPage(1);
		residents.setPageRowNum(10);
		residents.setObjList(residentManagerService.selectAll(resident_id, 0, 10));
		return residents;
	}
	
	@RequestMapping("/UserQuery")
	public String UserQuery(T_Resident resident, Page<T_Resident> page, Model model) throws Exception {
		if(page.getCurrentPage()==null||page.getCurrentPage()==0){
			page.setCurrentPage(1);
			page.setPageRowNum(10);
		}
		
		page = residentManagerService.QueryUser(resident,page);
		
		model.addAttribute("userPage", page);
		return "UserQuery";
	}
	
	@RequestMapping("/UserQuery_Ajax")
	public String UserQuery_Ajax(T_Resident resident, Page<T_Resident> page, Model model) throws Exception {
		if(page.getCurrentPage()==null||page.getCurrentPage()==0){
			page.setCurrentPage(1);
			page.setPageRowNum(2);
		}
		
		page = residentManagerService.QueryUser(resident,page);
		
		model.addAttribute("userPage", page);
		return "UserQuery";
	}
	
	@RequestMapping("/UserInfoUpdatePage")
	public String ShowUpdateUser(int userid, Model model) throws Exception{
		T_Resident resident = residentManagerService.QueryUserById(userid);
		model.addAttribute("user", resident);
		return "UserInfoUpdate";
	}
	
	@RequestMapping("/UserLoginPage.do")
	public String UserLoginPage() {
		return "UserLogin";
	}
	
	@RequestMapping("/UserRegPage.do")
	public String UserRegPage() {
		return "UserReg";
	}
	
	@RequestMapping("/redirectToForm.do")
	public String redirectToForm() {
		return "redirect:UserLoginPage.do";
	}
	
	@RequestMapping("/redirectToForm1.do")
	public String redirectToForm1() {
		return "redirect:/test/toForm.do";
	}
	
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
}
