package com.inter;

public interface SqlInter2 {

//	String pboardcontent = "select b.no, b.title, b.viewcount, b.regdate, b.subtitle, b.n_id, b.contenttype, b.contents, r.r_no, r.r_n_id, r.r_contents, r.r_regdate, b.url from board b, reply r where b.no=r.no(+) and b.contenttype='2' and b.no=? order by r.r_regdate, b.no, r.r_no"; 
	
	String boardcontent = "select no, title, viewcount, regdate, subtitle, n_id, contenttype, contents, url from board where no=?";
	
	String pboardreply = "select r_no, r_n_id, r_contents, r_regdate from reply where no=?";
		
	String bpost = "insert into board (no, title, n_id, viewcount, regdate, contents, contenttype, url) "
			+ "values (seq_board_no.nextval,?,?,0,sysdate,?,'1',?)";
	
	String post = "insert into board (no, title, n_id, viewcount, regdate, contents, contenttype, url) values (seq_board_no.nextval,?,?,0,sysdate,?,'2',?)";

	String update = "update board set title = ?, contents = ? where no = ?";

	String delete = "delete from board where no=?";

	String selectall = "select no, title, viewcount, regdate, subtitle, n_id, contenttype, contents, url from board where contenttype='1'";

	String viewcount = "update board set viewcount=viewcount+1 where no=?";
	
	String replyall = "select r_no, r_n_id, r_contents, r_regdate from reply where no=? order by r_regdate";
	
	String findreply = "select no, r_no, r_n_id, r_contents, r_regdate from reply where r_no=?";
	
	String insertreply = "insert into reply values(?, seq_reply_r_no.nextval, ?, ?, sysdate)";
	
	String updatereply = "update reply set r_contents = ? where r_no = ?";
	
	String deletereply = "delete from reply where r_no = ?";
}