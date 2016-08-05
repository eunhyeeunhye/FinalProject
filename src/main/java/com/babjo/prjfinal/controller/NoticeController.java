/*
 * 작성자 : 김성주
 * 작성일 : 2016.07.19
 * 내용 : 고객센터 관련 Controller
 * 수정내역 : 
 */

package com.babjo.prjfinal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.babjo.prjfinal.domain.NoticeVO;
import com.babjo.prjfinal.domain.PagingVO;
import com.babjo.prjfinal.domain.RequestVO;
import com.babjo.prjfinal.service.NoticeService;
import com.babjo.prjfinal.service.RequestService;

@Controller
@RequestMapping("/service/*")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private RequestService rService;
	
	@RequestMapping("notice")
	public String noticeHandler(Integer page, Model model) throws Exception{
		if(page == null){
			page = 1;
		}
		PagingVO pageVO = new PagingVO(service.getNoticeList().size(), page);
		model.addAttribute("noticeList", service.getNoticeList());
		model.addAttribute("pageVO", pageVO);
		return "service/notice";
	}
	
	@RequestMapping("faq")
	public String faqHandler(){
		return "service/faq";
	}
	
	@RequestMapping("request")
	public String requestHandler(Integer page, Integer m_code, Model model) throws Exception{
		if(page == null){
			page = 1;
		}
		if(m_code == null){
			return "member/login";
		}
		PagingVO pageVO = new PagingVO(rService.requestList(m_code).size(), page);
		model.addAttribute("requestList", rService.requestList(m_code));
		model.addAttribute("pageVO", pageVO);
		
		return "service/request";
	}
	
	@RequestMapping("adminRequest")
	public String requestHandler(Integer page, Model model) throws Exception{
		if(page == null){
			page = 1;
		}
		
		PagingVO pageVO = new PagingVO(rService.adminRequestList().size(), page);
		model.addAttribute("requestList", rService.adminRequestList());
		model.addAttribute("pageVO", pageVO);
		
		return "service/request";
	}
	
	@RequestMapping("requestRead")
	public String requstReadHandler(int r_code, Model model) throws Exception{
		model.addAttribute("request", rService.readRequest(r_code));
		return "service/requestRead";
	}
	
	@RequestMapping("requestWrite")
	public String requestWriteHandler(){
		return "service/requestWrite";
	}
	
	@RequestMapping("requestComplete")
	public String requestCompleteHandler(int m_code, RequestVO vo) throws Exception{
		rService.writeRequest(vo);
		return "redirect:/service/request?m_code=" + m_code;
	}
	
	@RequestMapping("requestAnswer")
	public String requestAnswerHandler(int r_code, Model model) throws Exception{
		model.addAttribute("request", rService.readRequest(r_code));
		return "service/requestAnswer";
	}
	
	@RequestMapping("requestAnswerComplete")
	public String requestAnswerCompleteHandler(RequestVO vo) throws Exception{
		rService.writeAnswer(vo);
		return "redirect:/service/adminRequest";
	}
	
	@RequestMapping("noticeRead")
	public String readNoticeHandler(int n_code, Model model) throws Exception{
		model.addAttribute("notice", service.readNotice(n_code));
		return "service/noticeRead";
	}
	
	@RequestMapping("noticeWrite")
	public String writeNoticeHandler(){
		return "service/noticeWrite";
	}
	
	@RequestMapping("noticeComplete")
	public String noticeCompleteHandler(NoticeVO vo) throws Exception{
		service.writeNotice(vo);
		return "redirect:/service/notice";
	}
	
	@RequestMapping("noticeDelete")
	public String noticeDeleteHandler(int n_code) throws Exception{
		service.deleteNotice(n_code);
		return "redirect:/service/notice";
	}
}
