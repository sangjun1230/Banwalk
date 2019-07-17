package com.photoboard.biz;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.photoboard.dao.PBoardDaoImpl;
import com.photoboard.vo.PBoardVo;

@Service
public class PBoardBiz {

	@Autowired
	PBoardDaoImpl pBoardDaoImpl;
	
	public List<PBoardVo> getAll() {
		return pBoardDaoImpl.getAll();
	}
	public List<PBoardVo> goReply(int no){
		return pBoardDaoImpl.goReply(no);
	}
	public int getReply(PBoardVo vo) {
		return pBoardDaoImpl.getReply(vo);
	}
	public int getDelete(int no) {
		return pBoardDaoImpl.getDelete(no);
	}
	public int getUpdate(PBoardVo pBoardVo) {
		return pBoardDaoImpl.getUpdate(pBoardVo);
	}
	public PBoardVo getPBoardContent(int no) {
		return pBoardDaoImpl.getPBoardContent(no);
	}
	public int getPost(PBoardVo vo) {
		return pBoardDaoImpl.getPost(vo);
	}
	public PBoardVo getPBoardUpdate(int no) {
		return pBoardDaoImpl.getPBoardUpdate(no);
	}
	public int replyDelete(int r_no) {
		return pBoardDaoImpl.replyDelete(r_no);
	}
	public int replyUpdate(PBoardVo vo) {
		return pBoardDaoImpl.replyUpdate(vo);
	}
	public PBoardVo getReplyContent(int r_no) {
		return pBoardDaoImpl.getReplyContent(r_no);
	}
}