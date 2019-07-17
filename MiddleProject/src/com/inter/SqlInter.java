package com.inter;

public interface SqlInter {

//	String pboardcontent = "select b.no, b.title, b.viewcount, b.regdate, b.subtitle, b.n_id, b.contenttype, b.contents, r.r_no, r.r_n_id, r.r_contents, r.r_regdate, b.url from board b, reply r where b.no=r.no(+) and b.contenttype='2' and b.no=? order by r.r_regdate, b.no, r.r_no"; 
	
	String pboardcontent = "select no, title, viewcount, regdate, subtitle, n_id, contenttype, contents, url from board where no=?";
	
	String pboardreply = "select r_no, r_n_id, r_contents, r_regdate from reply where no=?";
	
	String post = "insert into board (title, n_id, viewcount, regdate, contents, contenttype, url) values (?,?,0,now(),?,'2',?)";

	String update = "update board set title = ?, contents = ? where no = ?";

	String delete = "delete from board where no=?";

	String selectall = "select no, title, viewcount, regdate, subtitle, n_id, contenttype, contents, url from board where contenttype='2'";

	String viewcount = "update board set viewcount=viewcount+1 where no=?";
	
	String replyall = "select no, r_no, r_n_id, r_contents, r_regdate from reply where no=? order by r_regdate";
	
	String insertreply = "insert into reply(no,r_n_id,r_contents,r_regdate) values(?, ?, ?, now())";
	
	String updatereply = "update reply set r_contents = ? where r_no = ?";
	
	String deletereply = "delete from reply where r_no = ?";
	
	String replycontent = "select no, r_no, r_n_id, r_contents, r_regdate from reply where r_no=?";
	
	String roadall = "select roadNo, sttreeStretNm,	startLnmadr, startLatitude, endLnmadr, endLatitude,	sttreeKnd, sttreeStretLt, sttreeStretintrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl from garosu";
	
	String roadcontent = "select roadNo, sttreeStretNm,	startLnmadr, startLatitude, endLnmadr, endLatitude,	sttreeKnd, sttreeStretLt, sttreeStretintrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl from garosu where roadno=?";

	String storage = "insert into garosu values(seq_road_no.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'a1.jpg')";

	String petinfo = "select * from pet where id=? limit 1";
}