package com.tinhnd.service;

import java.util.List;

import com.tinhnd.model.TinTucBEAN;

public interface TinTucService {
	
	public List<TinTucBEAN> findAll();
	
	public TinTucBEAN findById(String id);
	
	public void create(TinTucBEAN tinTucBEAN);
	
	public void update(TinTucBEAN tinTucBEAN);

	public void delete(TinTucBEAN tinTucBEAN);
	
	public List<TinTucBEAN> findNewsByLoaitintuc(String loaitintuc);
	
	public List<TinTucBEAN> findByKey(String key);
}
