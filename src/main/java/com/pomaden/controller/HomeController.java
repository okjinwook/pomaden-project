package com.pomaden.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.ProductDTO;
import com.pomaden.service.ProductService;

@Controller
public class HomeController {
	@Autowired private ProductService ps;
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("/home");
		List<ProductDTO> list = ps.selectAll();
		mav.addObject("list", list);
		return mav;
	}
	
}
