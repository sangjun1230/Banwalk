package com.road.dao;

import java.util.List;

import com.pet.vo.PetVo;
import com.road.vo.RoadVo;

public interface RoadDao {
	public List<RoadVo> getAll(); // main 사진 뿌려주는 메소드
	public RoadVo getRoadContent(int roadno); // depth 1 산책길 정보
	public RoadVo getMapContent(String sttreeStretNm); // depth 2 map에 뿌려줄 산책길 좌표
	public int storageData(RoadVo vo);
	public PetVo getPetInfo(String id);
}
