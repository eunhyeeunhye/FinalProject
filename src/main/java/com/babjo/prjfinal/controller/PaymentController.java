package com.babjo.prjfinal.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.babjo.prjfinal.domain.MemberVO;
import com.babjo.prjfinal.domain.PaymentVO;
import com.babjo.prjfinal.service.PaymentService;

@Controller
@RequestMapping("/fare_guide/*")
public class PaymentController {

	@Inject
	private PaymentService service;

	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@RequestMapping(value="/fareGuide")
	public void fareGuide(HttpServletRequest req){//요금안내페이지로 이동
	}
			
	@RequestMapping(value="/payment", method=RequestMethod.GET)
	public String getPayment(HttpServletRequest req, Model model) throws Exception{ 
		//이용권구매 페이지로 이동
		return "/fare_guide/payment";
	}

	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public String pay(@ModelAttribute PaymentVO vo, @ModelAttribute MemberVO member, Model model) throws Exception{ 
		//이용권 구매
		logger.info("vo :" + vo.toString());
		service.pay(vo);
		service.update(member);

		model.addAttribute("payInfo", vo);
		return "/fare_guide/success";
	}	
}
