package com.member.vo;



public class MemberVo {

	private String id;
	private String pw;
	private String u_name;
	private String n_id;
	private String u_birthday;
	private int u_sex;
	private String zonecode;
	private String sido;
	private String sigungu;
	private String roadname;
	private String d_juso;
	private String email;
	private String tel;
	private String u_enrollday;
	private String status;
	private String manage;
	private int petcount;
	private String friend;
	private String f_id;


	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVo(String id, String pw, String u_name, String n_id, String u_birthday, int u_sex, String zonecode,
			String sido, String sigungu, String roadname, String d_juso, String email, String tel, String u_enrollday,
			String status, String manage, int petcount, String friend, String f_id) {
		super();
		this.id = id;
		this.pw = pw;
		this.u_name = u_name;
		this.n_id = n_id;
		this.u_birthday = u_birthday;
		this.u_sex = u_sex;
		this.zonecode = zonecode;
		this.sido = sido;
		this.sigungu = sigungu;
		this.roadname = roadname;
		this.d_juso = d_juso;
		this.email = email;
		this.tel = tel;
		this.u_enrollday = u_enrollday;
		this.status = status;
		this.manage = manage;
		this.petcount = petcount;
		this.friend = friend;
		this.f_id = f_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getN_id() {
		return n_id;
	}

	public void setN_id(String n_id) {
		this.n_id = n_id;
	}

	public String getU_birthday() {
		return u_birthday;
	}

	public void setU_birthday(String u_birthday) {
		this.u_birthday = u_birthday;
	}

	public int getU_sex() {
		return u_sex;
	}

	public void setU_sex(int u_sex) {
		this.u_sex = u_sex;
	}

	public String getZonecode() {
		return zonecode;
	}

	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getSigungu() {
		return sigungu;
	}

	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}

	public String getRoadname() {
		return roadname;
	}

	public void setRoadname(String roadname) {
		this.roadname = roadname;
	}

	public String getD_juso() {
		return d_juso;
	}

	public void setD_juso(String d_juso) {
		this.d_juso = d_juso;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getU_enrollday() {
		return u_enrollday;
	}

	public void setU_enrollday(String u_enrollday) {
		this.u_enrollday = u_enrollday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getManage() {
		return manage;
	}

	public void setManage(String manage) {
		this.manage = manage;
	}

	public int getPetcount() {
		return petcount;
	}

	public void setPetcount(int petcount) {
		this.petcount = petcount;
	}

	public String getFriend() {
		return friend;
	}

	public void setFriend(String friend) {
		this.friend = friend;
	}

	public String getF_id() {
		return f_id;
	}

	public void setF_id(String f_id) {
		this.f_id = f_id;
	}

	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", pw=" + pw + ", u_name=" + u_name + ", n_id=" + n_id + ", u_birthday="
				+ u_birthday + ", u_sex=" + u_sex + ", zonecode=" + zonecode + ", sido=" + sido + ", sigungu=" + sigungu
				+ ", roadname=" + roadname + ", d_juso=" + d_juso + ", email=" + email + ", tel=" + tel
				+ ", u_enrollday=" + u_enrollday + ", status=" + status + ", manage=" + manage + ", petcount="
				+ petcount + ", friend=" + friend + ", f_id=" + f_id + "]";
	}
}
