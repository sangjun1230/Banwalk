package com.road.vo;

public class RoadVo {
	private int roadno; // 가로수길번호
	private String sttreestretnm; // 가로수길명
	private String startlnmadr; // 가로수길시작위도
	private String startlatitude; // 가로수길시작경도
	private String endlnmadr; // 가로수길종료위도
	private String endlatitude; // 가로수길종료경도
	private String sttreeknd; //가로수종류 
	private String sttreeco;
	private String sttreestretlt; // 가로수길길이
	private String pltyear;
	private String sttreestretintrcn;  //가로수길소개
	private String roadnm; // 도로명
	private String roadknd;
	private String roadsctn;
	private String phonenumber; // 관리기관전화번호
	private String institutionnm; // 관리기관명
	private String referencedate; // 데이터기준일자
	private String insttcode; // 제공기관 코드
	private String insttnm; // 제공기관명
	private String photourl; // 사진 url 주소
	
	
	public RoadVo() {
		super();
	}


	public RoadVo(int roadno, String sttreestretnm, String startlnmadr, String startlatitude, String endlnmadr,
			String endlatitude, String sttreeknd, String sttreestretlt, String sttreestretintrcn, String roadnm, String phonenumber,
			String institutionnm, String referencedate, String insttcode, String insttnm, String photourl) {
		super();
		this.roadno = roadno;
		this.sttreestretnm = sttreestretnm;
		this.startlnmadr = startlnmadr;
		this.startlatitude = startlatitude;
		this.endlnmadr = endlnmadr;
		this.endlatitude = endlatitude;
		this.sttreeknd = sttreeknd;
		this.sttreestretlt = sttreestretlt;
		this.sttreestretintrcn = sttreestretintrcn;
		this.roadnm = roadnm;
		this.phonenumber = phonenumber;
		this.institutionnm = institutionnm;
		this.referencedate = referencedate;
		this.insttcode = insttcode;
		this.insttnm = insttnm;
		this.photourl = photourl;
	}

	public RoadVo(String sttreestretnm, String startlnmadr, String startlatitude, String endlnmadr, String endlatitude,
			String sttreeknd, String sttreeco, String sttreestretlt, String pltyear, String sttreestretintrcn,
			String roadnm, String roadknd, String roadsctn, String phonenumber, String institutionnm,
			String referencedate, String insttcode, String insttnm) {
		super();
		this.sttreestretnm = sttreestretnm;
		this.startlnmadr = startlnmadr;
		this.startlatitude = startlatitude;
		this.endlnmadr = endlnmadr;
		this.endlatitude = endlatitude;
		this.sttreeknd = sttreeknd;
		this.sttreeco = sttreeco;
		this.sttreestretlt = sttreestretlt;
		this.pltyear = pltyear;
		this.sttreestretintrcn = sttreestretintrcn;
		this.roadnm = roadnm;
		this.roadknd = roadknd;
		this.roadsctn = roadsctn;
		this.phonenumber = phonenumber;
		this.institutionnm = institutionnm;
		this.referencedate = referencedate;
		this.insttcode = insttcode;
		this.insttnm = insttnm;
	}


	public int getRoadno() {
		return roadno;
	}


	public void setRoadno(int roadno) {
		this.roadno = roadno;
	}


	public String getSttreestretnm() {
		return sttreestretnm;
	}


	public void setSttreestretnm(String sttreestretnm) {
		this.sttreestretnm = sttreestretnm;
	}


	public String getStartlnmadr() {
		return startlnmadr;
	}


	public void setStartlnmadr(String startlnmadr) {
		this.startlnmadr = startlnmadr;
	}


	public String getStartlatitude() {
		return startlatitude;
	}


	public void setStartlatitude(String startlatitude) {
		this.startlatitude = startlatitude;
	}


	public String getEndlnmadr() {
		return endlnmadr;
	}


	public void setEndlnmadr(String endlnmadr) {
		this.endlnmadr = endlnmadr;
	}


	public String getEndlatitude() {
		return endlatitude;
	}


	public void setEndlatitude(String endlatitude) {
		this.endlatitude = endlatitude;
	}


	public String getSttreeknd() {
		return sttreeknd;
	}


	public void setSttreeknd(String sttreeknd) {
		this.sttreeknd = sttreeknd;
	}


	public String getSttreeco() {
		return sttreeco;
	}


	public void setSttreeco(String sttreeco) {
		this.sttreeco = sttreeco;
	}


	public String getSttreestretlt() {
		return sttreestretlt;
	}


	public void setSttreestretlt(String sttreestretlt) {
		this.sttreestretlt = sttreestretlt;
	}


	public String getPltyear() {
		return pltyear;
	}


	public void setPltyear(String pltyear) {
		this.pltyear = pltyear;
	}


	public String getSttreestretintrcn() {
		return sttreestretintrcn;
	}


	public void setSttreestretintrcn(String sttreestretintrcn) {
		this.sttreestretintrcn = sttreestretintrcn;
	}


	public String getRoadnm() {
		return roadnm;
	}


	public void setRoadnm(String roadnm) {
		this.roadnm = roadnm;
	}


	public String getRoadknd() {
		return roadknd;
	}


	public void setRoadknd(String roadknd) {
		this.roadknd = roadknd;
	}


	public String getRoadsctn() {
		return roadsctn;
	}


	public void setRoadsctn(String roadsctn) {
		this.roadsctn = roadsctn;
	}


	public String getPhonenumber() {
		return phonenumber;
	}


	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}


	public String getInstitutionnm() {
		return institutionnm;
	}


	public void setInstitutionnm(String institutionnm) {
		this.institutionnm = institutionnm;
	}


	public String getReferencedate() {
		return referencedate;
	}


	public void setReferencedate(String referencedate) {
		this.referencedate = referencedate;
	}


	public String getInsttcode() {
		return insttcode;
	}


	public void setInsttcode(String insttcode) {
		this.insttcode = insttcode;
	}


	public String getInsttnm() {
		return insttnm;
	}


	public void setInsttnm(String insttnm) {
		this.insttnm = insttnm;
	}


	public String getPhotourl() {
		return photourl;
	}


	public void setPhotourl(String photourl) {
		this.photourl = photourl;
	}


	@Override
	public String toString() {
		return "RoadVo [roadno=" + roadno + ", sttreestretnm=" + sttreestretnm + ", startlnmadr=" + startlnmadr
				+ ", startlatitude=" + startlatitude + ", endlnmadr=" + endlnmadr + ", endlatitude=" + endlatitude
				+ ", sttreeknd=" + sttreeknd + ", sttreeco=" + sttreeco + ", sttreestretlt=" + sttreestretlt
				+ ", pltyear=" + pltyear + ", sttreestretintrcn=" + sttreestretintrcn + ", roadnm=" + roadnm
				+ ", roadknd=" + roadknd + ", roadsctn=" + roadsctn + ", phonenumber=" + phonenumber
				+ ", institutionnm=" + institutionnm + ", referencedate=" + referencedate + ", insttcode=" + insttcode
				+ ", insttnm=" + insttnm + ", photourl=" + photourl + "]";
	}
	
	
}
