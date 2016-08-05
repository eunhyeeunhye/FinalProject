/*
 * 작성자 : 강인영
 * 작성일 : 2016.07.19
 * 내용 : 서비스안내 Controller, 특정 기능은 없고, 단순 페이지 이동만 담당
 * 수정내역 :
 */

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