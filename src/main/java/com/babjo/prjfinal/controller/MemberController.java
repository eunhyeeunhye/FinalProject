package com.babjo.prjfinal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.babjo.prjfinal.domain.GroupVO;
import com.babjo.prjfinal.domain.MemberVO;
import com.babjo.prjfinal.domain.PaymentVO;
import com.babjo.prjfinal.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Inject
	private MemberService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(){
		return "member/login";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest req){
		req.getSession().invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/doLogin", method=RequestMethod.POST)
	public String doLogin(String m_id, String m_pw, HttpServletRequest req, Model model) throws Exception{
		try{
			MemberVO member = service.doLogin(m_id, m_pw);
			if(member == null){
				String str = "fail";
				model.addAttribute("login", str);
				return "member/login";
			}
			WebUtils.setSessionAttribute(req, "member", member);
		}
		catch(Exception e){
			return "member/login";
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signup(){
		return "member/signup";
	}
	
	@RequestMapping(value="/doSignup", method=RequestMethod.POST)
	public String doSignup(@ModelAttribute MemberVO member){
		service.doSignup(member);
		return "member/login";
	}
	
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public void idCheck(String m_id, HttpServletResponse resp){
		String result = null;
		
		if(service.idCheck(m_id) == null){
			result = "yes";
		}
		else{
			result = "no";
		}
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		
		try{
			out = resp.getWriter();
			out.print(json.toString());
		}
		catch(IOException e){
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage(int m_code, Model model){
		if(!service.payList(m_code).isEmpty()){
			List<PaymentVO> list = service.payList(m_code);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			model.addAttribute("p_date", format.format(list.get(0).getP_date()));
			model.addAttribute("payList", list);
		}
		if(service.myClub1(m_code) != null){
			model.addAttribute("myclub1", service.myClub1(m_code));
		}
		if(service.myClub2(m_code) != null){
			model.addAttribute("myclub2", service.myClub2(m_code));
		}
		
		model.addAttribute("myMileage", service.myMileage(m_code));
		
		return "member/mypage";
	}
	
	@RequestMapping(value="/doupdate", method=RequestMethod.POST)
	public String doUpdate(@ModelAttribute MemberVO member, HttpServletRequest req){
		service.doUpdate(member);
		req.getSession().invalidate();
		return "member/login";
	}
	
	@RequestMapping(value="/uselist", method=RequestMethod.GET)
	public String uselist(int m_code, Model model){
		model.addAttribute("useList", service.useList(m_code));
		return "member/uselist";
	}
	
	@RequestMapping(value="/paylist", method=RequestMethod.GET)
	public String paylist(int m_code, Model model){
		if(!service.payList(m_code).isEmpty()){
			List<PaymentVO> list = service.payList(m_code);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			ArrayList<String> list2 = new ArrayList<String>();
			for(int i=0; i<list.size(); i++){
				list2.add(format.format(list.get(i).getP_date()));
			}
			model.addAttribute("p_date", list2);
			model.addAttribute("payList", list);
		}
		return "member/paylist";
	}
}
