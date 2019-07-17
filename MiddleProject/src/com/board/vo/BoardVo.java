package com.board.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVo {

	private int no;
	private String title;
	private int viewcount;
	private String regdate;
	private String subtitle;
	private String n_id;
	private String contentType;
	private String contents;
	private int r_no;
	private String r_n_id;
	private String r_contents;
	private String url;
	private String r_regdate;
	private MultipartFile file;

	public BoardVo(int no, String title, int viewcount, String regdate, String subtitle, String n_id,
			String contentType, String contents, String url) {
		super();
		this.no = no;
		this.title = title;
		this.viewcount = viewcount;
		this.regdate = regdate;
		this.subtitle = subtitle;
		this.n_id = n_id;
		this.contentType = contentType;
		this.contents = contents;
		this.url = url;
	}

	public BoardVo(int r_no, String r_n_id, String r_contents, String r_regdate) {
		super();
		this.r_no = r_no;
		this.r_n_id = r_n_id;
		this.r_contents = r_contents;
		this.r_regdate = r_regdate;
	}

	public BoardVo(int no, int r_no, String r_n_id, String r_contents, String r_regdate) {
		super();
		this.no = no;
		this.r_no = r_no;
		this.r_n_id = r_n_id;
		this.r_contents = r_contents;
		this.r_regdate = r_regdate;
	}

	public String getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(String r_regdate) {
		this.r_regdate = r_regdate;
	}

	public String getN_id() {
		return n_id;
	}

	public void setN_id(String n_id) {
		this.n_id = n_id;
	}

	public BoardVo() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String date) {
		this.regdate = date;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getContents() {
		return contents;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_n_id() {
		return r_n_id;
	}

	public void setR_n_id(String r_n_id) {
		this.r_n_id = r_n_id;
	}

	public String getR_contents() {
		return r_contents;
	}

	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", title=" + title + ", viewcount=" + viewcount + ", regdate=" + regdate
				+ ", subtitle=" + subtitle + ", n_id=" + n_id + ", contentType=" + contentType + ", contents="
				+ contents + ", r_no=" + r_no + ", r_n_id=" + r_n_id + ", r_contents=" + r_contents + ", url=" + url
				+ ", r_regdate=" + r_regdate + ", file=" + file + "]";
	}

}
