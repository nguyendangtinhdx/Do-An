package com.tinhnd.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.tinhnd.model.TaiKhoanBEAN;

@Repository("TaiKhoanDAO")
public class TaiKhoanDAOImpl implements TaiKhoanDAO{

	@Autowired
	private MongoTemplate mongoTemplate; 
	
	@Override
	public List<TaiKhoanBEAN> findAll() {
		try {
			return mongoTemplate.findAll(TaiKhoanBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public TaiKhoanBEAN findById(String id) {
		try {
			return mongoTemplate.findById(id, TaiKhoanBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void create(TaiKhoanBEAN taiKhoanBEAN) {
		mongoTemplate.insert(taiKhoanBEAN);
	}

	@Override
	public void update(TaiKhoanBEAN taiKhoanBEAN) {
		mongoTemplate.save(taiKhoanBEAN);
	}

	@Override
	public void delete(TaiKhoanBEAN taiKhoanBEAN) {
		mongoTemplate.remove(taiKhoanBEAN);
	}

	@Override
	public TaiKhoanBEAN login(String tendangnhap, String matkhau) {
		try {
			Query query = new Query();
			TaiKhoanBEAN taiKhoanBEAN = mongoTemplate.findOne(query.addCriteria(Criteria.where("tendangnhap").is(tendangnhap)), TaiKhoanBEAN.class);
			if(taiKhoanBEAN != null) {
				BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
				if(bCryptPasswordEncoder.matches(matkhau, taiKhoanBEAN.getMatkhau())) {
					return taiKhoanBEAN;
				}
			}
			return null;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void signup(TaiKhoanBEAN taiKhoanBEAN) {
		mongoTemplate.insert(taiKhoanBEAN);
	}

	@Override
	public void changeProfile(TaiKhoanBEAN taiKhoanBEAN) {
		mongoTemplate.save(taiKhoanBEAN);
	}

	@Override
	public TaiKhoanBEAN findUsername(String tendangnhap) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("tendangnhap").is(tendangnhap));
			return mongoTemplate.findOne(query, TaiKhoanBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void updatePaymentByMataikhoan(String id, String nganhang, String sotaikhoan) {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(id));
		Update update = new Update();
		update.set("nganhang", nganhang);
		update.set("sotaikhoan", sotaikhoan);
		mongoTemplate.updateFirst(query, update, TaiKhoanBEAN.class);
	}

	@Override
	public List<TaiKhoanBEAN> findByKey(String key) {
		try {
			BasicQuery query =  new BasicQuery("{'$or':[{\"loaitaikhoan\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"hoten\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"diachi\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"sodienthoai\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"nganhang\": {$regex : '" + key + "', '$options':'i'}} ]}");
			return	mongoTemplate.find(query, TaiKhoanBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

}
