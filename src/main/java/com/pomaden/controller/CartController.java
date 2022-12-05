package com.pomaden.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.pomaden.service.CartService;

@Controller
public class CartController {
	@Autowired private CartService cs;
	@GetMapping("/cart/cartList")
	public void cartList() {}
	@PostMapping("/cart/insert")
	public HashMap<String, String> insert(@RequestBody HashMap<String, Object> ob) {
		HashMap<String , String> map = new HashMap<String, String>();
		int row = cs.insert(ob);
		if(row == 1) {
			map.put("msg", "장바구니 등록!!");
		}
		else {
			map.put("msg", "장바구니 실패!!");
		}
		return map;
	}
	
}

