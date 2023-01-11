package com.pomaden.service;

import java.util.HashMap;
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
	public ItemDTO selectOne(HashMap<String, Object> ob) {
		return dao.selectOne(ob);
	}
	public int update(HashMap<String, Object> map) {
		HashMap<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("item_name", map.get("orderList_name"));
		countMap.put("item_color", map.get("orderList_color"));
		countMap.put("item_size", map.get("orderList_size"));
		ItemDTO itemDto = dao.selectOne(countMap);
		int itemCount = itemDto.getItem_count();
		int buyCount = Integer.parseInt(String.valueOf(map.get("orderList_count")));
		int resultCount = itemCount - buyCount;
		map.put("count", resultCount);
		return dao.update(map);
	}

}
