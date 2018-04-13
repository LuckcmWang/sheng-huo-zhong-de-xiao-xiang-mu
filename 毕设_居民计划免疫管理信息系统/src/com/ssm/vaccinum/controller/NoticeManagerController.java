package com.ssm.vaccinum.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.vaccinum.pojo.T_Notice;
import com.ssm.vaccinum.service.NoticeService;
import com.ssm.vaccinum.vo.Page;

@Controller
public class NoticeManagerController {
	
	@Resource
	private NoticeService noticeService;
	
	@RequestMapping("/ajax_GetNoticed_PreVaccine")
	@ResponseBody
	public Page<T_Notice> getNotice(){
		Page<T_Notice> notice = new Page<T_Notice>();
		notice.setAllPageNum(Math.ceil(noticeService.countNum()/4));
		notice.setCurrentPage(1);
		notice.setPageRowNum(4);
		notice.setObjList(noticeService.selectNotice(0,4));
		return notice;
	}
	
	@RequestMapping("/NoticePageTurn_PreVaccine")
	@ResponseBody
	public Page<T_Notice> noticePageTurn(double allPageNumNotice,int currentPageNotice,int pageRowNumNotice){
		Page<T_Notice> notice = new Page<T_Notice>();
		notice.setAllPageNum(allPageNumNotice);
		notice.setCurrentPage(currentPageNotice);
		notice.setPageRowNum(pageRowNumNotice);
		notice.setObjList(noticeService.selectNotice((currentPageNotice-1)*4,4));
		return notice;
	}
	
}
