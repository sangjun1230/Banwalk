package com.photoboard.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.inter.SqlInter;
import com.photoboard.vo.PBoardVo;

@Repository
public class PBoardDaoImpl implements PBoardDao, SqlInter {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	//글전체출력
	@Override
	public List<PBoardVo> getAll() {
		List<PBoardVo> all = jdbcTemplate.query(selectall, new RowMapper<PBoardVo>() {
			@Override
			public PBoardVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				PBoardVo vo = new PBoardVo(rs.getInt("no"), rs.getString("title"), rs.getInt("viewcount"), 
						rs.getString("regdate"), rs.getString("subtitle"), rs.getString("n_id"), rs.getString("contenttype"),
						rs.getString("contents"), rs.getString("url"));
				return vo;
			}
		});
		return all;
	}

	//댓글전체출력
	@Override
	public List<PBoardVo> goReply(int no) {
		List<PBoardVo> reall = jdbcTemplate.query(replyall, new Object[] {no}, new RowMapper<PBoardVo>() {
			@Override
			public PBoardVo mapRow(ResultSet rs, int rowNum) throws SQLException{
				PBoardVo vo = new PBoardVo(rs.getInt("no"), rs.getInt("r_no"), rs.getString("r_n_id"), rs.getString("r_contents"), rs.getString("r_regdate"));
				return vo;
			}
		});
		return reall;
	}
	
	//댓글삽입
	@Override
	public int getReply(PBoardVo vo) {
		int r = jdbcTemplate.update(insertreply, new Object[] {vo.getNo(), vo.getR_n_id(), vo.getR_contents()});
		return r;
	}
	
	//글삽입
	@Override
	public int getPost(PBoardVo vo) {
		int r = jdbcTemplate.update(post, new Object[] {vo.getTitle(), vo.getN_id(), vo.getContents(), vo.getUrl()});
		return r;
	}

	//글삭제
	@Override
	public int getDelete(int no) {
		int r = jdbcTemplate.update(delete, no);
		return r;
	}

	//글수정
	@Override
	public int getUpdate(PBoardVo vo) {
		int r = jdbcTemplate.update(update, new Object[] { vo.getTitle(), vo.getContents(), vo.getNo() });
		return r;
	}

	//글보기
	@Override
	public PBoardVo getPBoardContent(int no) {
		PBoardVo pBoardVo=jdbcTemplate.queryForObject(pboardcontent, new Object[] { no }, new RowMapper<PBoardVo>() {
			@Override
			public PBoardVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				PBoardVo content = new PBoardVo(rs.getInt("no"), rs.getString("title"), rs.getInt("viewcount"), 
						rs.getString("regdate"), rs.getString("subtitle"), rs.getString("n_id"), rs.getString("contenttype"),
						rs.getString("contents"), rs.getString("url"));
				return content;
			}
		});
		this.getViewCount(pBoardVo);
		return pBoardVo;
	}

	//글수정페이지
	@Override
	public PBoardVo getPBoardUpdate(int no) {
		PBoardVo pBoardVo=jdbcTemplate.queryForObject(pboardcontent, new Object[] { no }, new RowMapper<PBoardVo>() {
			@Override
			public PBoardVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				PBoardVo content = new PBoardVo(rs.getInt("no"), rs.getString("title"), rs.getInt("viewcount"), 
						rs.getString("regdate"), rs.getString("subtitle"), rs.getString("n_id"), rs.getString("contenttype"),
						rs.getString("contents"), rs.getString("url"));
				return content;
			}
		});
		return pBoardVo;
	}

	//조회수증가메소드
	@Override
	public int getViewCount(PBoardVo vo) {
		int r = jdbcTemplate.update(viewcount, new Object[] {vo.getNo()});
		return r;
	}

	//댓글삭제
	@Override
	public int replyDelete(int r_no) {
		int r = jdbcTemplate.update(deletereply, r_no);
		return r;
	}

	//댓글수정
	@Override
	public int replyUpdate(PBoardVo vo) {
		int r = jdbcTemplate.update(updatereply, new Object[] {vo.getR_contents(), vo.getR_no()});
		return r;
	}

	//특정댓글출력
	@Override
	public PBoardVo getReplyContent(int r_no) {
		PBoardVo pBoardVo=jdbcTemplate.queryForObject(replycontent, new Object[] {r_no}, new RowMapper<PBoardVo>() {
			@Override
			public PBoardVo mapRow(ResultSet rs, int rowNum) throws SQLException{
				PBoardVo recontent = new PBoardVo(rs.getInt("no"), rs.getInt("r_no"),
						rs.getString("r_n_id"), rs.getString("r_contents"), rs.getString("r_regdate"));
				return recontent;
			}
		});
		return pBoardVo;
	}

}