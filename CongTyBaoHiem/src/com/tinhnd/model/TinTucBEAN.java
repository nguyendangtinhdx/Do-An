package com.tinhnd.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "tintuc")
public class TinTucBEAN {
	@Id
	private String id;
	private String loaitintuc;
	private String tieude;
	private String noidung;
	private String anh; 
	private String duongdan;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoaitintuc() {
		return loaitintuc;
	}
	public void setLoaitintuc(String loaitintuc) {
		this.loaitintuc = loaitintuc;
	}
	public String getTieude() {
		return tieude;
	}
	public void setTieude(String tieude) {
		this.tieude = tieude;
	}
	public String getNoidung() {
		return noidung;
	}
	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getDuongdan() {
		return duongdan;
	}
	public void setDuongdan(String duongdan) {
		this.duongdan = duongdan;
	}
	
}
