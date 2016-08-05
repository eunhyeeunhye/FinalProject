/*
 * 작성자 : 이현호
 * 작성일 : 2016.07.19
 * 내용 : Home 페이지로 이동하는 Controller
 * 수정내역 : 2016.08.04 Home 페이지로 이동 할 때 공지사항, 동아리 글 호출되도록 수정
 */

package com.babjo.prjfinal.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.babjo.prjfinal.service.BoardService;
import com.babjo.prjfinal.service.MemberService;
import com.babjo.prjfinal.service.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private NoticeService service;
	
	@Autowired
	private BoardService service2;
	
	@Autowired
	private MemberService service3;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		model.addAttribute("noticeList", service.getNoticeList()); // 공지사항
		model.addAttribute("clubList", service2.list()); // 동아리 글
		if(!service2.list().isEmpty()){
			ArrayList<String> list = new ArrayList<String>();
			for(int i=0; i<service2.list().size(); i++){
				list.add(service3.getWriter(service2.list().get(i).getM_code()));
			}
			model.addAttribute("writer", list); // 동아리 글 작성자 이름
		}
		
		return "home"; 
	}
	
}
