package com.babjo.prjfinal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/service_guide/*")
public class InformationController {

	@RequestMapping(value="/AboutUs")
	public void aboutUs(){ //GreenCycle이란? 페이지로 이동
	}
	
	@RequestMapping(value="/HowToUse")
	public void howToUse(){ //이용방법 페이지로 이동
	}
	
}