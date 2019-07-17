package com.pet.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.dao.PetDaoImpl;
import com.pet.vo.PetVo;



@Service("petBiz")
public class PetBiz {
	@Autowired
	PetDaoImpl petDaoImpl;
// 유저 한명이 갖고 있는 pet의 리스트
	public List<PetVo> getPetAll(String member_id) {
		return petDaoImpl.getPetAll(member_id);
	}

	public int getPetDelete(PetVo petVo) {
		return petDaoImpl.getPetDelete(petVo);
	}

	public int getPetInsert(PetVo petVo) {
		return petDaoImpl.getPetInsert(petVo);
	}

	public int getPetUpdate(PetVo petVo) {
		return petDaoImpl.getPetUpdate(petVo);
	}
	
	public PetVo getPetFind(PetVo petVo) {
		return petDaoImpl.getPetFind(petVo);
	}
	
	

}
