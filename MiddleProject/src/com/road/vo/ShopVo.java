package com.road.vo;

public class ShopVo {

	private String shopname;
	private String shoptypem;
	private String shoptypes;  
	private String sic; 
	private String sigungu;
	private String address;
	private String longitude;
	private String latitude;
	
	public ShopVo(String shopname, String shoptypem, String shoptypes, String sic, String sigungu, String address,
			String longitude, String latitude) {
		super();
		this.shopname = shopname;
		this.shoptypem = shoptypem;
		this.shoptypes = shoptypes;
		this.sic = sic;
		this.sigungu = sigungu;
		this.address = address;
		this.longitude = longitude;
		this.latitude = latitude;
	}
	
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getShoptypem() {
		return shoptypem;
	}
	public void setShoptypem(String shoptypem) {
		this.shoptypem = shoptypem;
	}
	public String getShoptypes() {
		return shoptypes;
	}
	public void setShoptypes(String shoptypes) {
		this.shoptypes = shoptypes;
	}
	public String getSic() {
		return sic;
	}
	public void setSic(String sic) {
		this.sic = sic;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	
	
	
	
}
