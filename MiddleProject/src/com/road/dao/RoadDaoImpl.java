package com.road.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.inter.SqlInter;
import com.pet.vo.PetVo;
import com.road.vo.RoadVo;

@Repository
public class RoadDaoImpl implements RoadDao, SqlInter {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<RoadVo> getAll() {
		List<RoadVo> all = jdbcTemplate.query(roadall, new RowMapper<RoadVo>() { 
			@Override
			public RoadVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				RoadVo vo = new RoadVo(rs.getInt("roadno"),rs.getString("sttreestretnm"),rs.getString("startlnmadr"),
						rs.getString("startlatitude"),rs.getString("endlnmadr"),rs.getString("endlatitude"),
						rs.getString("sttreeKnd"), rs.getString("sttreestretlt"),rs.getString("sttreestretintrcn"),
						rs.getString("roadnm"),	rs.getString("phonenumber"),rs.getString("institutionnm"),
						rs.getString("referencedate"), rs.getString("insttcode"),rs.getString("insttnm"),
						rs.getString("photourl"));
				return vo;
			}
		}) ;
		return all;
	}
	
	@Override
	public RoadVo getRoadContent(int roadno) {
		RoadVo vo = jdbcTemplate.queryForObject(roadcontent, new Object[] {roadno}, new RowMapper<RoadVo>() {
			@Override
			public RoadVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				RoadVo content = new RoadVo(rs.getInt("roadno"),rs.getString("sttreestretnm"),rs.getString("startlnmadr"),
						rs.getString("startlatitude"),rs.getString("endlnmadr"),rs.getString("endlatitude"),
						rs.getString("sttreeKnd"), rs.getString("sttreestretlt"),rs.getString("sttreestretintrcn"),
						rs.getString("roadnm"),	rs.getString("phonenumber"),rs.getString("institutionnm"),
						rs.getString("referencedate"), rs.getString("insttcode"),rs.getString("insttnm"),
						rs.getString("photourl"));
				return content;
			}
		});
		return vo;
	}

	@Override
	public RoadVo getMapContent(String sttreeStretNm) { // depth2 산책길 좌표 뿌려주는 메소드
		RoadVo roadVo = jdbcTemplate.queryForObject("select ??????? from garosu where sttreeStretNm=??", new Object[] {sttreeStretNm}, new RowMapper<RoadVo>() {
			@Override
			public RoadVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				RoadVo content = new RoadVo(); 
				return content;
			}
		});
		return roadVo;
	}

	@Override
	public int storageData(RoadVo vo) {
		int r = jdbcTemplate.update(storage, new Object[] {vo.getSttreestretnm(), vo.getStartlnmadr(), vo.getStartlatitude(),
				vo.getEndlnmadr(), vo.getEndlatitude(), vo.getSttreeknd(), vo.getSttreeco(), vo.getSttreestretlt(),
				vo.getPltyear(), vo.getSttreestretintrcn(), vo.getRoadnm(), vo.getRoadknd(), vo.getRoadsctn(),
				vo.getPhonenumber(), vo.getInstitutionnm(), vo.getReferencedate(), vo.getInsttcode(), vo.getInsttnm()});
		return r;
	}
	
	@Override
	public PetVo getPetInfo(String id) {
		PetVo petVo = jdbcTemplate.queryForObject(petinfo, new Object[] {id}, new RowMapper<PetVo>() {
			@Override
			public PetVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				PetVo petinfo = new PetVo(rs.getString("id"), rs.getString("p_name"),
						rs.getString("p_sex"), rs.getString("p_size"), rs.getString("p_birthdate"));
				return petinfo;
			}
		});
		return petVo;
	}

}
