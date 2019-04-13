package com.tinhnd.service;

import java.util.List;

import com.tinhnd.model.PhieuMuaBaoHiemBEAN;

public interface PhieuMuaBaoHiemService {
	public List<PhieuMuaBaoHiemBEAN> findAll();
	
	public PhieuMuaBaoHiemBEAN findById(String id);
	
	public void create(PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN);
	
	public void update(PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN);

	public void delete(PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN);
	
	public List<PhieuMuaBaoHiemBEAN> findByMataikhoan(String mataikhoan);
	
	public PhieuMuaBaoHiemBEAN findByBienso(String bienso);
	
	public PhieuMuaBaoHiemBEAN checkPhieuMuaBaoHiemExist(String mabaohiem, String bienso, String mataikhoan);
	
	public void updatePaymentByMataikhoan(String mataikhoan, String phuongthucthanhtoan, Integer sotienthanhtoan);
	
	public PhieuMuaBaoHiemBEAN checkPayment(String mataikhoan);
	
	public PhieuMuaBaoHiemBEAN findByMataikhoanSendMail(String mataikhoan);
	
	public List<PhieuMuaBaoHiemBEAN> findAutoDeleteExprirationDate();
	
	public void autoDeleteExprirationDate();
	
	public PhieuMuaBaoHiemBEAN checkGuiMail(String mataikhoan, String mabaohiem);
	
	public void updateGuiMail(String mataikhoan, String mabaohiem);
	
	public List<PhieuMuaBaoHiemBEAN> findByKey(String key);
	
	public Integer countChuaxacnhanThanhtoan();
}
