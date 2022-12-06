package com.pomaden.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.CartDAO;
import com.pomaden.model.CartDTO;

@Service
public class CartService {
	@Autowired private CartDAO dao;
	public int insert(HashMap<String, Object> ob) {
		return dao.insert(ob);
	}
	public List<CartDTO> selectAll(String member_id) {
		return dao.selectAll(member_id);
	}
	public int updateCount(HashMap<String, Object> map) {
		return dao.updateCount(map);
	}
	public int cartDelete(int idx) {
		return dao.cartDelete(idx);
	}

}
