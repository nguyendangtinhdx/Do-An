package com.tinhnd.model;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "phieumuabaohiem")
public class PhieuMuaBaoHiemBEAN {
	@Id
	private String id;
	private String bienso;
	private String sochongoi;
	private Date ngaymua;
	private Date ngayhethan;
	private Integer thoihan;
	private Integer goibaohiem;
	private Integer sotienthucthu;
	private String phuongthucthanhtoan;
	private Integer sotienthanhtoan;
	private String trangthaithanhtoan;
	private boolean guimail;
	private String mabaohiem;
	private String loaibaohiem;
	private String mataikhoan;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBienso() {
		return bienso;
	}
	public void setBienso(String bienso) {
		this.bienso = bienso;
	}
	public String getSochongoi() {
		return sochongoi;
	}
	public void setSochongoi(String sochongoi) {
		this.sochongoi = sochongoi;
	}
	public Date getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}
	public Date getNgayhethan() {
		return ngayhethan;
	}
	public void setNgayhethan(Date ngayhethan) {
		this.ngayhethan = ngayhethan;
	}
	public Integer getThoihan() {
		return thoihan;
	}
	public void setThoihan(Integer thoihan) {
		this.thoihan = thoihan;
	}
	public Integer getGoibaohiem() {
		return goibaohiem;
	}
	public void setGoibaohiem(Integer goibaohiem) {
		this.goibaohiem = goibaohiem;
	}
	public Integer getSotienthucthu() {
		return sotienthucthu;
	}
	public void setSotienthucthu(Integer sotienthucthu) {
		this.sotienthucthu = sotienthucthu;
	}
	public String getPhuongthucthanhtoan() {
		return phuongthucthanhtoan;
	}
	public void setPhuongthucthanhtoan(String phuongthucthanhtoan) {
		this.phuongthucthanhtoan = phuongthucthanhtoan;
	}
	public Integer getSotienthanhtoan() {
		return sotienthanhtoan;
	}
	public void setSotienthanhtoan(Integer sotienthanhtoan) {
		this.sotienthanhtoan = sotienthanhtoan;
	}
	public String getTrangthaithanhtoan() {
		return trangthaithanhtoan;
	}
	public void setTrangthaithanhtoan(String trangthaithanhtoan) {
		this.trangthaithanhtoan = trangthaithanhtoan;
	}
	public boolean isGuimail() {
		return guimail;
	}
	public void setGuimail(boolean guimail) {
		this.guimail = guimail;
	}
	public String getMabaohiem() {
		return mabaohiem;
	}
	public void setMabaohiem(String mabaohiem) {
		this.mabaohiem = mabaohiem;
	}
	
	public String getLoaibaohiem() {
		return loaibaohiem;
	}
	public void setLoaibaohiem(String loaibaohiem) {
		this.loaibaohiem = loaibaohiem;
	}
	public String getMataikhoan() {
		return mataikhoan;
	}
	public void setMataikhoan(String mataikhoan) {
		this.mataikhoan = mataikhoan;
	}
	
	
	
}
