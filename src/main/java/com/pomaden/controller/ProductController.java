package com.pomaden.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import com.pomaden.model.ShippingDTO;
import com.pomaden.service.CartService;
import com.pomaden.service.CouponService;
import com.pomaden.service.ItemService;
import com.pomaden.service.LikeProductService;
import com.pomaden.service.PointService;
import com.pomaden.service.ProductService;
import com.pomaden.service.ReplyService;
import com.pomaden.service.ReviewService;
import com.pomaden.service.ShippingService;

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
	@Autowired private ShippingService ss;
	
	@GetMapping("/product/productList")
	public ModelAndView selectCategory(String category, String kind, String top) {
		ModelAndView mav = new  ModelAndView();
		HashMap<String, String> data = new HashMap<String, String>();
		
		data.put("category", category);
		if(kind != null && kind.equals("전체") == false) {
			data.put("kind", kind);
		}
		if(top != null) {
			data.put("top", top);
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
		Set<String> setList = new HashSet<String>(sizeList);	// 중복제거 Set
		List<String> resultSizeList = new ArrayList<String>(setList);
		List<String> colorList = is.getItemColor(product_name);
		List<ReviewDTO> reviewList = revs.selectList(map);
		List<ReplyDTO> replyList = reps.selectList();
		mav.addObject("likeCheck", likeDTO);
		mav.addObject("prodDto", prodDto);
		mav.addObject("colorList", colorList);
		mav.addObject("sizeList", resultSizeList);
		mav.addObject("reviewList", reviewList);
		mav.addObject("replyList", replyList);
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/product/likeUpdate")
	public int likeUpdate(@RequestBody HashMap<String, Object> map) {
		int row = 0;
		HashMap<String, Object> updateMap = new HashMap<String, Object>();
		String product_name = (String)map.get("product_name");
		String member_id = (String)map.get("member_id");
		LikeProductDTO dto = ls.selectOne(product_name, member_id);
		if(dto != null) {
			row = ls.delete(map);
		}
		else {
			row = ls.insert(map);
		}
		updateMap.put("product_like", map.get("product_like"));
		updateMap.put("product_name", map.get("product_name"));
		row = ps.update(updateMap);
		return row;
	}
	@GetMapping("/product/payment")
	public ModelAndView payment(int[] list, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		int point = login.getMember_point();
		List<CartDTO> cartList = cs.getPayment(list, login);
		List<ShippingDTO> shippingList = ss.selectAll(login.getMember_id());
		session.setAttribute("paymentItemList", cartList);
		mav.addObject("shippingList", shippingList);
		mav.addObject("point", point);
		return mav;
	}
	@GetMapping("/product/paymentSingle")
	public ModelAndView paymentSingle(String item_name, String item_color, String item_size, String count, HttpSession session) {
		ModelAndView mav = new ModelAndView("/product/payment");
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		int point = login.getMember_point();
		List<CartDTO> list = ps.setPaymentSingle(item_color, item_name, item_size, count);
		List<ShippingDTO> shippingList = ss.selectAll(login.getMember_id());
		session.setAttribute("paymentItemList", list);
		mav.addObject("shippingList", shippingList);
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
