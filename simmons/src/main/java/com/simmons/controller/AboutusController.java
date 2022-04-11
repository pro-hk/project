package com.simmons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/aboutus")
public class AboutusController {
	@RequestMapping("/Heritage")
	public String heritage() {
		return "/aboutus/heritage";
	}
	@RequestMapping("/MediaTvc")
	public String mediaTvc() {
		return "/aboutus/mediaTvc";
	}
	@RequestMapping("/MediaPrint")
	public String mediaPrint() {
		return "/aboutus/mediaPrint";
	}
	@RequestMapping("/MediaArticle")
	public String mediaArticle() {
		return "/aboutus/mediaArticle";
	}
	@RequestMapping("/Hotel")
	public String hotel() {
		return "/aboutus/hotel";
	}
}
