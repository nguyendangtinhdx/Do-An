package com.tinhnd.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.tinhnd.model.HoSoTaiNanBEAN;

@Repository("HoSoTaiNanDAO")
public class HoSoTaiNanDAOImpl implements HoSoTaiNanDAO{

	@Autowired
	private MongoTemplate mongoTemplate;
	
	@Override
	public List<HoSoTaiNanBEAN> findAll() {
		try {
		 	return mongoTemplate.findAll(HoSoTaiNanBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public HoSoTaiNanBEAN findById(String id) {
		try {
			return mongoTemplate.findById(id, HoSoTaiNanBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void create(HoSoTaiNanBEAN hoSoTaiNanBEAN) {
		mongoTemplate.insert(hoSoTaiNanBEAN);
	}

	@Override
	public void update(HoSoTaiNanBEAN hoSoTaiNanBEAN) {
		mongoTemplate.save(hoSoTaiNanBEAN);
	}

	@Override
	public void delete(HoSoTaiNanBEAN hoSoTaiNanBEAN) {
		mongoTemplate.remove(hoSoTaiNanBEAN);
	}

	@Override
	public List<HoSoTaiNanBEAN> findByMataikhoan(String mataikhoan) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("mataikhoan").is(mataikhoan));
			return mongoTemplate.find(query, HoSoTaiNanBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void deleteWhenDeletePhieumuabaohiem(String maphieumuabaohiem) {
		Query query = new Query();
		query.addCriteria(Criteria.where("maphieumuabaohiem").is(maphieumuabaohiem));
		mongoTemplate.remove(query, HoSoTaiNanBEAN.class);
	}

	@Override
	public Integer findCountHosotainanExist(String bienso) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("bienso").is(bienso));
			return (int) mongoTemplate.count(query, HoSoTaiNanBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void deleteWhenAutoDeletePhieumuabaohiem(String maphieumuabaohiem) {
		Query query = new Query();
		query.addCriteria(Criteria.where("maphieumuabaohiem").is(maphieumuabaohiem));
		mongoTemplate.findAllAndRemove(query, HoSoTaiNanBEAN.class);
	}

	@Override
	public List<HoSoTaiNanBEAN> findByKey(String key) {
		try {
			BasicQuery query =  new BasicQuery("{'$or':[{\"bienso\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"tentaixe\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"diadiemtainan\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"motathiethai\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"xacnhandenbu\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"lydo\": {$regex : '" + key + "', '$options':'i'}} ]}");
			return	mongoTemplate.find(query, HoSoTaiNanBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Integer countChuaxacnhanDenbu() {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("xacnhandenbu").is("Đang chờ xác nhận..."));
			return (int) mongoTemplate.count(query, HoSoTaiNanBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Integer countSovutainantheonam(Date fromDate, Date toDate) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("ngaytainan").gte(fromDate).lte(toDate));
			return (int) mongoTemplate.count(query, HoSoTaiNanBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}


}
