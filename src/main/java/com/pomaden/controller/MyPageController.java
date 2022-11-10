package com.pomaden.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	@GetMapping("/myPage")
	public ModelAndView orderList(String category) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", category);
		mav.setViewName("/myPage/" + category);
		return mav;
	}
	
//	@GetMapping("/myPage/point")
//	public void point() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("category", category);
//		return mav;
//	}
//	
//	@GetMapping("/myPage/coupon")
//	public void coupon() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("category", category);
//		return mav;
//	}
//	
//	@GetMapping("/myPage/board")
//	public void board() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("category", category);
//		return mav;
//	}
//	
//	@GetMapping("/myPage/like")
//	public void like() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("category", category);
//		return mav;
//	}
//	
//	@GetMapping("/myPage/member_info")
//	public void member_info() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("category", category);
//		return mav;
//	}
//	
//	@GetMapping("/myPage/question")
//	public void question() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("category", category);
//		return mav;
//	}
	
	
}
