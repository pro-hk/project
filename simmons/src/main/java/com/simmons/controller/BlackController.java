package com.simmons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/black")
public class BlackController {
	@RequestMapping("/Black")
	public String black() {
		return "/black/black";
	}
	
	@RequestMapping("/Mattress")
	public String mattress() {
		return "/black/mattress";
	}
	
	@RequestMapping("/Foundation")
	public String foundation() {
		return "/black/foundation";
	}
}
