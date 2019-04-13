package com.tinhnd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tinhnd.dao.TinTucDAO;
import com.tinhnd.model.TinTucBEAN;
@Service("TinTucService")
@Transactional
public class TinTucServiceImpl implements TinTucService{
	
	@Autowired
	private TinTucDAO tinTucDAO; 
	
	@Override
	public List<TinTucBEAN> findAll() {
		return tinTucDAO.findAll();
	}
	
	@Override
	public TinTucBEAN findById(String id) {
		return tinTucDAO.findById(id);
	}

	@Override
	public void create(TinTucBEAN tinTucBEAN) {
		tinTucDAO.create(tinTucBEAN);
	}

	@Override
	public void update(TinTucBEAN tinTucBEAN) {
		tinTucDAO.update(tinTucBEAN);
	}

	@Override
	public void delete(TinTucBEAN tinTucBEAN) {
		tinTucDAO.delete(tinTucBEAN);
	}

	@Override
	public List<TinTucBEAN> findNewsByLoaitintuc(String loaitintuc) {
		return tinTucDAO.findNewsByLoaitintuc(loaitintuc);
	}

	@Override
	public List<TinTucBEAN> findByKey(String key) {
		return tinTucDAO.findByKey(key);
	}

	

}
