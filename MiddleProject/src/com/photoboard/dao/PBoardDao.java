package com.photoboard.dao;

import java.util.List;

import com.photoboard.vo.PBoardVo;

public interface PBoardDao {

	public List<PBoardVo> getAll();
	public List<PBoardVo> goReply(int no);
	public int getReply(PBoardVo vo);
	public int getPost(PBoardVo vo);
	public int getDelete(int no);
	public int getUpdate(PBoardVo vo);
	public PBoardVo getPBoardContent(int no);
	public PBoardVo getPBoardUpdate(int no);
	public int getViewCount(PBoardVo vo);
	public int replyDelete(int r_no);
	public int replyUpdate(PBoardVo vo);
	public PBoardVo getReplyContent(int r_no);
}