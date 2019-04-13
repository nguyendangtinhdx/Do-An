package com.tinhnd.service;

import java.util.Date;
import java.util.List;

import com.tinhnd.model.HoSoTaiNanBEAN;

public interface HoSoTaiNanService {
public List<HoSoTaiNanBEAN> findAll();
	
	public HoSoTaiNanBEAN findById(String id);
	
	public void create(HoSoTaiNanBEAN hoSoTaiNanBEAN);
	
	public void update(HoSoTaiNanBEAN hoSoTaiNanBEAN);

	public void delete(HoSoTaiNanBEAN hoSoTaiNanBEAN);
	
	public List<HoSoTaiNanBEAN> findByMataikhoan(String mataikhoan);
	
	public void deleteWhenDeletePhieumuabaohiem(String maphieumuabaohiem);
	
	public Integer findCountHosotainanExist(String bienso);
	
	public void deleteWhenAutoDeletePhieumuabaohiem(String maphieumuabaohiem);
	
	public List<HoSoTaiNanBEAN> findByKey(String key);
	
	public Integer countChuaxacnhanDenbu();
	
	public Integer countSovutainantheonam(Date fromDate, Date toDate);
}
