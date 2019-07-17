package com.member.dao;

import java.util.List;

import com.member.vo.MemberVo;

public interface MemberDao {

	public List<MemberVo> getAll();
	public int getInsert(MemberVo memberVo);
	public int getDelete(String id);
	public int getUpdate(MemberVo memberVo);
	public MemberVo getFind(String id);
	public MemberVo getLogin(MemberVo memberVo);
	public MemberVo getLogout(MemberVo memberVo);
	public MemberVo getPwcheck(MemberVo memberVo);
	public MemberVo getIdcheck(MemberVo memberVo);
}
