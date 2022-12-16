package com.pomaden.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.LikeProductDTO;
import com.pomaden.model.MemberDTO;
import com.pomaden.model.ProductDTO;
import com.pomaden.service.ItemService;
import com.pomaden.service.LikeProductService;
import com.pomaden.service.ProductService;

@Controller
public class ProductController {
	@Autowired private ProductService ps;
	@Autowired private ItemService is;
	@Autowired private LikeProductService ls;
	
	@GetMapping("/product/productList")
	public ModelAndView selectCategory(String category, String kind) {
		ModelAndView mav = new  ModelAndView();
		HashMap<String, String> data = new HashMap<String, String>();
		
		data.put("category", category);
		if(kind.equals("전체") == false) {
			data.put("kind", kind);
		}
		List<ProductDTO> list = ps.selectList(data);
		List<ProductDTO> kindAll = ps.selectKind(category);
		mav.addObject("category", category);
		mav.addObject("kind", kind);
		mav.addObject("kindAll", kindAll);
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/product/productDetail/{product_name}")
	public ModelAndView productDetail(@PathVariable("product_name") String product_name, HttpSession session) {
		ModelAndView mav = new ModelAndView("/product/productDetail");
		MemberDTO memDto = null;
		LikeProductDTO likeDTO = null;
		if(session.getAttribute("login") != null) {
			memDto = (MemberDTO)session.getAttribute("login");
			likeDTO = ls.selectOne(product_name, memDto.getMember_id());
		}
		ProductDTO prodDto = ps.getProduct(product_name);
		List<String> sizeList = is.getItemSize(product_name);
		List<String> colorList = is.getItemColor(product_name);
		mav.addObject("likeCheck", likeDTO);
		mav.addObject("prodDto", prodDto);
		mav.addObject("colorList", colorList);
		mav.addObject("sizeList", sizeList);
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/product/likeUpdate")
	public int likeUpdate(@RequestBody HashMap<String, Object> map) {
		int row = 0;
		String product_name = (String)map.get("product_name");
		String member_id = (String)map.get("member_id");
		LikeProductDTO dto = ls.selectOne(product_name, member_id);
		if(dto != null) {
			row = ls.delete(map);
		}
		else {
			row = ls.insert(map);
		}
		row = ps.likeUpdate(map);
		return row;
	}
	
	@GetMapping("/product/payment")
	public ModelAndView payment(String product_name, String item_color, String item_size, String buy_count) {
		ModelAndView mav = new ModelAndView();
		ProductDTO prodDto = ps.getProduct(product_name);
		mav.addObject("prodDto", prodDto);
		return mav;
	}
}
