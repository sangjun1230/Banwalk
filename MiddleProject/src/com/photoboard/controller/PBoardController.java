package com.photoboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.member.vo.MemberVo;
import com.photoboard.biz.PBoardBiz;
import com.photoboard.validator.FileValidator;
import com.photoboard.vo.PBoardVo;

@Controller
public class PBoardController {

	@Autowired
	PBoardBiz pBoardBiz;

	@Autowired
	FileValidator fileValidator;

	int cnt = 0;
	
	//사진판메인이동
	@RequestMapping(value = "/gophotoboard.do")
	public ModelAndView goPhotoBoard() {
		List<PBoardVo> all = pBoardBiz.getAll();
		ModelAndView mav = new ModelAndView("/WEB-INF/View/PhotoBoard/PhotoBoard.jsp");
		mav.addObject("all", all);
		return mav;
	}

	//글쓰기페이지이동
	@RequestMapping(value = "/gophotoboardpost.do", method = RequestMethod.GET)
	public ModelAndView goPhotoBoardPost() {
		PBoardVo vo = new PBoardVo();
		ModelAndView mav = new ModelAndView("/WEB-INF/View/PhotoBoard/PhotoBoardPost.jsp", "vo", vo);
		return mav;
	}

	//글삽입
	@RequestMapping(value = "/gophotoboardpost.do", method = RequestMethod.POST)
	public ModelAndView getPost(@ModelAttribute PBoardVo vo, BindingResult br, HttpSession session) {	
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		vo.setN_id(member.getN_id());
		
		fileValidator.validate(vo, br);
		
		if (br.hasErrors()) {
			return new ModelAndView("/gophotoboardpost.do");
		}
		// 클라이언트가 올린 폼태그의 path="file"을 리턴 받는다.
		MultipartFile file = vo.getFile();
		String filename = file.getOriginalFilename();// 원본 이름을 리턴받는다.

		// uploadFile.jsp에서 사용할 객체 : 클라이언트가 올린 파일의 정보를 출력할 페이지-----
//		PBoardVo fileobj = new PBoardVo();
//		fileobj.setUrl(vo.getNo()+vo.getN_id()+filename);

		InputStream inputStream = null;
		OutputStream outputStream = null;
		File newFile = null;
		String path = "/Users/sangjun/Documents/BanWalk/MiddleProject/WebContent/img" + "/" + cnt + filename;
		
		try {
			inputStream = file.getInputStream();
			newFile = new File(path);

			outputStream = new FileOutputStream(newFile);// 서버에 저장할 파일에 저장 객체를 생성
			int read = 0;// 파일의 내용을 한자 씩 읽어서 리턴 할 변수
			byte[] b = new byte[(int) file.getSize()];// 파일의 크기만큼의 바이트 크기
			while ((read = inputStream.read(b)) != -1) {// 파일 처음부터 마지막까지 읽어서
				outputStream.write(b, 0, read);// 저장할 객체에 byte[]로 출력한다.
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
			}
		}
		
		vo.setUrl(cnt+filename);
		int r = pBoardBiz.getPost(vo);
		ModelAndView mav = new ModelAndView("redirect:/gophotoboard.do");
		
		cnt += 1;
		
		return mav;
	}

	//글보기페이지이동
	@RequestMapping(value = "/gocontent.do", method = RequestMethod.GET)
	public ModelAndView goContent(@RequestParam("no") int no) {
		PBoardVo pv = pBoardBiz.getPBoardContent(no);
		ModelAndView mav = new ModelAndView("/WEB-INF/View/PhotoBoard/PhotoBoardContent.jsp");
		mav.addObject("vo", pv);
		return mav;
	}

	//글수정
	@RequestMapping(value = "/updatecontent.do", method = RequestMethod.POST)
	public String getUpdateContent(@ModelAttribute PBoardVo vo) {
		int r = pBoardBiz.getUpdate(vo);
		return "redirect:/gocontent.do?no="+vo.getNo();
	}

	//글삭제
	@RequestMapping(value = "/getdelete.do", method = RequestMethod.POST)
	public String getDelete(@RequestParam(value = "no") int no) {
		int r = pBoardBiz.getDelete(no);
		if (r > 0)
			return "redirect:/gophotoboard.do";
		else
			return "";
	}

	//글수정페이지이동
	@RequestMapping(value = "/goupdate.do", method = RequestMethod.POST)
	public ModelAndView goUpdate(@RequestParam("no") int no) {
		PBoardVo pv = pBoardBiz.getPBoardUpdate(no);
		ModelAndView mav = new ModelAndView("/WEB-INF/View/PhotoBoard/PhotoBoardUpdate.jsp");
		mav.addObject("vo", pv);
		return mav;
	}

	//댓글가져오기
	@RequestMapping(value="/photoboardreply.do")
	public ModelAndView goReply(@RequestParam int no) {
		List<PBoardVo> reall = pBoardBiz.goReply(no);
		ModelAndView mav = new ModelAndView("/WEB-INF/View/PhotoBoard/PhotoBoardReply.jsp");
		mav.addObject("re",reall);
		return mav;
	}
	
	//댓글삽입
	@RequestMapping(value="/getreply.do", method=RequestMethod.GET)
	public ModelAndView getReply(@ModelAttribute PBoardVo vo, HttpSession session) {
		MemberVo member = (MemberVo) session.getAttribute("member");
		vo.setN_id(member.getN_id());
		int r = pBoardBiz.getReply(vo);
		ModelAndView mav = new ModelAndView("/gocontent.do");
		return mav;
	}

	//댓글삭제
	@RequestMapping(value="/preplydelete.do", method=RequestMethod.GET)
	public String replyDelete(@RequestParam int r_no, int no) {
		int r = pBoardBiz.replyDelete(r_no);
		if (r > 0)
			return "redirect:/gocontent.do?no="+no;
		else
			return "";
	}
	
	//댓글수정페이지이동
	@RequestMapping(value="/replyupdateform.do", method=RequestMethod.GET)
	public ModelAndView goReplyUpdate(@RequestParam int r_no) {
		PBoardVo vo = pBoardBiz.getReplyContent(r_no);
		ModelAndView mav = new ModelAndView("/WEB-INF/View/PhotoBoard/PhotoBoardReplyUpdate.jsp");
		mav.addObject("re",vo);
		return mav;
	}
	
	//댓글수정
	@RequestMapping(value="/preplyUpdate.do", method=RequestMethod.GET)
	public ModelAndView replyUpdate(@ModelAttribute PBoardVo vo) {
		int r = pBoardBiz.replyUpdate(vo);
		ModelAndView mav = new ModelAndView("/gocontent.do");
		return mav;
	}
	
}