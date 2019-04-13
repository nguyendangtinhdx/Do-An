package com.tinhnd.service;

import java.util.List;

import com.tinhnd.model.TaiKhoanBEAN;

public interface TaiKhoanService {
	
	public List<TaiKhoanBEAN> findAll();
	
	public TaiKhoanBEAN findById(String id);
	
	public void create(TaiKhoanBEAN taiKhoanBEAN);
	
	public void update(TaiKhoanBEAN taiKhoanBEAN);

	public void delete(TaiKhoanBEAN taiKhoanBEAN);
	
	public TaiKhoanBEAN login(String tendangnhap, String matkhau);

	public void signup(TaiKhoanBEAN taiKhoanBEAN);
	
	public void changeProfile(TaiKhoanBEAN taiKhoanBEAN);
	
	public TaiKhoanBEAN findUsername(String tendangnhap);
	
	public void updatePaymentByMataikhoan(String id, String nganhang, String sotaikhoan);
	
	public List<TaiKhoanBEAN> findByKey(String key);
}
