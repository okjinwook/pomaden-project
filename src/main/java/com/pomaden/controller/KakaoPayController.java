package com.pomaden.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.MemberDTO;
import com.pomaden.model.PointDTO;
import com.pomaden.service.CartService;
import com.pomaden.service.CouponService;
import com.pomaden.service.ItemService;
import com.pomaden.service.KakaoPayService;
import com.pomaden.service.MemberService;
import com.pomaden.service.OrderListService;
import com.pomaden.service.PointService;


@Controller
public class KakaoPayController {
	@Autowired private OrderListService os;
	@Autowired private KakaoPayService ks;
	@Autowired private CartService carts;
	@Autowired private CouponService cous;
	@Autowired private MemberService ms;
	@Autowired private PointService ps;
	@Autowired private ItemService is;
	
	@GetMapping("/kakaopay/success")
	public ModelAndView success(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int orderListInsertRow = 1;
		int cartDeleteRow = 1;
		int couponUpdateRow = 1;
		int memberPointUpdateRow = 1;
		int memberCouponUpdateRow = 1;
		int pointInsertRow = 1;
		int itemUpdateRow = 1;
		int point_use = 0;
		// 페이지 리로드 시 중복으로 실행 되는 것을 방지하기 위한 조건문입니다.
		if(session.getAttribute("kakaopayItemList") != null) {
			List<HashMap<String, Object>> kakaopayItemList = (List<HashMap<String, Object>>) session.getAttribute("kakaopayItemList");
			List<HashMap<String, Object>> successList = new ArrayList<HashMap<String,Object>>();
			
			MemberDTO login = (MemberDTO) session.getAttribute("login");
			String member_id = login.getMember_id();
			for(HashMap<String, Object> map : kakaopayItemList) {
				HashMap<String, String> couponUpdateMap = new HashMap<String, String>();
				HashMap<String, String> pointUpdateMap = new HashMap<String, String>();
				HashMap<String, String> pointInsertMap = new HashMap<String, String>();
				
				if(map.get("orderList_order_number") != null) {
					map.put("orderList_member_id", member_id);
					orderListInsertRow = os.insert(map);
					successList.add(map);
					if(orderListInsertRow == 1) {
						itemUpdateRow = is.update(map);
					}
				}
				session.setAttribute("successList", successList);
				// 주문내역 insert에 성공 했으면서
				if(orderListInsertRow == 1 && itemUpdateRow == 1) {
					// 리스트 안의 hashmap이 상품인지 쿠폰,적립금 사용 데이터인지
					if(map.get("cart_idx") != null) {
						int cart_idx = Integer.parseInt(String.valueOf(map.get("cart_idx")));
						cartDeleteRow = carts.delete(cart_idx);
					}
					else if(map.get("coupon_idx") != null) {
						int coupon_count = login.getMember_coupon() - 1;
						int coupon_idx = Integer.parseInt(String.valueOf(map.get("coupon_idx")));
						couponUpdateMap.put("member_id", member_id);
						couponUpdateMap.put("member_coupon", String.valueOf(coupon_count));
						memberCouponUpdateRow = ms.update(couponUpdateMap);
						couponUpdateRow = cous.update(coupon_idx);
					}
					else if(map.get("point_use") != null) {
						int member_point = login.getMember_point();
						point_use = Integer.parseInt(String.valueOf(map.get("point_use")));
						int point_total = member_point - point_use; // 원래 있던 포인트 - 사용한 포인트
						pointUpdateMap.put("member_point", String.valueOf(point_total));
						pointUpdateMap.put("member_id", login.getMember_id());
						memberPointUpdateRow = ms.update(pointUpdateMap);
						
						pointInsertMap.put("point_member_id", login.getMember_id());
						pointInsertMap.put("point_content", "상품 구매 적용");
						pointInsertMap.put("point_change", "-" + point_use);
						pointInsertMap.put("point_total", String.valueOf(point_total));
						pointInsertRow = ps.insert(pointInsertMap);
					}
					// 하나라도 실패시 조건문 실패
					if(cartDeleteRow == 1 && couponUpdateRow == 1 && 
						memberPointUpdateRow == 1 && memberCouponUpdateRow == 1 &&
						pointInsertRow == 1) {
						mav.addObject("status", "OK");
						mav.addObject("msg", "정상적으로 상품이 구매되었습니다.");
						mav.addObject("successList", session.getAttribute("successList"));
						mav.addObject("point", point_use);
					}
					else {
						mav.addObject("status", "FAIL");
						mav.addObject("msg", "상품구매 실패!!");
					}
				}
				else {
					mav.addObject("status", "FAIL");
					mav.addObject("msg", "결제요청에 실패하였습니다.");
				}
			}
			login = ms.selectOne(member_id);
			session.removeAttribute("login");
			session.setAttribute("login", login);
			session.removeAttribute("kakaopayItemList");
		}
		return mav;
	}
	@GetMapping("/kakaopay/fail")
	public void fail(HttpSession session) {
		session.removeAttribute("list");
	}
	@GetMapping("/kakaopay/cancle")
	public void cancle(HttpSession session) {
		session.removeAttribute("list");
	}
	
	
	@ResponseBody
	@PostMapping("/kakaopay/paymentReady")
	public String payment(@RequestBody HashMap<String, HashMap<String, Object>> data , HttpSession session) {
		String result = ks.getResult(data, session);
		return result;	
	}
	
}
