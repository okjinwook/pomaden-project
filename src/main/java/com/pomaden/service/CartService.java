package com.pomaden.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.CartDAO;

@Service
public class CartService {
	@Autowired private CartDAO dao;
	public int insert(HashMap<String, Object> ob) {
		return dao.insert(ob);
	}

}
