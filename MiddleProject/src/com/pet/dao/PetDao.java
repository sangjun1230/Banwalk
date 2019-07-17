package com.pet.dao;

import java.util.List;

import com.pet.vo.PetVo;




public interface PetDao {
	public List<PetVo> getPetAll(String member_id);
	public int getPetInsert(PetVo petVo);
	public int getPetDelete(PetVo petVo);
	public int getPetUpdate(PetVo petVo);
	public PetVo getPetFind(PetVo petVo);

}
