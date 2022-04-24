package com.simmons.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simmons.model.CartDao;
import com.simmons.model.CartDto;
import com.simmons.model.MemberDao;
import com.simmons.model.MemberDto;
import com.simmons.util.ScriptWriter;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	CartDao cartDao;
	
	@RequestMapping("/Login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/LoginProcess")
	public void loginProcess(MemberDto _memberDto, HttpServletResponse response, HttpSession session) {
		MemberDto memberDto = memberDao.getLoggedMember(_memberDto);
		if(memberDto!=null) {
			ScriptWriter.alertAndNext(response, memberDto.getName()+"님 로그인되었습니다.", "../");
			session.setAttribute("loggedMember", memberDto);
			session.setAttribute("loggedID", memberDto.getId());
			List<CartDto> cartList = cartDao.CartSelectList(memberDto.getId());
			List<CartDto> recentList = cartDao.RecentSelectList(memberDto.getId());
			session.setAttribute("cartList", cartList);
			session.setAttribute("cartCount", cartList.size());
			session.setAttribute("recentList", recentList);
			session.setAttribute("recentCount", recentList.size());
		} else {
			ScriptWriter.alertAndBack(response, "아이디 또는 비밀번호를 확인하세요");
		}
	}
	
	@RequestMapping("/Logout")
	public void logout(HttpSession session, HttpServletResponse response) {
		session.invalidate();
		ScriptWriter.alertAndNext(response, "로그아웃되었습니다", "../");
	}
	
	@RequestMapping("/Join")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping("/JoinProcess")
	public void joinProcess(MemberDto memberDto, HttpServletResponse response) {
		String address01 = memberDto.getAddress01(); 
		String address03 = memberDto.getAddress03(); 
		String email01 = memberDto.getEmail01();
		String email02 = memberDto.getEmail02();
		String phone01 = memberDto.getPhone01(); 
		String phone02 = memberDto.getPhone02(); 
		String phone03 = memberDto.getPhone03(); 
		String Hphone01 = memberDto.getHomePhone01(); 
		String Hphone02 = memberDto.getHomePhone02(); 
		String Hphone03 = memberDto.getHomePhone03(); 
		String year = memberDto.getYear(); 
		String month = memberDto.getMonth(); 
		String day = memberDto.getDay(); 
		
		memberDto.setAddress(address01 + address03);
		memberDto.setEmail(email01+"@"+email02);
		memberDto.setPhone(phone01+"-"+phone02+"-"+phone03);
		memberDto.setHomePhone(Hphone01+"-"+Hphone02+"-"+Hphone03);
		memberDto.setBirthday(year+"-"+month+"-"+day);
		
		int result = memberDao.insert(memberDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "회원가입되었습니다", "Login");
		} else {
			ScriptWriter.alertAndBack(response, "회원가입에 실패하였습니다");
		}
	}
}
