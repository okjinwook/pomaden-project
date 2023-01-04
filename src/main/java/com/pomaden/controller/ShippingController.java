package com.pomaden.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@PostMapping("/shipping/insert")
	public ModelAndView insert(ShippingDTO dto) {
		ModelAndView mav = new ModelAndView();
		int row = ss.insert(dto);
		if(row == 1) {
			 mav.addObject("msg", "정상적으로 배송지가 추가되었습니다.");
			 mav.setViewName("redirect:/shipping/insert");
		}
		else {
			 mav.addObject("msg", "배송지 추가 실패!!");
			 mav.setViewName("redirect:/shipping/insert");
		}
 		return mav;
	}
	
	@GetMapping("/shipping/update")
	public ModelAndView updateOpen(int shipping_idx) {
		ModelAndView mav = new ModelAndView();
		ShippingDTO dto = ss.selectOne(shipping_idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/shipping/update")
	public ModelAndView update(ShippingDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/shipping/update?shipping_idx=" + dto.getShipping_idx());
		int row = ss.update(dto);
		if(row == 1) {
			 mav.addObject("msg", "정상적으로 배송지가 수정되었습니다.");
		}
		else {
			 mav.addObject("msg", "배송지 수정 실패!!");
		}
		return mav;
	}
	@ResponseBody
	@PostMapping("shipping/delete")
	public HashMap<String, String> delete(int shipping_idx) {
		HashMap<String , String> resp = new HashMap<String, String>();
		int row = ss.delete(shipping_idx);
		if(row == 1) {
			resp.put("status", "OK");
			resp.put("msg", "정상적으로 삭제되었습니다.");
		}
		else {
			resp.put("status", "FAIL");
			resp.put("status", "삭제 실패!!");
		}
		return resp;
	}
	@ResponseBody
	@PostMapping("/shipping/repUpdate")
	public int repUpdate(int shipping_idx, int shipping_rep) {
		ShippingDTO dto = new ShippingDTO();
		dto.setShipping_idx(shipping_idx);
		dto.setShipping_rep(shipping_rep);
		return ss.update(dto);
	}
	
	
	
}
