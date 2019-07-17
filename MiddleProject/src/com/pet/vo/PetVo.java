package com.pet.vo;

//id, p_name, p_sex, p_size, p_birthdate
public class PetVo {
	private String id; // PK
	private String p_name; // PK
	private String p_sex;
	private String p_size;
	private String p_birthdate;
	
	public PetVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PetVo(String id, String p_name, String p_sex, String p_size, String p_birthdate) {
		super();
		this.id = id;
		this.p_name = p_name;
		this.p_sex = p_sex;
		this.p_size = p_size;
		this.p_birthdate = p_birthdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_sex() {
		return p_sex;
	}
	public void setP_sex(String p_sex) {
		this.p_sex = p_sex;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public String getP_birthdate() {
		return p_birthdate;
	}
	public void setP_birthdate(String p_birthdate) {
		this.p_birthdate = p_birthdate;
	}
	@Override
	public String toString() {
		return "PetVo [id=" + id + ", p_name=" + p_name + ", p_sex=" + p_sex + ", p_size=" + p_size + ", p_birthdate="
				+ p_birthdate + "]";
	}
	
	
}
