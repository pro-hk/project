package com.simmons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	@RequestMapping("/Login")
	public String login() {
		return "member/login";
	}
	@RequestMapping("/Join")
	public String Join() {
		return "member/join";
	}
}
