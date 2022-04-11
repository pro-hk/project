package com.simmons.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simmons.model.CsDao;
import com.simmons.model.FaqDto;
import com.simmons.util.ScriptWriter;

@Controller
@RequestMapping("/cs")
public class CSController {
	@Autowired
	CsDao csDao;
	
	@RequestMapping("/Faq")
	public String faq(Model model) {
		String[] faqCategory = {"회원","상품문의","교환/환불/반품","주문/배송","기타"};
		for(int i = 1; i < faqCategory.length+1; i++) {
			List<FaqDto> faqList0i = csDao.FaqList(faqCategory[i-1]);
			model.addAttribute("faqList0"+i,faqList0i);
		}
		return "/cs/faq";
	}
	
	@RequestMapping("/FaqWrite")
	public String faqWrite() {
		return "/cs/faqWrite";
	}
	
	@RequestMapping("/FaqWriteProcess")
	public void faqWriteProcess(FaqDto faqDto, HttpServletResponse response) {
		int result = csDao.FaqWrite(faqDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 등록되었습니다.", "Faq");
		} else {
			ScriptWriter.alertAndBack(response, "글이 등록되지 않았습니다.");
		}
	}
	
	@RequestMapping("/Notice")
	public String notice() {
		return "/cs/notice";
	}
	@RequestMapping("/As")
	public String as() {
		return "/cs/as";
	}
	@RequestMapping("/Qna")
	public String qna() {
		return "/cs/qna";
	}
	@RequestMapping("/Counsel")
	public String counsel() {
		return "/cs/counsel";
	}
}
