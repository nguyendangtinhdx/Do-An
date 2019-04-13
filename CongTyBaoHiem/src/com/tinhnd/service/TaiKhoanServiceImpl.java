package com.tinhnd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tinhnd.dao.TaiKhoanDAO;
import com.tinhnd.model.TaiKhoanBEAN;

@Service("TaiKhoanService")
@Transactional
public class TaiKhoanServiceImpl implements TaiKhoanService{

	@Autowired
	private TaiKhoanDAO taiKhoanDAO;
	
	@Override
	public List<TaiKhoanBEAN> findAll() {
		return taiKhoanDAO.findAll();
	}

	@Override
	public TaiKhoanBEAN findById(String id) {
		return taiKhoanDAO.findById(id);
	}

	@Override
	public void create(TaiKhoanBEAN taiKhoanBEAN) {
		taiKhoanDAO.create(taiKhoanBEAN);
	}

	@Override
	public void update(TaiKhoanBEAN taiKhoanBEAN) {
		taiKhoanDAO.update(taiKhoanBEAN);
	}

	@Override
	public void delete(TaiKhoanBEAN taiKhoanBEAN) {
		taiKhoanDAO.delete(taiKhoanBEAN);
	}

	@Override
	public TaiKhoanBEAN login(String tendangnhap, String matkhau) {
		return taiKhoanDAO.login(tendangnhap, matkhau);
	}

	@Override
	public void signup(TaiKhoanBEAN taiKhoanBEAN) {
		taiKhoanDAO.signup(taiKhoanBEAN);
	}

	@Override
	public void changeProfile(TaiKhoanBEAN taiKhoanBEAN) {
		taiKhoanDAO.changeProfile(taiKhoanBEAN);
	}

	@Override
	public TaiKhoanBEAN findUsername(String tendangnhap) {
		return taiKhoanDAO.findUsername(tendangnhap);
	}

	@Override
	public void updatePaymentByMataikhoan(String id, String nganhang, String sotaikhoan) {
		taiKhoanDAO.updatePaymentByMataikhoan(id, nganhang, sotaikhoan);
	}

	@Override
	public List<TaiKhoanBEAN> findByKey(String key) {
		return taiKhoanDAO.findByKey(key);
	}

}
