package com.tinhnd.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.tinhnd.model.PhieuMuaBaoHiemBEAN;

@Repository("PhieuMuaBaoHiemDAO")
public class PhieuMuaBaoHiemDAOImpl implements PhieuMuaBaoHiemDAO{

	@Autowired
	private MongoTemplate mongoTemplate;
	
	@Override
	public List<PhieuMuaBaoHiemBEAN> findAll() {
		try {
			return mongoTemplate.findAll(PhieuMuaBaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public PhieuMuaBaoHiemBEAN findById(String id) {
		try {
			return mongoTemplate.findById(id, PhieuMuaBaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void create(PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN) {
		mongoTemplate.insert(phieuMuaBaoHiemBEAN);
	}

	@Override
	public void update(PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN) {
		mongoTemplate.save(phieuMuaBaoHiemBEAN);
	}

	@Override
	public void delete(PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN) {
		mongoTemplate.remove(phieuMuaBaoHiemBEAN);
	}

	@Override
	public List<PhieuMuaBaoHiemBEAN> findByMataikhoan(String mataikhoan) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("mataikhoan").is(mataikhoan));
			return mongoTemplate.find(query, PhieuMuaBaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public PhieuMuaBaoHiemBEAN findByBienso(String bienso) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("bienso").is(bienso));
			return mongoTemplate.findOne(query, PhieuMuaBaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public PhieuMuaBaoHiemBEAN checkPhieuMuaBaoHiemExist(String mabaohiem, String bienso, String mataikhoan) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("mabaohiem").is(mabaohiem).and("bienso").is(bienso).and("mataikhoan").is(mataikhoan));
			return mongoTemplate.findOne(query, PhieuMuaBaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void updatePaymentByMataikhoan(String mataikhoan, String phuongthucthanhtoan, Integer sotienthanhtoan) {
		Query query = new Query();
		query.addCriteria(Criteria.where("mataikhoan").is(mataikhoan).orOperator(Criteria.where("trangthaithanhtoan").is("Chưa thanh toán")));
		Update update = new Update();
		update.set("phuongthucthanhtoan", phuongthucthanhtoan);
		update.set("sotienthanhtoan", sotienthanhtoan);
		update.set("trangthaithanhtoan", "Đang chờ xác nhận...");
		mongoTemplate.updateMulti(query, update, PhieuMuaBaoHiemBEAN.class);
	}

	@Override
	public PhieuMuaBaoHiemBEAN checkPayment(String mataikhoan) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("mataikhoan").is(mataikhoan).and("trangthaithanhtoan").is("Chưa thanh toán"));
			return mongoTemplate.findOne(query, PhieuMuaBaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public PhieuMuaBaoHiemBEAN findByMataikhoanSendMail(String mataikhoan) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("mataikhoan").is(mataikhoan));
			return mongoTemplate.findOne(query, PhieuMuaBaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public List<PhieuMuaBaoHiemBEAN> findAutoDeleteExprirationDate() {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("ngayhethan").lt(new Date()));
			return mongoTemplate.findAllAndRemove(query, PhieuMuaBaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void autoDeleteExprirationDate() {
		Query query = new Query();
		query.addCriteria(Criteria.where("ngayhethan").lt(new Date()));
		mongoTemplate.findAllAndRemove(query, PhieuMuaBaoHiemBEAN.class);
	}

	@Override
	public PhieuMuaBaoHiemBEAN checkGuiMail(String mataikhoan, String mabaohiem) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("mataikhoan").is(mataikhoan).and("mabaohiem").is(mabaohiem));
			return mongoTemplate.findOne(query, PhieuMuaBaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void updateGuiMail(String mataikhoan, String mabaohiem) {
		Query query = new Query();
		query.addCriteria(Criteria.where("mataikhoan").is(mataikhoan).and("mabaohiem").is(mabaohiem));
		Update update = new Update();
		update.set("guimail", true);
		mongoTemplate.updateFirst(query, update, PhieuMuaBaoHiemBEAN.class);
	}

	@Override
	public List<PhieuMuaBaoHiemBEAN> findByKey(String key) {
		try {
			BasicQuery query =  new BasicQuery("{'$or':[{\"bienso\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"sochongoi\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"trangthaithanhtoan\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"loaibaohiem\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"phuongthucthanhtoan\": {$regex : '" + key + "', '$options':'i'}} ]}");
			return	mongoTemplate.find(query, PhieuMuaBaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Integer countChuaxacnhanThanhtoan() {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("trangthaithanhtoan").is("Đang chờ xác nhận..."));
			return (int) mongoTemplate.count(query, PhieuMuaBaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}



}
