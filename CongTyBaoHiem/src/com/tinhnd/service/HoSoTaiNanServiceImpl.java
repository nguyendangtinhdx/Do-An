package com.tinhnd.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tinhnd.dao.HoSoTaiNanDAO;
import com.tinhnd.model.HoSoTaiNanBEAN;

@Service("HoSoTaiNanService")
@Transactional
public class HoSoTaiNanServiceImpl implements HoSoTaiNanService{

	@Autowired
	private HoSoTaiNanDAO hoSoTaiNanDAO;
	
	@Override
	public List<HoSoTaiNanBEAN> findAll() {
		return hoSoTaiNanDAO.findAll();
	}

	@Override
	public HoSoTaiNanBEAN findById(String id) {
		return hoSoTaiNanDAO.findById(id);
	}

	@Override
	public void create(HoSoTaiNanBEAN hoSoTaiNanBEAN) {
		hoSoTaiNanDAO.create(hoSoTaiNanBEAN);
	}

	@Override
	public void update(HoSoTaiNanBEAN hoSoTaiNanBEAN) {
		hoSoTaiNanDAO.update(hoSoTaiNanBEAN);
	}

	@Override
	public void delete(HoSoTaiNanBEAN hoSoTaiNanBEAN) {
		hoSoTaiNanDAO.delete(hoSoTaiNanBEAN);
	}

	@Override
	public List<HoSoTaiNanBEAN> findByMataikhoan(String mataikhoan) {
		return hoSoTaiNanDAO.findByMataikhoan(mataikhoan);
	}

	@Override
	public void deleteWhenDeletePhieumuabaohiem(String maphieumuabaohiem) {
		hoSoTaiNanDAO.deleteWhenDeletePhieumuabaohiem(maphieumuabaohiem);
	}

	@Override
	public Integer findCountHosotainanExist(String bienso) {
		return hoSoTaiNanDAO.findCountHosotainanExist(bienso);
	}

	@Override
	public void deleteWhenAutoDeletePhieumuabaohiem(String maphieumuabaohiem) {
		hoSoTaiNanDAO.deleteWhenAutoDeletePhieumuabaohiem(maphieumuabaohiem);
	}

	@Override
	public List<HoSoTaiNanBEAN> findByKey(String key) {
		return hoSoTaiNanDAO.findByKey(key);
	}

	@Override
	public Integer countChuaxacnhanDenbu() {
		return hoSoTaiNanDAO.countChuaxacnhanDenbu();
	}

	@Override
	public Integer countSovutainantheonam(Date fromDate, Date toDate) {
		return hoSoTaiNanDAO.countSovutainantheonam(fromDate, toDate);
	}



}
