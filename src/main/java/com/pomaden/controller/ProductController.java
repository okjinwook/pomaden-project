package com.pomaden.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

	@GetMapping("product/productList")
	public ModelAndView productList(String category) {
		ModelAndView mav = new  ModelAndView();
		mav.addObject("category", category);
		return mav;
	}
}
