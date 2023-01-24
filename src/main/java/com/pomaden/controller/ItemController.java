package com.pomaden.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pomaden.model.ItemDTO;
import com.pomaden.service.ItemService;

@Controller
public class ItemController {
	@Autowired private ItemService is;
	
	@PostMapping("/item/getCount")
	@ResponseBody
	public HashMap<String, Integer> getCount(@RequestBody HashMap<String, Object> ob) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		ItemDTO count = is.selectOne(ob);
		map.put("count", count.getItem_count());
		return map;
	}
}
