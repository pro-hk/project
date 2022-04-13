package com.simmons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/collection")
public class CollectionController {
	@RequestMapping("/Beautyrest")
	public String beautyrest() {
		return "collection/beautyrest";
	}
	
	@RequestMapping("/N32")
	public String n32() {
		return "collection/n32";
	}
	
	@RequestMapping("/Kenosha")
	public String kenosha() {
		return "collection/kenosha";
	}
}
