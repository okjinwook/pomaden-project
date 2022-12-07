package com.pomaden.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.CartDTO;
import com.pomaden.model.MemberDTO;
import com.pomaden.service.CartService;

@Controller
public class CartController {
	@Autowired private CartService cs;
	
	@GetMapping("/cart/cartList")
	public ModelAndView cartList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		List<CartDTO> list = cs.selectAll(login.getMember_id());
		mav.addObject("list", list);
		return mav;
	}
	
	
	@ResponseBody
	@PostMapping("/cart/insert")
	public HashMap<String, String> insert(@RequestBody HashMap<String, Object> ob) {
		HashMap<String , String> map = new HashMap<String, String>();
		CartDTO check = cs.selectOne(ob);
		int row = 0;
		if(check != null) {
			map.put("msg", "이미 등록되어있는 상품입니다, 추가하시겠습니까?");
			map.put("confirm", "confirm");
			map.put("cart_count", check.getCart_count() + "");
			map.put("cart_idx", check.getCart_idx() + "");
		}
		else {
			row = cs.insert(ob);
			if(row == 1) {
				map.put("msg", "장바구니에 등록되었습니다.");
			}
			else {
				map.put("msg", "장바구니 등록에 실패하였습니다.");
			}
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/cart/update")
	public int updateCount(@RequestBody HashMap<String, Object> map) {
		int row = cs.update(map);
		return row;
	}
	
	@PostMapping("/cart/cartDelete")
	public ModelAndView cartDelete(int idx) {
		ModelAndView mav = new ModelAndView("redirect:/cart/cartList");
		int row = cs.cartDelete(idx);
		if(row == 1) {
			mav.addObject("msg", "장바구니에서 삭제되었습니다.");
		}
		else {
			mav.addObject("msg", "장바구니에서 삭제를 실패하였습니다.");
		}
		return mav;
	}
	
}

