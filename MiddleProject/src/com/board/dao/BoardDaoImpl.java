package com.board.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.board.vo.BoardVo;
import com.inter.SqlInter;
import com.inter.SqlInter2;
import com.member.vo.MemberVo;
import com.photoboard.vo.PBoardVo;

@Repository
public class BoardDaoImpl implements BoardDao, SqlInter2 {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 전체 글 보기
	@Override
	public List<BoardVo> getcontentAll() {
		List<BoardVo> all = jdbcTemplate.query(selectall, new RowMapper<BoardVo>() {
			@Override
			public BoardVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardVo vo = new BoardVo(rs.getInt("no"), rs.getString("title"), rs.getInt("viewcount"),
						rs.getString("regdate"), rs.getString("subtitle"), rs.getString("n_id"),
						rs.getString("contenttype"), rs.getString("contents"), rs.getString("url"));
				return vo;
			}
		});
		return all;
	}

	// 글 추가
	@Override
	public int getInsert(BoardVo vo) {
		int r = jdbcTemplate.update(bpost, new Object[] { vo.getTitle(), vo.getN_id(), vo.getContents(), vo.getUrl() });
		return r;
	}

	// 글 삭제
	@Override
	public int getDelete(int no) {
		int r = jdbcTemplate.update(delete, no);
		return r;
	}

	// 글 수정
	@Override
	public int getUpdate(BoardVo vo) {
		int r = jdbcTemplate.update(update, new Object[] { vo.getTitle(), vo.getContents(), vo.getNo() });
		return r;
	}

	@Override
	public List<BoardVo> getFind(String n_id) {
		return null;
	}

	@Override
	public BoardVo readContent(int no) throws Exception {
		BoardVo vo = jdbcTemplate.queryForObject(boardcontent, new Object[] { no }, new RowMapper<BoardVo>() {
			@Override
			public BoardVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardVo content = new BoardVo(rs.getInt("no"), rs.getString("title"), rs.getInt("viewcount"),
						rs.getString("regdate"), rs.getString("subtitle"), rs.getString("n_id"),
						rs.getString("contenttype"), rs.getString("contents"), rs.getString("url"));
				return content;
			}
		});
		this.updateReadCount(vo);
		return vo;
	}

	
	@Override
	public int updateReadCount(BoardVo vo) {
		int r = jdbcTemplate.update(viewcount, new Object[] {vo.getNo()});
		return r;
	}

	// 댓글 전체 출력
	@Override
	public List<BoardVo> getReplyAll(int no) {
		List<BoardVo> getAll = jdbcTemplate.query(replyall, new Object[] { no }, new RowMapper<BoardVo>() {
			@Override
			public BoardVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardVo vo = new BoardVo(rs.getInt("r_no"), rs.getString("r_n_id"), rs.getString("r_contents"),
						rs.getString("r_regdate"));
				return vo;
			}
		});
		return getAll;
	}

	@Override
	public int replyinsert(BoardVo vo) {

		int r = jdbcTemplate.update(insertreply, new Object[] { vo.getNo(), vo.getR_n_id(), vo.getR_contents() });
		return r;
	}

	// 댓글 찾기
	@Override
	public BoardVo replyfind(int r_no) {
		BoardVo vo = jdbcTemplate.queryForObject(findreply, new Object[] {r_no}, new RowMapper<BoardVo>() {
			@Override
			public BoardVo mapRow(ResultSet rs, int rowNum) throws SQLException{
				BoardVo recontent = new BoardVo(rs.getInt("no"), rs.getInt("r_no"),
						rs.getString("r_n_id"), rs.getString("r_contents"), rs.getString("r_regdate"));
				return recontent;
			}
		});
		return vo;
	}
	
	// 댓글 수정
	@Override
	public int replyupdate(BoardVo vo) {
		int r = jdbcTemplate.update(updatereply, new Object[] { vo.getR_contents(), vo.getR_no() });
		return r;
	}

	// 댓글 삭제
	@Override
	public int replydelete(int r_no) {
		int r = jdbcTemplate.update(deletereply, r_no);
		return r;
	}



}
