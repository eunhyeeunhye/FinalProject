/*
 * 작성자 : 김정훈
 * 작성일 : 2016.07.24
 * 내용 : 자전거 대여/반납관련 Controller
 * 수정내역 : 2016.07.25 자전거 반납기능 추가
 */
package com.babjo.prjfinal.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.babjo.prjfinal.domain.BicycleVO;
import com.babjo.prjfinal.domain.PaymentVO;
import com.babjo.prjfinal.domain.RentVO;
import com.babjo.prjfinal.service.BicycleService;
import com.babjo.prjfinal.service.MemberService;



/**
 * Handles requests for the application home page.
 */
@Controller
public class BicycleController {
	
	@Inject
	private BicycleService service;
	
	@Autowired
	private MemberService service2;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@ModelAttribute RentVO vo, Model model) throws Exception {
		model.addAttribute("rentVO", service.renting(vo));
		
		List<PaymentVO> list = service2.payList(vo.getM_code());
		Date p_date = list.get(0).getP_date();
		Date date = new Date();
		int usedate = 0;
		
		if(list.get(0).getUsedate().equals("365")){
			usedate = 365;
		}
		else if(list.get(0).getUsedate().equals("30")){
			usedate = 30;
		}
		else if(list.get(0).getUsedate().equals("7")){
			usedate = 7;
		}
		
		String result = null;
		if(date.compareTo(p_date) > usedate){
			result = "1";
		}
		else{
			result = "2";
		}

		model.addAttribute("result", result);
		return "/bicycle/search";
	}
	
	
	@RequestMapping(value = "/confirm")
	public String confirm(@ModelAttribute BicycleVO vo, Model model) throws Exception {
		/* 현재시간 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		//System.out.println(vo.getS_code());
		
		
		model.addAttribute("time", format.format(date));
		model.addAttribute("info", service.bicycleInfo(vo));
		
		return "/bicycle/pop_confirm";
	}
	
	@RequestMapping(value = "/state")
	public String state(@ModelAttribute RentVO vo, Model model) throws Exception{
		//System.out.println(vo.getM_code());
		
		//List<RentVO> rvo = service.renting(vo);
		//System.out.println(rvo.get(0).getM_name());
		model.addAttribute("renting", service.renting(vo));
		return "/bicycle/state";
	}
	
	@RequestMapping(value = "/rentbicycle")
	public String rentbicycle(@ModelAttribute RentVO vo, Model model) throws Exception {
		//System.out.println(vo.getR_date());
		//System.out.println(vo.getS_location());
		//System.out.println(vo.getB_code());
		
		service.rentinfo(vo);
		service.rentbicycle(vo.getB_code());
		
		return "/bicycle/rentbicycle";
	}
	
	@RequestMapping(value = "/turnin")
	public String turnin(int m_code, int b_code) throws Exception {
		//System.out.println(vo.getM_code());
		//System.out.println(vo.getB_code());
		
		service.turnin(m_code);
		service.turninbicycle(b_code);
		
		return "redirect:/member/uselist?m_code=" + m_code;
	}
	
}
