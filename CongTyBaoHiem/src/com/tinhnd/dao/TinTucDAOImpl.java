package com.tinhnd.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.tinhnd.model.TinTucBEAN;

@Repository("TinTucDAO")
public class TinTucDAOImpl implements TinTucDAO{
	
	@Autowired
	private MongoTemplate mongoTemplate;

	@Override
	public List<TinTucBEAN> findAll() {
		try {
			return mongoTemplate.findAll(TinTucBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public TinTucBEAN findById(String id) {
		try {
			return mongoTemplate.findById(id, TinTucBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void create(TinTucBEAN tinTucBEAN) {
		mongoTemplate.insert(tinTucBEAN);
	}

	@Override
	public void update(TinTucBEAN tinTucBEAN) {
		mongoTemplate.save(tinTucBEAN);
	}

	@Override
	public void delete(TinTucBEAN tinTucBEAN) {
		mongoTemplate.remove(tinTucBEAN);
	}

	@Override
	public List<TinTucBEAN> findNewsByLoaitintuc(String loaitintuc) {
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("loaitintuc").is(loaitintuc));
			return mongoTemplate.find(query, TinTucBEAN.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<TinTucBEAN> findByKey(String key) {
		try {
			BasicQuery query =  new BasicQuery("{'$or':[{\"loaitintuc\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"tieude\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"noidung\": {$regex : '" + key + "', '$options':'i'}}, "
					+ "{\"duongdan\": {$regex : '" + key + "', '$options':'i'}} ]}");
			return	mongoTemplate.find(query, TinTucBEAN.class);
		} catch (Exception e) {
			return null;
		}
	} 
	
	
}
