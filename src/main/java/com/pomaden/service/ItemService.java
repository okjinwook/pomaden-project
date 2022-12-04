package com.pomaden.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.ItemDAO;
import com.pomaden.model.ItemDTO;

@Service
public class ItemService {
	@Autowired private ItemDAO dao;
	public int insert(ItemDTO dto) {
		return dao.insert(dto);
	}
	public List<String> getItemSize(String product_name) {
		return dao.selectSize(product_name);
	}
	public List<String> getItemColor(String product_name) {
		return dao.selectColor(product_name);
	}

}
