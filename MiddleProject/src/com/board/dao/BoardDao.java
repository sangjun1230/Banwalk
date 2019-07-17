package com.board.dao;

import java.util.List;

import com.board.vo.BoardVo;

public interface BoardDao {

	public List<BoardVo> getcontentAll();
	public int updateReadCount(BoardVo vo);
	public int getInsert(BoardVo vo);
	public int getDelete(int no);
	public int getUpdate(BoardVo vo);
	public List<BoardVo> getFind(String n_id);
	public BoardVo readContent(int no) throws Exception;
	
	
	public List<BoardVo> getReplyAll(int no);
	public int replyinsert(BoardVo vo);
	public BoardVo replyfind(int r_no);
	public int replyupdate(BoardVo vo);
	public int replydelete(int r_no);
}
