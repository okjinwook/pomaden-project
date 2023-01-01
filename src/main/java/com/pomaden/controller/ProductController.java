package com.pomaden.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.CartDTO;
import com.pomaden.model.CouponDTO;
import com.pomaden.model.ItemDTO;
import com.pomaden.model.LikeProductDTO;
import com.pomaden.model.MemberDTO;
import com.pomaden.model.PointDTO;
import com.pomaden.model.ProductDTO;
import com.pomaden.model.ReplyDTO;
import com.pomaden.model.ReviewDTO;
import com.pomaden.service.CartService;
import com.pomaden.service.CouponService;
import com.pomaden.service.ItemService;
import com.pomaden.service.LikeProductService;
import com.pomaden.service.PointService;
import com.pomaden.service.ProductService;
import com.pomaden.service.ReplyService;
import com.pomaden.service.ReviewService;

@Controller
public class ProductController {
	@Autowired private ProductService ps;
	@Autowired private ItemService is;
	@Autowired private LikeProductService ls;
	@Autowired private CouponService cps;
	@Autowired private PointService pos;
	@Autowired private CartService cs;
	@Autowired private ReviewService revs;
	@Autowired private ReplyService reps;
	
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
	
	@GetMapping("/product/productDetail/{product_name}/{sort}")
	public ModelAndView productDetail(@PathVariable("product_name") String product_name, @PathVariable("sort") String sort, HttpSession session) {
		ModelAndView mav = new ModelAndView("/product/productDetail");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("product_name", product_name);
		map.put("sort", sort);
		MemberDTO memDto = null;
		LikeProductDTO likeDTO = null;
		if(session.getAttribute("login") != null) {
			memDto = (MemberDTO)session.getAttribute("login");
			likeDTO = ls.selectOne(product_name, memDto.getMember_id());
		}
		ProductDTO prodDto = ps.getProduct(product_name);
		List<String> sizeList = is.getItemSize(product_name);
		List<String> colorList = is.getItemColor(product_name);
		List<ReviewDTO> reviewList = revs.selectList(map);
		List<ReplyDTO> replyList = reps.selectList();
		mav.addObject("likeCheck", likeDTO);
		mav.addObject("prodDto", prodDto);
		mav.addObject("colorList", colorList);
		mav.addObject("sizeList", sizeList);
		mav.addObject("reviewList", reviewList);
		mav.addObject("replyList", replyList);
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
	public ModelAndView payment(int[] list, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		int point = login.getMember_point();
		List<CartDTO> cartList = new ArrayList<>(); 
		for(int idx : list) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("idx", idx + "");
			map.put("member_id", login.getMember_id());
			CartDTO dto = cs.getPaymentItem(map);
			if(dto != null) {
				cartList.add(dto);
			}
		}
		mav.addObject("cartList", cartList);
		mav.addObject("point", point);
		return mav;
	}
	@GetMapping("/product/paymentSingle")
	public ModelAndView paymentSingle(String item_name, String item_color, String item_size, String count, HttpSession session) {
		ModelAndView mav = new ModelAndView("/product/payment");
		List<ProductDTO> list = new ArrayList<>();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		int point = login.getMember_point();
		ProductDTO dto = ps.getProduct(item_name);
		list.add(dto);
		mav.addObject("list", list);
		mav.addObject("item_color", item_color);
		mav.addObject("item_size", item_size);
		mav.addObject("count", count);
		mav.addObject("point", point);
		return mav;
	}
	@GetMapping("/product/couponList")
	public ModelAndView couponList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		List<CouponDTO> coupon =  cps.selectAll(login.getMember_id());
		mav.addObject("couponList", coupon);
		return mav;
	}
}
