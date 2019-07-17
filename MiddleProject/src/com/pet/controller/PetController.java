
package com.pet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.vo.MemberVo;
import com.pet.biz.PetBiz;
import com.pet.vo.PetVo;



@Controller("petController")
public class PetController {
	
	@Autowired
	PetBiz petBiz;
	
	@RequestMapping(value="/petselect.do", method=RequestMethod.GET)
	public ModelAndView memberpet_select(HttpSession session) { //, @RequestParam("id") String id
		MemberVo member = (MemberVo) session.getAttribute("member");
		List<PetVo> all = petBiz.getPetAll(member.getId()); //id 여기에 id
		return new ModelAndView("/WEB-INF/View/Member/petlist.jsp", "all", all); // 경로 미지정
	}
	
	
	@RequestMapping("/petdelete.do")
	public String petDelete(@RequestParam("del_pname") String del_pname, HttpSession session) {
		MemberVo member = (MemberVo) session.getAttribute("member");
		PetVo petVo = new PetVo();
		petVo.setId(member.getId());
		petVo.setP_name(del_pname);
		
		int res = petBiz.getPetDelete(petVo);
		if (res > 0) 
			return "/petselect.do";
	return "";
	}
	
	
	@RequestMapping("/petinput.do")
	public String InsertView() {
			return "/WEB-INF/View/Member/petinput.jsp";

	}
	
	
	@RequestMapping(value = "/petinsert.do", method=RequestMethod.POST) 
	public ModelAndView PetInsert(@RequestParam("p_name") String p_name, 
								  @RequestParam("p_sex") String p_sex,
								  @RequestParam("p_size") String p_size,
								  @RequestParam("p_birthdate") String p_birthdate,
								  HttpSession session){
		MemberVo member = (MemberVo) session.getAttribute("member");
		PetVo petVo = new PetVo(member.getId(), p_name, p_sex, p_size, p_birthdate); 

		int r = petBiz.getPetInsert(petVo);
		if(r > 0) {
			List<PetVo> all = petBiz.getPetAll(member.getId()); //id 여기에 id
			return new ModelAndView("/WEB-INF/View/Member/petlist.jsp", "all", all); // 경로 미지정 //petselect.do
		}
		return null;
	}
	
	@RequestMapping(value = "/petfind.do", method=RequestMethod.GET)
	public ModelAndView FindView(@RequestParam("up_pname") String up_pname, HttpSession session) {
		MemberVo member = (MemberVo) session.getAttribute("member");		
		PetVo petVo = new PetVo();
		petVo.setId(member.getId());
		petVo.setP_name(up_pname);
		
		PetVo res = petBiz.getPetFind(petVo);
			return new ModelAndView("/WEB-INF/View/Member/petupdate.jsp", "res", res);
	}
	
	
	@RequestMapping(value = "/petupdate.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView PetUpdate(@RequestParam("p_name") String up_pname, 
								  @RequestParam("p_sex") String p_sex,
								  @RequestParam("p_size") String p_size,
								  @RequestParam("p_birthdate") String p_birthdate,
								  HttpSession session) {
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		PetVo petVo = new PetVo(member.getId(), up_pname, p_sex, p_size, p_birthdate); 
		
		
		int r= petBiz.getPetUpdate(petVo);
		if(r > 0) {
			List<PetVo> all = petBiz.getPetAll(member.getId());
			return new ModelAndView("/WEB-INF/View/Member/petlist.jsp", "all", all);
					
		}
		return null;
	}
	
	// 메인 (필요한가?)
	@RequestMapping("/goindex.do")
	public String goIndex() {
		return "/WEB-INF/View/Member/?????.jsp"; // 경로 미지정
	}
	
	/*
	 * @RequestMapping(value="/petfind.do", method = RequestMethod.GET) public
	 * ModelAndView MyFind(@RequestParam("id") String id) { PetVo vo = new PetVo();
	 * PetVo vo1 = new PetVo(); vo.setId(id);
	 * 
	 * vo1 = petbiz.getPetFind(vo);
	 * 
	 * ModelAndView mav = new ModelAndView("/WEB-INF/View/Member/Mypage.jsp",
	 * "member", vo1);
	 * 
	 * return mav;
	 * 
	 * }
	 * 
	 */
}
