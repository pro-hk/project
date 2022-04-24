package com.simmons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EtcController {
	@RequestMapping("/Gallery/")
	public String gallery() {
		return "etc/gallery";
	}
	@RequestMapping("/Map/")
	public String map() {
		return "etc/map";
	}
}
