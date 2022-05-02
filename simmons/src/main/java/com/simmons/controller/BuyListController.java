package com.simmons.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simmons.model.BuyListDao;
import com.simmons.model.BuyListDto;


@Controller
@RequestMapping("/buyList")
public class BuyListController {
	
	@Autowired
	BuyListDto buyListDto;
	
	@Autowired
	BuyListDao buyListDao;
	
	@Autowired
	BuyListDto result;
	
	
	
	
//	@GetMapping("/buyListInquire")		
//	public String purchase() {
//		return "buyList/purchase";
//	}
//	
//	@PostMapping("/purchaseProcess")		
//	public String purchaseProcess() {
//		
//		
//		return null;
//		
//	}
//	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/buyListInquire")		//비회원조회
	public String buyListInquire() {
		return "buyList/buyListInquire";
	}
	
	@PostMapping("/buyListInquireProcess")		//비회원
	public String buyListInquireProcess(BuyListDto buyListDto, HttpServletResponse response,Model model) throws Exception {
		System.out.println(buyListDto);
		buyListDto.setPhone(buyListDto.getPhone01()+"-"+buyListDto.getPhone02()+"-"+buyListDto.getPhone03());
		buyListDto.setEmail(buyListDto.getEmail01()+"@"+buyListDto.getEmail02());
		result = buyListDao.buyListInquire(buyListDto);
		System.out.println("result===="+result);
		if(result!=null) {
			model.addAttribute("product",result);
		}
		return "buyList/total";	// 뭐가 문제였쬬ㅕ??scrip로 페이지를 바꾸면 값을 전달을 못해... 이제 데이터 흐름 잘 아네... 혁님이 잘 알려주ㅕㅆ어욬ㅋㅋㅋㅋㅋ
	}
	
//	@GetMapping("/memberBuyListInquire")		//회원조회
//	public String memberBuyListInquire() {
//		return "buyList/memberBuyListInquire";
//	}
	
	@GetMapping("/memberBuyListInquire")
	public String memberBuyListInquireProcess(HttpSession session, BuyListDto buyListDto, HttpServletResponse response,Model model) throws Exception {
		buyListDto.setName((String) session.getAttribute("loggedName"));
		result = buyListDao.memberBuyListInquire(buyListDto);
		System.out.println(result);
		model.addAttribute("product",result);
		return "/buyList/memberBuyListInquire";
	}
	
	@GetMapping("/total")
	public String buyList() {
		return "buyList/total";
		
	}
}










