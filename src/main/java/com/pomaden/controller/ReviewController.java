package com.pomaden.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.ReviewDTO;
import com.pomaden.service.OrderListService;
import com.pomaden.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired private ReviewService rs;
	@Autowired private OrderListService os;
	
	@PostMapping("/review/insert")
	public ModelAndView insert(ReviewDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		int row = rs.insert(dto);
		if(row == 1) {
			int osRow = os.update(dto.getReview_orderList_idx());
			mav.addObject("msg", "정상적으로 리뷰가 등록되었습니다.");
			mav.setViewName("redirect:/myPage/board");
		}
		else {
			mav.addObject("msg", "리뷰 등록 실패!!");
		}
		
		return mav;
	}
	
}
