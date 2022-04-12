package com.simmons.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simmons.model.FaqDao;
import com.simmons.model.FaqDto;
import com.simmons.util.ScriptWriter;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	FaqDao faqDao;
	
	@RequestMapping("/")
	public String index() {
		return "manager/index";
	}
	@RequestMapping("/MemberList")
	public String memberList() {
		return "manager/memberList";
	}
	@RequestMapping("/ProductList")
	public String productList() {
		return "manager/productList";
	}
	
	@RequestMapping("/FaqList")
	public String faqList(Model model, HttpServletRequest request) {
		int page;
		if(request.getParameter("page")=="" || request.getParameter("page")==null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int total = faqDao.FaqTotal();
		int listPerPage = 10;
		int lastPage = total / listPerPage + 1;
		
		int startNum = (page - 1) * listPerPage + 1;
		int endNum = page * listPerPage;
		
		List<FaqDto> faqList = faqDao.FaqAllList(startNum, endNum);
		model.addAttribute("faqList", faqList);
		model.addAttribute("lastPage", lastPage);
		
		return "manager/faqList";
	}
	
	@RequestMapping("/FaqWrite")
	public String faqWrite() {
		return "/manager/faqWrite";
	}
	
	@RequestMapping("/FaqWriteProcess")
	public void faqWriteProcess(FaqDto faqDto, HttpServletResponse response) {
		int result = faqDao.FaqWrite(faqDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 등록되었습니다.", "FaqList");
		} else {
			ScriptWriter.alertAndBack(response, "글이 등록되지 않았습니다.");
		}
	}
	
	@RequestMapping("/FaqView")
	public String faqView(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		FaqDto faqDto = faqDao.FaqSelectOne(no);
		if(faqDto!=null) {
			model.addAttribute("faqDto", faqDto);
		}
		
		return "manager/faqView";
	}
	
	@RequestMapping("/NoticeList")
	public String noticeList() {
		return "manager/noticeList";
	}
	
	@RequestMapping("/FaqUpdate")
	public String faqUpdate(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		FaqDto faqDto = faqDao.FaqSelectOne(no);
		if(faqDto!=null) {
			model.addAttribute("faqDto", faqDto);
		}
		
		return "manager/faqUpdate";
	}
	
	@RequestMapping("/FaqUpdateProcess")
	public void faqUpdateProcess(FaqDto faqDto, HttpServletResponse response) {
		int result = faqDao.FaqUpdate(faqDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 수정되었습니다", "FaqView?no="+faqDto.getNo());
		} else {
			ScriptWriter.alertAndBack(response, "글이 수정되지 않았습니다");
		}
	}
	
	@RequestMapping("/FaqDelete")
	public void faqDelete(HttpServletResponse response, HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		int result = faqDao.FaqDelete(no);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 삭제되었습니다", "FaqList");
		} else {
			ScriptWriter.alertAndBack(response, "글이 삭제되지 않았습니다");
		}
	}
}
