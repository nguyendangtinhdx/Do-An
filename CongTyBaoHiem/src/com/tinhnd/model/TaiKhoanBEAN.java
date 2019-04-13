package com.tinhnd.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "taikhoan")
public class TaiKhoanBEAN {
	@Id
	private String id;
	private String tendangnhap;
	private String matkhau;
	private String loaitaikhoan;
	private String hoten;
	private String diachi;
	private String sodienthoai;
	private String nganhang;
	private String sotaikhoan;
	
	public TaiKhoanBEAN() {
		super();
	}
	public TaiKhoanBEAN(String tendangnhap, String matkhau) {
		super();
		this.tendangnhap = tendangnhap;
		this.matkhau = matkhau;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTendangnhap() {
		return tendangnhap;
	}
	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	public String getLoaitaikhoan() {
		return loaitaikhoan;
	}
	public void setLoaitaikhoan(String loaitaikhoan) {
		this.loaitaikhoan = loaitaikhoan;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getSodienthoai() {
		return sodienthoai;
	}
	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}
	public String getNganhang() {
		return nganhang;
	}
	public void setNganhang(String nganhang) {
		this.nganhang = nganhang;
	}
	public String getSotaikhoan() {
		return sotaikhoan;
	}
	public void setSotaikhoan(String sotaikhoan) {
		this.sotaikhoan = sotaikhoan;
	}
	
	
	
}
