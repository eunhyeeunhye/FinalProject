package com.babjo.prjfinal.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.babjo.prjfinal.domain.BicycleVO;
import com.babjo.prjfinal.domain.RentVO;
import com.babjo.prjfinal.service.BicycleService;



/**
 * Handles requests for the application home page.
 */
@Controller
public class BicycleController {
	
	@Inject
	private BicycleService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String search() {
		
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
	public String turnin(@ModelAttribute RentVO vo) throws Exception {
		//System.out.println(vo.getM_code());
		//System.out.println(vo.getB_code());
		
		service.turnin(vo.getM_code());
		service.turninbicycle(vo.getB_code());
		
		return "/bicycle/search";
	}
	
}
