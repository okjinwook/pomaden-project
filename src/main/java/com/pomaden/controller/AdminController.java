package com.pomaden.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.AdminDTO;
import com.pomaden.model.ItemDTO;
import com.pomaden.model.ProductDTO;
import com.pomaden.service.AdminService;
import com.pomaden.service.ItemService;
import com.pomaden.service.ProductService;

@Controller
public class AdminController {
	@Autowired private AdminService as;
	@Autowired private ProductService ps;
	@Autowired private ItemService is;
	
	@GetMapping("/admin")
	public void admin() {}
	
	@PostMapping("/admin/login")
	public ModelAndView login(AdminDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/admin/product_add");
		System.out.println(dto.getAdmin_id());
		System.out.println(dto.getAdmin_pw());
		AdminDTO login = as.selectOne(dto);
		System.out.println(login);
		if(login != null) {
			session.setAttribute("adminLogin", login);
		}
		else {
			mav.setViewName("redirect:/admin");
		}
		return mav;
	}
	@GetMapping("/admin/product_add")
	public void product_add() {}
	
	@PostMapping("admin/product_add")
	public ModelAndView product_insert(ProductDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println(dto.getProduct_upload().getOriginalFilename());
		int row = ps.insert(dto);
		if(row == 1) {
			mav.addObject("msg", "정상적으로 등록되었습니다.");
			mav.addObject("dto", dto);
		}
		else {
			mav.addObject("msg", "상품등록 실패!!!.");
		}
		return mav;
	}
	@PostMapping("/admin/item_add")
	public ModelAndView item_insert(ItemDTO dto) {
		ModelAndView mav = new ModelAndView("/admin/product_add");
		int row = is.insert(dto);
		if(row == 1) {
			mav.addObject("msg", "정상적으로 등록되었습니다.");
			mav.addObject("product_name", dto.getItem_name());
		}
		else {
			mav.addObject("msg", "상품등록 실패!!!.");
		}
		return mav;
	}
	
	@GetMapping("/admin/product_list")
	public ModelAndView product_list() {
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> list = ps.selectAll();
		mav.addObject("list", list);
		return mav;
	}
}
