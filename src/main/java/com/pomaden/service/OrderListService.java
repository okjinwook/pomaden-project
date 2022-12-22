package com.pomaden.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.OrderListDAO;
import com.pomaden.model.OrderListDTO;

@Service
public class OrderListService {
	@Autowired private OrderListDAO dao;
	
	public int insert(HashMap<String, Object> map) {
		return dao.insert(map);
	}

	public List<OrderListDTO> selectList(String member_id) {
		return dao.selectList(member_id);
	}

}
