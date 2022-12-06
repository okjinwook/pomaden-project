package com.pomaden.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.service.ItemService;

@Controller
public class ItemController {
	@Autowired private ItemService is;
	
	@PostMapping("/item/getCount")
	@ResponseBody
	public HashMap<String, String> getCount(@RequestBody HashMap<String, Object> ob) {
		HashMap<String, String> map = new HashMap<String, String>();
		String count = is.getCount(ob);
		map.put("count", count);
		return map;
	}
}
