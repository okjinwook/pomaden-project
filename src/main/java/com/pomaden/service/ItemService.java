package com.pomaden.service;

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

}
