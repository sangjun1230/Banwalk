package com.member.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.member.dao.MemberDaoImpl;
import com.member.vo.MemberVo;

@Service("memberBiz")
public class MemberBiz {

	@Autowired
	MemberDaoImpl memberDaoImpl;

	public List<MemberVo> getAll() {
		return memberDaoImpl.getAll();
	}
	
	public int getInsert(MemberVo memberVo) {
		return memberDaoImpl.getInsert(memberVo);
	}

	public int getDelete(String del_name) {
		return memberDaoImpl.getDelete(del_name);
	}

	public int getUpdate(MemberVo memberVo) {
		return memberDaoImpl.getUpdate(memberVo);
	}
	
	public MemberVo getFind(String id) {
		return memberDaoImpl.getFind(id);
	}

	public MemberVo getLogin(MemberVo memberVo) {
		return memberDaoImpl.getLogin(memberVo);
	}

	public MemberVo getLogout(MemberVo memberVo) {
		return memberDaoImpl.getLogout(memberVo);
	}

	public MemberVo getPwcheck(MemberVo memberVo) {
		return memberDaoImpl.getPwcheck(memberVo);
	}
	
	public MemberVo getIdcheck(MemberVo memberVo) {
		return memberDaoImpl.getIdcheck(memberVo);
	}

}
