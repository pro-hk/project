package com.simmons.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simmons.model.CartDao;
import com.simmons.model.CartDto;
import com.simmons.model.MemberDao;
import com.simmons.model.MemberDto;
import com.simmons.util.ScriptWriter;

@Component
@RequestMapping("/member")
public class MemberController {
	@Autowired
	CartDao cartDao;
	
	@Autowired
	MemberDao memberDao;

	@Autowired
	MemberDto memberDto;
	
	@Autowired
	MemberDto loggedMemberDto;
	
	@Autowired
	MemberDto DeliveryCheckSimmonsDto;
	
//	회원가입	
	@GetMapping("/Join")
	public String join(HttpServletRequest request) {
		return "member/join";
	}

	@PostMapping("/JoinProcess")
	public void joinProcess(MemberDto memberDto ,HttpServletResponse response,HttpSession session) throws Exception {
		if(memberDto.getMarried()==null) memberDto.setMarried("미선택");
		if(memberDto.getSms()==null) memberDto.setSms("미선택");
		if(memberDto.getEvent()==null) memberDto.setEvent("미선택");
		if(memberDto.getDelivery()==null) memberDto.setDelivery("미선택");
		
		int result = memberDao.insertMember(memberDto);
		if(result>0) {
			session.setAttribute("sessionMemberDto", memberDto);
			ScriptWriter.alertAndNext(response, "회원가입이 되었습니다", "../member/JoinSuccess");
		} else {
			ScriptWriter.alertAndBack(response, "시스템 오류입니다.");
		}
	}
	
	//회원가입 성공시 정보 뿌려주는 것
	@GetMapping("/JoinSuccess")
	public String joinSuccessProcess() {
		return "member/joinNext";
	}
	
	//로그인
	@GetMapping("/Login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/LoginProcess")
	public void loginProcess(MemberDto memberDto,HttpSession session, HttpServletResponse response) throws Exception {
		loggedMemberDto = memberDao.loginMember(memberDto);
		if(loggedMemberDto!=null) {
			session.setAttribute("loggedMemberDto", loggedMemberDto);
			session.setAttribute("loggedId", loggedMemberDto.getId());
			session.setAttribute("loggedName", loggedMemberDto.getName());
			session.setAttribute("phone", loggedMemberDto.getPhone01()+"-"+loggedMemberDto.getPhone02()+"-"	+loggedMemberDto.getPhone03());
			session.setAttribute("email", loggedMemberDto.getEmail01()+"@"+loggedMemberDto.getEmail02());
			List<CartDto> cartList = cartDao.CartSelectList(memberDto.getId());
			List<CartDto> recentList = cartDao.RecentSelectList(memberDto.getId());
			session.setAttribute("cartList", cartList);
			session.setAttribute("cartCount", cartList.size());
			session.setAttribute("recentList", recentList);
			session.setAttribute("recentCount", recentList.size());
			ScriptWriter.alertAndNext(response, "로그인 되었습니다", "../");
		} else {
			ScriptWriter.alertAndBack(response, "시스템 오류 입니다");
		}
	}
	
	@RequestMapping("/Logout")
	public void logout(HttpSession session, HttpServletResponse response) {
		session.invalidate();
		ScriptWriter.alertAndNext(response, "로그아웃되었습니다", "../");
	}
	
	//마이페이지 회원정보 수정 비밀번호 입력창
	@GetMapping("/PwConfirm")
	public String pwConfirm(HttpServletRequest request) {
		return "member/pwConfirm";
	}
	
	@PostMapping("/PwConfirmProcess")
	public void pwConfirmProcess (MemberDto memberDto, HttpServletResponse response, HttpSession session) throws Exception {
		MemberDto pwConfirm = memberDao.pwConfirm(memberDto);
		if(pwConfirm!=null) {
			ScriptWriter.alertAndNext(response, "확인되었습니다", "../member/Info");
		} else {	
			ScriptWriter.alertAndBack(response, "비밀번호를 다시 입력해 주세요");
		}
	}
	
	//마이페이지 회원정보 수정 
	@GetMapping("/Info")
	public String infoMemberDto() {
		return "member/info";
	}
	
	@PostMapping("/InfoProcess")
	public void infoMemberDtoProcess (MemberDto memberDto, HttpServletResponse response) throws Exception {
		if(memberDto.getMarried()==null) memberDto.setMarried("미선택");
		if(memberDto.getSms()==null) memberDto.setSms("미선택");
		if(memberDto.getEvent()==null) memberDto.setEvent("미선택");
		if(memberDto.getDelivery()==null) memberDto.setDelivery("미선택");
		
		int infoMemberDto = memberDao.updateMember(memberDto);
		if(infoMemberDto>0) {
			ScriptWriter.alertAndNext(response, "확인되었습니다", "../member/Info");
		} else {
			ScriptWriter.alertAndBack(response, "비밀번호를 다시 입력해 주세요");
		}
	}
	
	
	//정보변경 페이지중 비밀번호 변경	(ajax)
	@RequestMapping("/UpdatePw")
	@ResponseBody
	public int updatePw(MemberDto memberDto, HttpSession session,HttpServletRequest request) {
		System.out.println("ps=="+request.getParameter("password"));
		//memberDto.setPassword(request.getParameter("password"));
	//	memberDto.setId((String) session.getAttribute("x"));
		int result = memberDao.updatePw(memberDto);
		return result;
	}
	
	//계정삭제
	@GetMapping("/Delete")
	public String deleteMember(HttpServletRequest request) {
		return "member/delete";
	}
	
	@PostMapping("/DeleteProcess")
	public void deleteMemberProcess(HttpServletResponse response,HttpSession session) throws Exception{
	MemberDto deleteInfo = (MemberDto)session.getAttribute("loggedMemberDto");	
	int result = memberDao.deleteMember(deleteInfo);
	if(result>0) {
			ScriptWriter.alertAndNext(response, "계정이 삭제되었습니다", "../");
		}
	}
	
	@GetMapping("/Main")
	public String Main() {
		return "member/main";
	}
	
	@PostMapping("/ChangeGradeProcess")
	public void ChangeGradeProcess(MemberDto memberDto,HttpServletResponse response,HttpSession session) throws Exception {
		memberDto.setId((String) session.getAttribute("loggedMemberDto"));
		int result = memberDao.changeGrade(memberDto);
		if(result>0) {
			ScriptWriter.alertAndNext(response, "회원등급이 변경되었습니다", "../member/Main");
		} else {
			ScriptWriter.alertAndBack(response, "회원등급 변경 실패");
		}
	}
	
	@GetMapping("/MyPage")
	public String MyPage() {
		return "member/order";
	}
	
	@GetMapping("/Wish")
	public String Wish(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loggedId");
		List<CartDto> wishList = cartDao.WishSelectList(id);
		System.out.println("wishList=="+wishList);
		if(wishList!=null) {
			model.addAttribute("wishList", wishList);
		}
		return "member/wish";
	}
	
	@PostMapping("/IdCheck")
	@ResponseBody
	public int IdCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		int result  = 0 ;
		result = memberDao.IdCheck(id);
		return result;
	}
}
