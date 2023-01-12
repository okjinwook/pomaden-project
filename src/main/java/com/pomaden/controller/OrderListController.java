package com.pomaden.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.MemberDTO;
import com.pomaden.model.PointDTO;
import com.pomaden.service.CartService;
import com.pomaden.service.CouponService;
import com.pomaden.service.ItemService;
import com.pomaden.service.MemberService;
import com.pomaden.service.OrderListService;
import com.pomaden.service.PointService;

@Controller
public class OrderListController {
	@Autowired private OrderListService os;
	@Autowired private PointService ps;
	@Autowired private MemberService ms;
	@Autowired private CartService carts;
	@Autowired private CouponService cous;
	@Autowired private ItemService is;
	
	@ResponseBody
	@PostMapping("/orderList/insert")
	public HashMap<String, String> insert(@RequestBody List<HashMap<String, Object>> list, HttpSession session) {
		int orderListInsertRow = 1;
		int cartDeleteRow = 1;
		int couponUpdateRow = 1;
		int memberPointUpdateRow = 1;
		int memberCouponUpdateRow = 1;
		int pointInsertRow = 1;
		int recPointUpdateRow = 1;
		int itemUpdateRow = 1;
		int point_use = 0;
		int recPoint = 0;
		HashMap<String, String> resp = new HashMap<String, String>(); 
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		String member_id = login.getMember_id();
		
		for(HashMap<String, Object> map : list) {
			HashMap<String, String> couponUpdateMap = new HashMap<String, String>();
			HashMap<String, String> pointUpdateMap = new HashMap<String, String>();
			HashMap<String, String> pointInsertMap = new HashMap<String, String>();
			HashMap<String, String> recPointUpdateMap = new HashMap<String, String>();
			
			// 주문내역 insert
			if(map.get("orderList_order_number") != null) {
				map.put("orderList_member_id", member_id);
				orderListInsertRow = os.insert(map);
				if(orderListInsertRow == 1) {
					itemUpdateRow = is.update(map);
				}
			}
			// 주문내역 insert에 성공 했으면서
			if(orderListInsertRow == 1 && itemUpdateRow == 1) {
				// 리스트 안의 hashmap이 상품인지 쿠폰,적립금 사용 데이터인지
				if(map.get("cart_idx") != null) {
					int cart_idx = Integer.parseInt(String.valueOf(map.get("cart_idx")));
					cartDeleteRow = carts.delete(cart_idx);
				}
				else if(map.get("point_use") != null) {
					int member_point = ms.selectOne(member_id).getMember_point();
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
				else if(map.get("recPoint") != null) {
					int member_point = ms.selectOne(member_id).getMember_point();
					recPoint = Integer.parseInt(String.valueOf(map.get("recPoint")));
					int point_total = member_point + recPoint;
					recPointUpdateMap.put("member_point", String.valueOf(point_total));
					recPointUpdateMap.put("member_id", login.getMember_id());
					recPointUpdateRow = ms.update(recPointUpdateMap);
					
					pointInsertMap.put("point_member_id", login.getMember_id());
					pointInsertMap.put("point_content", "상품 구매 후 쌓인 적립금");
					pointInsertMap.put("point_change", "+" + recPoint);
					pointInsertMap.put("point_total", String.valueOf(point_total));
					pointInsertRow = ps.insert(pointInsertMap);
				}
				else if(map.get("item_name") == null) {	// 마지막은 쿠폰 사용 리스트 
					for(String key : map.keySet()) {
						int coupon_count = ms.selectOne(member_id).getMember_coupon() - 1;
						int coupon_idx = Integer.parseInt(String.valueOf(map.get(key)));
						couponUpdateMap.put("member_id", member_id);
						couponUpdateMap.put("member_coupon", String.valueOf(coupon_count));
						memberCouponUpdateRow = ms.update(couponUpdateMap);
						couponUpdateRow = cous.update(coupon_idx);
						
					}
				}
				if(cartDeleteRow == 1 && couponUpdateRow == 1 && 
					memberPointUpdateRow == 1 && memberCouponUpdateRow == 1 &&
					pointInsertRow == 1 && recPointUpdateRow == 1) {
					resp.put("status", "OK");
					resp.put("msg", "정상적으로 상품이 구매되었습니다.");
				}
				else {
					resp.put("status", "FAIL");
					resp.put("msg", "상품구매 실패!!");
				}
			}
			else {
				resp.put("status", "FAIL");
				resp.put("msg", "상품구매 실패!!");
			}
		}
		login = ms.selectOne(member_id);
		session.removeAttribute("paymentItemList");
		session.removeAttribute("login");
		session.setAttribute("login", login);
		return resp;
	}
}