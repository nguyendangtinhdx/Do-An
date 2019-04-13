package com.tinhnd.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "baohiem")
public class BaoHiemBEAN {
	@Id
	private String id;
	private String loaibaohiem;
	private Integer dongia;
	private String anh; 
	private String mota;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoaibaohiem() {
		return loaibaohiem;
	}
	public void setLoaibaohiem(String loaibaohiem) {
		this.loaibaohiem = loaibaohiem;
	}
	public Integer getDongia() {
		return dongia;
	}
	public void setDongia(Integer dongia) {
		this.dongia = dongia;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	
}
