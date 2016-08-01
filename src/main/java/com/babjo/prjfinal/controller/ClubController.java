package com.babjo.prjfinal.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.babjo.prjfinal.domain.BoardVO;
import com.babjo.prjfinal.domain.GroupVO;
import com.babjo.prjfinal.service.BoardService;
import com.babjo.prjfinal.service.GroupService;

@Controller
public class ClubController {

	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);

	@Inject
	private BoardService service;
	@Inject
	private GroupService service2;

	@RequestMapping(value = "/open/club", method = RequestMethod.GET)
	private String openClub(Model model) throws Exception {
		model.addAttribute("group", service2.infogroup());
		model.addAttribute("list", service.list());
		// open �������� vo�� �Ѱ��༭ �ű⼭ ���� �Ѱ��� �� �ְ� �ؾ��Ѵ礻�������������������� �� ���������� �׷�������
		// ���������
		return "/club/open";
	}

	@RequestMapping(value = "/myclub/go", method = RequestMethod.GET)
	public String goClub(Model model, @RequestParam("g_code") int g_code, @RequestParam("b_code")int b_code)
			throws Exception {

		model.addAttribute("list2", service.groupboard(g_code, b_code));
		System.out.println(g_code + "," +b_code); // ������� �޾ƿ� �ٵ� ���� ���ҷ����� ������...�ε�ε�
		model.addAttribute("group", service2.gboard(g_code));
		//model.addAttribute("read", service.cboard(g_code, b_code));
		//service.cboard(g_code, b_code);
		return "/club/info";
	}

	@RequestMapping(value = "/club/write", method = RequestMethod.GET)
	private String writeClubGet() {
		return "club/write";
	}

	@RequestMapping(value = "/club/write", method = RequestMethod.POST)
	public String writeClubPost(BoardVO board, RedirectAttributes model, @RequestParam("g_code") int g_code ) throws Exception {
		service.write(board);
		System.out.println(g_code);
		return "redirect:/myclub/go";
		//�� �ۼ��� �Ǵµ� g_code�� ���޾ƿ� �ФФ�
		// ������ �̵��� ����� �ȴ� �ФФФФ�
	}

	@RequestMapping(value = "/club/read")
	private void readClub(@RequestParam("bno") int bno, Model model) throws Exception {
		// model.addAttribute("list", service.list());
		model.addAttribute(service.read(bno));
		System.out.println(bno);
		// return "club/read";
	}

	@RequestMapping(value = "/club/modify")
	private String modifyGet(@RequestParam("bno") int bno, Model model) throws Exception {
		model.addAttribute(service.read(bno));
		return "club/modify";
	}

	@RequestMapping(value = "/club/modify", method = RequestMethod.POST)
	public String modifyPost(BoardVO board, Model model) throws Exception {
		service.modify(board);
		model.addAttribute("bno", board.getBno());
		return "redirect:/club/read";
	}

	@RequestMapping(value = "/club/remove", method = RequestMethod.POST)
	public String delete(@RequestParam("bno") int bno) throws Exception {
		service.remove(bno);
		return "redirect:/myclub/go";
	}

	@RequestMapping(value = "/make/club", method = RequestMethod.GET)
	private String MakeClub() {
		return "club/estab";
	}

	@RequestMapping(value = "/make/club", method = RequestMethod.POST)
	public String estabClub(GroupVO vo, RedirectAttributes model) throws Exception {
		service2.estab(vo);
		logger.info(vo.getM_code() + "," + vo.getName() + "," + vo.getPurpose());
		// model.addFlashAttribute("name", vo.getName());
		return "club/check";
	}

	@RequestMapping("/club/join")
	public String joinGet() {
		return "club/join";

	}

	@RequestMapping(value = "/club/join", method = RequestMethod.POST)
	public String joinPost(GroupVO vo) throws Exception {
		service2.regist(vo);
		return "redirect:/myclub/go";
	}

	@RequestMapping(value = "/club/make", method = RequestMethod.GET)
	public String makeBoardGet() {
		return "club/make";
	}

	@RequestMapping(value = "/club/make", method = RequestMethod.POST)
	public String makeBoardPost(GroupVO board) throws Exception {
		service2.make(board);
		return "/club/m_check";
	}

}