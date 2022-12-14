package com.pomaden.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.MemberDTO;
import com.pomaden.service.LikeProductService;

@Controller
public class LikeProductController {
	
	@Autowired private LikeProductService ls;
	
	@PostMapping("likeProduct/delete")
	public ModelAndView delete(String like_name, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/myPage/like");
		HashMap<String, Object> map = new HashMap<String, Object>();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		String member_id = login.getMember_id();
		map.put("product_name", like_name);
		map.put("member_id", member_id);
		int row = ls.delete(map);
		if(row == 1) {
			mav.addObject("msg", "좋아요 상품이 삭제되었습니다");
		}
		else {
			mav.addObject("msg", "좋아요 상품이 삭제하는데 실패하였습니다.");
		}
		return mav;
	}
}
