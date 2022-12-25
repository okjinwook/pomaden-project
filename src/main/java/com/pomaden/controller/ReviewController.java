package com.pomaden.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.ReviewDTO;
import com.pomaden.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired private ReviewService rs;
	
	@PostMapping("/review/insert")
	public ModelAndView insert(ReviewDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/myPage/board");
		int row = rs.insert(dto);
		if(row == 1) {
			mav.addObject("", "");
		}
		else {
			mav.addObject("", "");
		}
		
		return mav;
	}
	
}
