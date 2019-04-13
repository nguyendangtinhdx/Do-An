package com.tinhnd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tinhnd.dao.BaoHiemDAO;
import com.tinhnd.model.BaoHiemBEAN;

@Service("BaoHiemService")
@Transactional
public class BaoHiemServiceImpl implements BaoHiemService{

	@Autowired
	private BaoHiemDAO baoHiemDAO;
	
	@Override
	public List<BaoHiemBEAN> findAll() {
		return baoHiemDAO.findAll();
	}

	@Override
	public BaoHiemBEAN findById(String id) {
		return baoHiemDAO.findById(id);
	}

	@Override
	public void create(BaoHiemBEAN baoHiemBEAN) {
		baoHiemDAO.create(baoHiemBEAN);
	}

	@Override
	public void update(BaoHiemBEAN baoHiemBEAN) {
		baoHiemDAO.update(baoHiemBEAN);
	}

	@Override
	public void delete(BaoHiemBEAN baoHiemBEAN) {
		baoHiemDAO.delete(baoHiemBEAN);
	}

	@Override
	public BaoHiemBEAN findTypeInsurranceById(String id) {
		return baoHiemDAO.findTypeInsurranceById(id);
	}

	@Override
	public List<BaoHiemBEAN> findByKey(String key) {
		return baoHiemDAO.findByKey(key);
	}

	@Override
	public Integer findCountByKey(String key) {
		return baoHiemDAO.findCountByKey(key);
	}

}
		