package com.pomaden.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.AdminDTO;
import com.pomaden.service.AdminService;

@Controller
public class AdminController {
	@Autowired private AdminService as;
	
	@GetMapping("/admin")
	public void admin() {}
	
	@GetMapping("/admin/product")
	public void member_mg() {}
	
	@PostMapping("/admin/login")
	public ModelAndView login(AdminDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/admin/product");
		System.out.println(dto.getAdmin_id());
		System.out.println(dto.getAdmin_pw());
		AdminDTO login = as.selectOne(dto);
		System.out.println(login);
		if(login != null) {
			session.setAttribute("login", login);
		}
		else {
			mav.setViewName("redirect:/admin");
		}
		return mav;
	}
}
