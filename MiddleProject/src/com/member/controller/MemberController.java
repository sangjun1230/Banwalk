package com.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.biz.MemberBiz;
import com.member.vo.MemberVo;
import com.pet.vo.PetVo;

@Controller("memberController")
public class MemberController {

	@Autowired
	MemberBiz memberBiz;

	// select All
	@RequestMapping("/select.do")
	public String my_select(Model m) {
		List<MemberVo> all = memberBiz.getAll();
		m.addAttribute("all", all);
		return "/WEB-INF/View/Member/Memberlist.jsp";
	}

	// insert
	@RequestMapping(value = "/insert.do", method = RequestMethod.GET)
	public String MyInsert() {
		return "/WEB-INF/View/Member/SignUp.jsp";
	}

	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String MyInsert(@ModelAttribute("memberVo") MemberVo memberVo) {
		int res = memberBiz.getInsert(memberVo);
		return "redirect:/index.jsp";
	}

	// delete
	@RequestMapping("/delete.do")
	   public String my_delete(@RequestParam("del_name") String del_name, HttpSession session) {
	      System.out.println("삭제 : " + del_name );
	      int res = memberBiz.getDelete(del_name);
	      System.out.println("삭제 : " + del_name + res);
	      
	      if (res > 0) {
	         System.out.println("삭제성공");
	         session.invalidate();
	         return "/index.jsp";
	      }
	      return "";
	   }
	


	// find
	@RequestMapping(value = "/memberfind.do", method = RequestMethod.GET)
	public ModelAndView MyFind(@RequestParam("id") String id, HttpSession session) {
		MemberVo vo = (MemberVo) session.getAttribute("member");
		ModelAndView mav = new ModelAndView("/WEB-INF/View/Member/MemberUp.jsp", "res", vo);
		return mav;
	}

	// update

	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String MyUpdate() {
		return "/WEB-INF/View/Member/MemberUp.jsp";
	}

	@RequestMapping(value="/update.do" , method = RequestMethod.POST)
	public String MyUpdate(@ModelAttribute("member") MemberVo memberVo, HttpSession session) {
		
		 int r = memberBiz.getUpdate(memberVo);
		 
		 if(r > 0) 
			 session.setAttribute("member", memberVo);
			 return "redirect:/index.jsp";
	}

	// login
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String MyLogin() {
		return "/WEB-INF/View/Member/login.jsp";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView MyLogin(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session) {
		MemberVo login_input = new MemberVo();
		login_input.setId(id);
		login_input.setPw(pw);
		MemberVo login_output = memberBiz.getLogin(login_input);
		System.out.println("로그인 결과 : " + login_output);
		session.setAttribute("member", login_output);
		ModelAndView mav = new ModelAndView("forward:/index.jsp", "member", login_output);
		return mav;
	}

	// logout
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView MyLogout(HttpServletRequest req) {
		req.getSession().invalidate();
		return new ModelAndView("redirect:/index.jsp");
	}

	// getPwcheck
		@RequestMapping(value = "/pw.do", method = RequestMethod.GET)
		public String MyPw() {
			return "/WEB-INF/View/Member/PwCerti.jsp";
		}
		
		@RequestMapping(value = "/pw.do", method = RequestMethod.POST)
		public String MyPw(@RequestParam("id") String id, @RequestParam("email") String email, HttpSession session) {
			MemberVo findpw = new MemberVo();
			findpw.setId(id);
			findpw.setEmail(email);
			
			MemberVo findpw1 = memberBiz.getPwcheck(findpw);
			session.setAttribute("member", findpw1);
			return "/WEB-INF/View/Member/PwReturn.jsp";
		}

		// getIdcheck
		
		
		@RequestMapping(value = "/findid.do", method = RequestMethod.GET)
		public String MyId() {
			return "/WEB-INF/View/Member/IdFind.jsp";
		}
		
		@RequestMapping(value = "/findid.do", method = RequestMethod.POST)
		public String MyId(@RequestParam("u_name") String u_name, @RequestParam("email") String email, HttpSession session) {
			MemberVo findid = new MemberVo();
			findid.setU_name(u_name);
			findid.setEmail(email);
			
			MemberVo findid1 = memberBiz.getIdcheck(findid);
			session.setAttribute("member", findid1);

			return "/WEB-INF/View/Member/IdReturn.jsp";
		}
	}


