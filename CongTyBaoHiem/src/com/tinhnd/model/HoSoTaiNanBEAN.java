package com.tinhnd.model;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "hosotainan")
public class HoSoTaiNanBEAN {
	@Id
	private String id;
	private String bienso;
	private Date ngaytainan;
	private String tentaixe;
	private boolean cobanglaixe;
	private String diadiemtainan;
	private String motathiethai;
	private String anh;
	private Integer mucdothiethai;
	private Integer mucdodenbu;
	private Integer thoihan;
	private Integer sotiendenbu;
	private String lydo;
	private String xacnhandenbu;
	private String mabaohiem;
	private String mataikhoan;
	private String maphieumuabaohiem;
	
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
	public Date getNgaytainan() {
		return ngaytainan;
	}
	public void setNgaytainan(Date ngaytainan) {
		this.ngaytainan = ngaytainan;
	}
	public String getTentaixe() {
		return tentaixe;
	}
	public void setTentaixe(String tentaixe) {
		this.tentaixe = tentaixe;
	}
	public boolean isCobanglaixe() {
		return cobanglaixe;
	}
	public void setCobanglaixe(boolean cobanglaixe) {
		this.cobanglaixe = cobanglaixe;
	}
	public String getDiadiemtainan() {
		return diadiemtainan;
	}
	public void setDiadiemtainan(String diadiemtainan) {
		this.diadiemtainan = diadiemtainan;
	}
	public String getMotathiethai() {
		return motathiethai;
	}
	public void setMotathiethai(String motathiethai) {
		this.motathiethai = motathiethai;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public Integer getMucdothiethai() {
		return mucdothiethai;
	}
	public void setMucdothiethai(Integer mucdothiethai) {
		this.mucdothiethai = mucdothiethai;
	}
	public Integer getMucdodenbu() {
		return mucdodenbu;
	}
	public void setMucdodenbu(Integer mucdodenbu) {
		this.mucdodenbu = mucdodenbu;
	}
	public Integer getThoihan() {
		return thoihan;
	}
	public void setThoihan(Integer thoihan) {
		this.thoihan = thoihan;
	}
	public Integer getSotiendenbu() {
		return sotiendenbu;
	}
	public void setSotiendenbu(Integer sotiendenbu) {
		this.sotiendenbu = sotiendenbu;
	}
	
	public String getLydo() {
		return lydo;
	}
	public void setLydo(String lydo) {
		this.lydo = lydo;
	}
	public String getXacnhandenbu() {
		return xacnhandenbu;
	}
	public void setXacnhandenbu(String xacnhandenbu) {
		this.xacnhandenbu = xacnhandenbu;
	}
	public String getMabaohiem() {
		return mabaohiem;
	}
	public void setMabaohiem(String mabaohiem) {
		this.mabaohiem = mabaohiem;
	}
	public String getMataikhoan() {
		return mataikhoan;
	}
	public void setMataikhoan(String mataikhoan) {
		this.mataikhoan = mataikhoan;
	}
	public String getMaphieumuabaohiem() {
		return maphieumuabaohiem;
	}
	public void setMaphieumuabaohiem(String maphieumuabaohiem) {
		this.maphieumuabaohiem = maphieumuabaohiem;
	}
	
	
	
}
