package com.pomaden.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.MemberDTO;
import com.pomaden.model.ShippingDTO;
import com.pomaden.service.ShippingService;

@Controller
public class ShippingController {
	@Autowired private ShippingService ss;
	
	@GetMapping("/shipping/shippingList")
	public ModelAndView list(String member_id) {
		ModelAndView mav = new ModelAndView();
		List<ShippingDTO> list = ss.selectAll(member_id);
		mav.addObject("list", list);
		return mav;
	}
	@GetMapping("/shipping/insert")
	public void insertOpen() {}
	
	@GetMapping("/shipping/update")
	public ModelAndView updateOpen(int shipping_idx) {
		ModelAndView mav = new ModelAndView();
		ShippingDTO dto = ss.selectOne(shipping_idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
}
