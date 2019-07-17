package com.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.biz.BoardBiz;
import com.board.vo.BoardVo;
import com.member.vo.MemberVo;

@Controller
public class BoardController {

	@Autowired
	BoardBiz boardBiz;

	@RequestMapping(value = "/board.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView openBoardList() throws Exception {
		List<BoardVo> list = boardBiz.getcontentAll();

		ModelAndView mav = new ModelAndView("/WEB-INF/View/Board/Board.jsp");//
		mav.addObject("list", list); //
		return mav; //
	}

	@RequestMapping(value = "/readcontent.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView readBoardList(@RequestParam("no") int no) throws Exception {
		BoardVo result = boardBiz.readContent(no);
		ModelAndView mav = new ModelAndView("/WEB-INF/View/Board/BoardContent.jsp"); //
		mav.addObject("result", result);
		return mav;
	}

	@RequestMapping(value = "/boardwrite.do")
	public ModelAndView writeBoard() throws Exception {
		BoardVo vo = new BoardVo();
		ModelAndView mav = new ModelAndView("/WEB-INF/View/Board/BoardWrite.jsp", "vo", vo);
		return mav;
	}

	@RequestMapping(value = "/insertcontent.do", method = RequestMethod.GET)
	public ModelAndView insertBoardList(@ModelAttribute BoardVo vo, HttpSession session) throws Exception {
		MemberVo member = (MemberVo) session.getAttribute("member");
		vo.setN_id(member.getN_id());
		int r = boardBiz.getInsert(vo);
		List<BoardVo> list = boardBiz.getcontentAll();
		ModelAndView mav = new ModelAndView("board.do"); //
		mav.addObject("list", list);
		return mav;
	}

//find.do -> ����� update
//
	@RequestMapping(value = "/bupdatecontent.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateBoardList(@RequestParam int no) throws Exception {
		BoardVo result = boardBiz.readContent(no);
		ModelAndView mav = new ModelAndView("/WEB-INF/View/Board/BoardUpdate.jsp"); //
		mav.addObject("result", result);
		return mav;
	}

	@RequestMapping(value = "/updatefinish.do")
	public ModelAndView updatefinish(@ModelAttribute BoardVo vo) throws Exception {
		int result = boardBiz.getUpdate(vo);
		List<BoardVo> list = boardBiz.getcontentAll();
		ModelAndView mav = new ModelAndView("board.do"); //
		mav.addObject("list", list);
		return mav;

	}

	@RequestMapping(value = "/deletecontent.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteBoardList(@RequestParam("no") int no) throws Exception {
		int result = boardBiz.getDelete(no);
		return "/board.do";
	}

	@RequestMapping(value = "/replyall.do", method = { RequestMethod.GET, RequestMethod.POST }) //
	public ModelAndView replyall(@RequestParam int no) throws Exception {
		List<BoardVo> li = boardBiz.getReplyAll(no);
		ModelAndView mav = new ModelAndView("/WEB-INF/View/Board/Reply_All.jsp");
		mav.addObject("li", li); //
		return mav;
	}

	@RequestMapping(value = "/replywrite.do", method = { RequestMethod.GET, RequestMethod.POST }) //
	public ModelAndView replywrite() throws Exception {
		ModelAndView mav = new ModelAndView("/WEB-INF/View/Board/Reply_Write.jsp");
		return mav;
	}

	// 댓글 삽입
	@RequestMapping(value = "/replyinsert.do", method = { RequestMethod.GET, RequestMethod.POST }) //
	public ModelAndView replyinsert(@ModelAttribute BoardVo vo, HttpSession session) throws Exception {
		MemberVo member = (MemberVo) session.getAttribute("member");
		System.out.println(member.getN_id());
		vo.setN_id(member.getN_id());
		int r = boardBiz.replyinsert(vo);
		ModelAndView mav = new ModelAndView("/readcontent.do"); //
		// mav.addObject("list", list);
		// mav.addObject("result", result);
		return mav;
	}

	// 댓글 수정 페이지로 이동
	@RequestMapping(value = "/replyfind.do", method = { RequestMethod.GET, RequestMethod.POST }) //
	public ModelAndView replyfind(@RequestParam("r_no") int r_no) throws Exception {
		BoardVo vo = boardBiz.replyfind(r_no);
		ModelAndView mav = new ModelAndView("/WEB-INF/View/Board/Reply_Update.jsp");
		mav.addObject("re", vo);
		return mav;
	}

	@RequestMapping(value = "/replyupdate.do", method = { RequestMethod.GET, RequestMethod.POST }) //
	public ModelAndView replyupdate(@ModelAttribute BoardVo vo) throws Exception {
		int r = boardBiz.replyupdate(vo);
		ModelAndView mav = new ModelAndView("/replyall.do");
		return mav;
	}

	// 댓글 삭제
	@RequestMapping(value = "/replydelete.do", method = RequestMethod.GET)
	public ModelAndView replydelete(@RequestParam("r_no") int r_no) throws Exception {
		int r = boardBiz.replydelete(r_no);
		// BoardVo result = boardBiz.readContent(no);
		ModelAndView mav = new ModelAndView("/WEB-INF/View/Board/BoardContent.jsp"); //
		//mav.addObject("result", result);
		return mav;
	}
}
