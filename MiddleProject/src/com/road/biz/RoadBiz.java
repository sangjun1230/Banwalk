package com.road.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.vo.PetVo;
import com.road.dao.RoadDaoImpl;
import com.road.vo.RoadVo;

@Service
public class RoadBiz {
	@Autowired
	RoadDaoImpl roadDaoImpl;
	
	public List<RoadVo> getAll(){
		return roadDaoImpl.getAll();
	}
	
	public RoadVo getRoadContent(int roadno) {
		return roadDaoImpl.getRoadContent(roadno);
	}
	
	public int storageData(RoadVo vo) {
		System.out.println("비즈"+vo);
		return roadDaoImpl.storageData(vo);
	}
	
	public PetVo getPetInfo(String id) {
		return roadDaoImpl.getPetInfo(id);
	}
}
