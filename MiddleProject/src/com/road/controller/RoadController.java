package com.road.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.vo.MemberVo;
import com.pet.vo.PetVo;
import com.road.biz.RoadBiz;
import com.road.vo.RoadVo;

@Controller
public class RoadController {

	private static Logger logger = LogManager.getLogger(RoadController.class);
	
	@Autowired
	RoadBiz roadBiz;
	
	@RequestMapping(value="/goroad.do")
	public ModelAndView goMain() {
		List<RoadVo> all = roadBiz.getAll();
		ModelAndView mav = new ModelAndView("/WEB-INF/View/Road/Road.jsp");
		mav.addObject("all", all);
		return mav;
	}
	
	@RequestMapping(value="/goroadcontent.do")
	public ModelAndView goRoadContent(@RequestParam int roadno, HttpSession session) {
		RoadVo road = roadBiz.getRoadContent(roadno);
		MemberVo member = (MemberVo) session.getAttribute("member");
		ModelAndView mav = new ModelAndView("/WEB-INF/View/Road/RoadContent.jsp");
		mav.addObject("vo",road);
		try {
			PetVo pet = roadBiz.getPetInfo(member.getId());
			logger.info("\t"+member.getId()+"\t"+member.getU_birthday()+"\t"+member.getSido()+"\t"+member.getSigungu()+"\t"+pet.getP_size()+"\t"+
						pet.getP_birthdate()+"\t"+member.getPetcount()+"\t"+road.getRoadno()+"\t"+
						road.getSttreeknd()+"\t"+road.getSttreestretlt());
		} catch (NullPointerException e1) {
			logger.info("\t"+"비회원"+"\t"+"비회원"+"\t"+"비회원"+"\t"+"비회원"+"\t"+"비회원"+"\t"+
					"비회원"+"\t"+"비회원"+"\t"+road.getRoadno()+"\t"+
					road.getSttreeknd()+"\t"+road.getSttreestretlt());
		}
		return mav;
	}
	
}