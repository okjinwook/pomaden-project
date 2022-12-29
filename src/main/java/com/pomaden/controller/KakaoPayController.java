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

import com.pomaden.model.MemberDTO;
import com.pomaden.service.CartService;
import com.pomaden.service.KakaoPayService;
import com.pomaden.service.OrderListService;


@Controller
public class KakaoPayController {
	@Autowired private OrderListService os;
	@Autowired private KakaoPayService ks;
	@Autowired private CartService cs;
	
	@GetMapping("/kakaopay/success")
	public ModelAndView success(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int insertRow;
		int deleteRow;
		List<HashMap<String, Object>> insertList = (List<HashMap<String, Object>>) session.getAttribute("list");
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		for(HashMap<String, Object> map : insertList) {
			map.put("orderList_member_id", login.getMember_id());
			insertRow = os.insert(map);
			if(map.get("cart_idx") != null) {
				deleteRow = cs.delete(Integer.parseInt((String)map.get("cart_idx")));
			}
		}
		mav.addObject("list", insertList);
//		session.removeAttribute("list");
		return mav;
	}
	@GetMapping("/kakaopay/fail")
	public void fail(HttpSession session) {
		session.removeAttribute("list");
	}
	@GetMapping("/kakaopay/cancle")
	public void cancle(HttpSession session) {
		session.removeAttribute("list");
	}
	
	
	@ResponseBody
	@PostMapping("/kakaopay/paymentReady")
	public String payment(@RequestBody HashMap<String, HashMap<String, Object>> data , HttpSession session) {
		String result = ks.getResult(data, session);
		return result;	
	}
	
}
