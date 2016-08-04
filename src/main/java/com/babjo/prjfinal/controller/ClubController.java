package com.babjo.prjfinal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.babjo.prjfinal.domain.BoardVO;
import com.babjo.prjfinal.domain.GroupVO;
import com.babjo.prjfinal.service.BoardService;
import com.babjo.prjfinal.service.GroupService;
import com.babjo.prjfinal.service.MemberService;

@Controller
public class ClubController {

   private static final Logger logger = LoggerFactory.getLogger(ClubController.class);

   @Inject
   private BoardService service;
   @Inject
   private GroupService service2;
   @Autowired
   private MemberService service3;

   @RequestMapping(value = "/open/club", method = RequestMethod.GET)
   private String openClub(Model model) throws Exception {
      model.addAttribute("group", service2.infogroup());
      model.addAttribute("list", service.list());
      if(!service.list().isEmpty()){
			ArrayList<String> list = new ArrayList<String>();
			for(int i=0; i<service.list().size(); i++){
				list.add(service3.getWriter(service.list().get(i).getM_code()));
			}
			model.addAttribute("writer", list);
      }
      return "/club/open";
   }

   @RequestMapping(value = "/myclub/go", method = RequestMethod.GET)
   public String goClub(Model model, @RequestParam("g_code") int g_code, @RequestParam("b_code") int b_code)
         throws Exception {

      model.addAttribute("list2", service.groupboard(g_code, b_code));
      System.out.println("요기 리스트 이게 글 가져와야하는건뎅?" + g_code + "," + b_code);
      
      if(!service.groupboard(g_code, b_code).isEmpty()){
			ArrayList<String> list = new ArrayList<String>();
			for(int i=0; i<service.groupboard(g_code, b_code).size(); i++){
				list.add(service3.getWriter(service.groupboard(g_code, b_code).get(i).getM_code()));
			}
			model.addAttribute("writer", list);
      }
      
      model.addAttribute("group", service2.gboard(g_code));
      System.out.println("이거는 동호회 목록 가져오는고" + g_code);
      model.addAttribute("g_code", g_code);
      //model.addAttribute("m_name",service.memname());
      //System.out.println("mcode" +m_code);

      return "/club/info";
   }

   // 동아리만드는 코드
   @RequestMapping(value = "/make/club", method = RequestMethod.GET)
   private String MakeClub() {
      return "club/estab";
   }

   @RequestMapping(value = "/make/club", method = RequestMethod.POST)
   public String estabClub(GroupVO vo, Model model) throws Exception {
      service2.estab(vo);
      GroupVO vo2 = service2.ginfo(vo.getM_code());
      model.addAttribute("group", vo2);

      logger.info(vo2.getG_code() + "," + vo.getName() + "," + vo.getPurpose());
      return "club/check";
   }

   // 게시판 만드는 코드
   @RequestMapping(value = "/club/make", method = RequestMethod.GET)
   public String makeBoardGet(@RequestParam("g_code") int g_code, Model model) {
      System.out.println("아아" + g_code);
      model.addAttribute("gcode", g_code);
      return "club/make";
   }

   @RequestMapping(value = "/club/make", method = RequestMethod.POST)
   public String makeBoardPost(GroupVO board, Model model) throws Exception {
      service2.make(board);
      System.out.println("게시판 만들어짐" + board.getG_code());
      model.addAttribute("gcode", board.getG_code());
      return "/club/m_check";
   }

   @RequestMapping(value = "/club/write", method = RequestMethod.GET)
   private String writeClubGet(Model model, @RequestParam("g_code") int g_code) {
      model.addAttribute("gcode", g_code);
      System.out.println("쀼" + g_code);
      return "club/write";
   }

   @RequestMapping(value = "/club/write", method = RequestMethod.POST)
   public String writeClubPost(@ModelAttribute BoardVO board) throws Exception {
      System.out.println("아오" + board.getG_code());
      System.out.println("아");
      // System.out.println("야" +board.getG_code());
      GroupVO vo2 = service2.binfo(board.getG_code());
      // model.addAttribute("group", vo2);
      logger.info(vo2.getG_code() + "," + vo2.getB_code());
      board.setB_code(vo2.getB_code());
      service.write(board);
      return "redirect:/myclub/go?g_code=" + vo2.getG_code() + "&b_code=" + vo2.getB_code();
      // return null;
   }

   @RequestMapping(value = "/club/read")
   private void readClub(@RequestParam("bno") int bno, Model model) throws Exception {
      model.addAttribute(service.read(bno));
      if(service.read(bno) != null){
    	  model.addAttribute("writer", service3.getWriter(service.read(bno).getM_code()));
      }
      System.out.println(bno);

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

   @RequestMapping("/club/join")
   public String joinGet(@RequestParam("g_code") int g_code, Model model) throws Exception {
      System.out.println("가입 페이지" + g_code);
      model.addAttribute("g_code", g_code);
      //System.out.println(service2.ginfo(g_code).getName());
      //model.addAttribute("binfo",service2.binfo(g_code).getName());
      return "club/join";

   }

   @RequestMapping(value = "/club/join", method = RequestMethod.POST)
   public String joinPost(@ModelAttribute GroupVO vo, Model model) throws Exception {
      System.out.println(vo.getG_code() + ", " + vo.getM_code());
      model.addAttribute("g_code", vo.getG_code());
      model.addAttribute("b_code", vo.getB_code());
      // System.out.println("가입부분2"+vo.getG_code());
      // System.out.println("가입2" + g_code);
      service2.regist(vo.getG_code(), vo.getM_code());
      // service2.join(vo);
      return "redirect:/myclub/go";
      // return null;
   }

   @RequestMapping(value = "/member/check", method = RequestMethod.POST)
   public void memberCheck(@RequestParam("g_code") int g_code, @RequestParam("m_code") int m_code,
         HttpServletResponse resp) throws Exception {
      String result = null;
      // int g_code = Integer.parseInt(g_code2);
      // int m_code = Integer.parseInt(m_code2);
      System.out.println("꾜" + g_code + ", " + m_code);
      List<GroupVO> memList = service2.memcheck(g_code);
      // System.out.println(memList.get(1).getM_code());

      for (int i = 0; i < memList.size(); i++) {
         if (memList.get(i).getM_code() == m_code) {
            System.out.println("되니");
            result = "yes";
         } else {
            result = "no";
         }

      }
      JSONObject json = new JSONObject();
      json.put("result", result);

      resp.setContentType("text/html;charset=utf-8");
      PrintWriter out;

      try {
         out = resp.getWriter();
         out.print(json.toString());
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
}