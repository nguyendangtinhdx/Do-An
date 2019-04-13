package com.tinhnd.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.tinhnd.model.BaoHiemBEAN;

@Repository("BaoHiemDAO")
public class BaoHiemDaoImpl implements BaoHiemDAO{
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	@Override
	public List<BaoHiemBEAN> findAll() {
		try {
			return mongoTemplate.findAll(BaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public BaoHiemBEAN findById(String id) {
		try {
			return mongoTemplate.findById(id, BaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void create(BaoHiemBEAN baoHiemBEAN) {
		mongoTemplate.insert(baoHiemBEAN);
	}

	@Override
	public void update(BaoHiemBEAN baoHiemBEAN) {
		mongoTemplate.save(baoHiemBEAN);
	}

	@Override
	public void delete(BaoHiemBEAN baoHiemBEAN) {
		mongoTemplate.remove(baoHiemBEAN);
	}

	@Override
	public BaoHiemBEAN findTypeInsurranceById(String id) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("id").is(id));
			return mongoTemplate.findOne(query, BaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<BaoHiemBEAN> findByKey(String key) {
		try {
			BasicQuery query =  new BasicQuery("{'$or':[{\"loaibaohiem\": {$regex : '" + key + "', '$options':'i'}}, "
//					+ "{dongia: {$eq : " + Integer.parseInt(key) + "}}, "
					+ "{\"mota\": {$regex : '" + key + "', '$options':'i'}} ]}");
			return	mongoTemplate.find(query, BaoHiemBEAN.class);
			
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Integer findCountByKey(String key) {
		try {
			BasicQuery query =  new BasicQuery("{'$or':[{\"loaibaohiem\": {$regex : '" + key + "', '$options':'i'}}, "
//					+ "{dongia: {$eq : " + Integer.parseInt(key) + "}}, "
					+ "{\"mota\": {$regex : '" + key + "', '$options':'i'}} ]}");
			return (int) mongoTemplate.count(query, BaoHiemBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}


}
