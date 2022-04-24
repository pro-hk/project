package com.simmons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/factorium")
public class FactoriumController {
	@RequestMapping("/Intro")
	public String intro() {
		return "factorium/intro";
	}
	@RequestMapping("/Rnd")
	public String rnd() {
		return "factorium/rnd";
	}
	@RequestMapping("/Terrace")
	public String terrace() {
		return "factorium/terrace";
	}
	@RequestMapping("/Come")
	public String come() {
		return "factorium/come";
	}
	@RequestMapping("/RndZoning")
	public String rndZoing() {
		return "factorium/rndZoning";
	}
	@RequestMapping("/RndLayering")
	public String rndLayering() {
		return "factorium/rndLayering";
	}
}
