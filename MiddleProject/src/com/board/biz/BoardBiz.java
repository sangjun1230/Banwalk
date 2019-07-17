package com.board.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.BoardDaoImpl;
import com.board.vo.BoardVo;
import com.member.vo.MemberVo;

@Service
public class BoardBiz {

	@Autowired
	BoardDaoImpl boardDaoImpl;

	public List<BoardVo> getcontentAll() {
		return boardDaoImpl.getcontentAll();
	}

	public int getInsert(BoardVo vo) {
		return boardDaoImpl.getInsert(vo);
	}

	public int getDelete(int no) {
		return boardDaoImpl.getDelete(no);
	}

	public int getUpdate(BoardVo boardVo) {
		return boardDaoImpl.getUpdate(boardVo);
	}

	public List<BoardVo> getFind(String n_id) {
		return boardDaoImpl.getFind(n_id);
	}

	public BoardVo readContent(int no) throws Exception {
		return boardDaoImpl.readContent(no);
	}

	public int updateReadCount(BoardVo vo) throws Exception {
		return boardDaoImpl.updateReadCount(vo);
	}

	public List<BoardVo> getReplyAll(int no) {
		return boardDaoImpl.getReplyAll(no);
	}

	public BoardVo replyfind(int r_no) {
		return boardDaoImpl.replyfind(r_no);
	}

	public int replyinsert(BoardVo vo) {
		return boardDaoImpl.replyinsert(vo);
	}

	public int replyupdate(BoardVo vo) {
		return boardDaoImpl.replyupdate(vo);
	}

	public int replydelete(int r_no) {
		return boardDaoImpl.replydelete(r_no);
	}
}
