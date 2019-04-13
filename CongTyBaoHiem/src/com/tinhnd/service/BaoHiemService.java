package com.tinhnd.service;

import java.util.List;

import com.tinhnd.model.BaoHiemBEAN;

public interface BaoHiemService {
	public List<BaoHiemBEAN> findAll();
	
	public BaoHiemBEAN findById(String id);
	
	public void create(BaoHiemBEAN baoHiemBEAN);
	
	public void update(BaoHiemBEAN baoHiemBEAN);

	public void delete(BaoHiemBEAN baoHiemBEAN);
	
	public BaoHiemBEAN findTypeInsurranceById(String id);
	
	public List<BaoHiemBEAN> findByKey(String key);
	
	public Integer findCountByKey(String key);
}
