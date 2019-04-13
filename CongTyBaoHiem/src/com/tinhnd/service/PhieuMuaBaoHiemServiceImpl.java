package com.tinhnd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tinhnd.dao.PhieuMuaBaoHiemDAO;
import com.tinhnd.model.PhieuMuaBaoHiemBEAN;

@Service("PhieuMuaBaoHiemService")
@Transactional
public class PhieuMuaBaoHiemServiceImpl implements PhieuMuaBaoHiemService{

	@Autowired
	private PhieuMuaBaoHiemDAO phieuMuaBaoHiemDAO;
	
	@Override
	public List<PhieuMuaBaoHiemBEAN> findAll() {
		return phieuMuaBaoHiemDAO.findAll();
	}

	@Override
	public PhieuMuaBaoHiemBEAN findById(String id) {
		return phieuMuaBaoHiemDAO.findById(id);
	}

	@Override
	public void create(PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN) {
		phieuMuaBaoHiemDAO.create(phieuMuaBaoHiemBEAN);
	}

	@Override
	public void update(PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN) {
		phieuMuaBaoHiemDAO.update(phieuMuaBaoHiemBEAN);
	}

	@Override
	public void delete(PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN) {
		phieuMuaBaoHiemDAO.delete(phieuMuaBaoHiemBEAN);
	}

	@Override
	public List<PhieuMuaBaoHiemBEAN> findByMataikhoan(String mataikhoan) {
		return phieuMuaBaoHiemDAO.findByMataikhoan(mataikhoan);
	}

	@Override
	public PhieuMuaBaoHiemBEAN findByBienso(String bienso) {
		return phieuMuaBaoHiemDAO.findByBienso(bienso);
	}

	@Override
	public PhieuMuaBaoHiemBEAN checkPhieuMuaBaoHiemExist(String mabaohiem, String bienso, String mataikhoan) {
		return phieuMuaBaoHiemDAO.checkPhieuMuaBaoHiemExist(mabaohiem, bienso, mataikhoan);
	}

	@Override
	public void updatePaymentByMataikhoan(String mataikhoan, String phuongthucthanhtoan, Integer sotienthanhtoan) {
		phieuMuaBaoHiemDAO.updatePaymentByMataikhoan(mataikhoan, phuongthucthanhtoan, sotienthanhtoan);
	}

	@Override
	public PhieuMuaBaoHiemBEAN checkPayment(String mataikhoan) {
		return phieuMuaBaoHiemDAO.checkPayment(mataikhoan);
	}

	@Override
	public PhieuMuaBaoHiemBEAN findByMataikhoanSendMail(String mataikhoan) {
		return phieuMuaBaoHiemDAO.findByMataikhoanSendMail(mataikhoan);
	}

	@Override
	public void autoDeleteExprirationDate() {
		phieuMuaBaoHiemDAO.autoDeleteExprirationDate();
	}
	
	@Override
	public PhieuMuaBaoHiemBEAN checkGuiMail(String mataikhoan, String mabaohiem) {
		return phieuMuaBaoHiemDAO.checkGuiMail(mataikhoan, mabaohiem);
	}

	@Override
	public void updateGuiMail(String mataikhoan, String mabaohiem) {
		phieuMuaBaoHiemDAO.updateGuiMail(mataikhoan, mabaohiem);
	}

	@Override
	public List<PhieuMuaBaoHiemBEAN> findAutoDeleteExprirationDate() {
		return phieuMuaBaoHiemDAO.findAutoDeleteExprirationDate();
	}

	@Override
	public List<PhieuMuaBaoHiemBEAN> findByKey(String key) {
		return phieuMuaBaoHiemDAO.findByKey(key);
	}

	@Override
	public Integer countChuaxacnhanThanhtoan() {
		return phieuMuaBaoHiemDAO.countChuaxacnhanThanhtoan();
	}

	


}
