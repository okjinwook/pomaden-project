package com.pomaden.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.LikeProductDAO;
import com.pomaden.model.LikeProductDTO;

@Service
public class LikeProductService {
	@Autowired private LikeProductDAO dao;
	public int insert(HashMap<String, Object> map) {
		return dao.insert(map);
	}
	public List<LikeProductDTO> selectAll(String member_id) {
		return dao.selectAll(member_id);
	}
	public LikeProductDTO selectOne(String product_name, String member_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("product_name", product_name);
		map.put("member_id", member_id);
		return dao.selectOne(map);
	}
	public int delete(HashMap<String, Object> map) {
		return dao.delete(map);
	}

}
