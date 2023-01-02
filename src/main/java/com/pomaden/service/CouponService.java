package com.pomaden.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.CouponDAO;
import com.pomaden.model.CouponDTO;

@Service
public class CouponService {
	@Autowired private CouponDAO dao;
	public List<CouponDTO> selectAll(String member_id) {
		return dao.selectAll(member_id);
	}
	public int update(int coupon_idx) {
		return dao.update(coupon_idx);
	}
	public HashMap<String, String> joinCouponMap(String member_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("coupon_member_id", member_id);
		map.put("coupon_name", "회원가입 환영 쿠폰");
		map.put("coupon_benefit", "모든 상품 10% 할인 적용할 수 있습니다");
		map.put("coupon_condition", "10000원 넘는 상품 구매시 적용가능");
		map.put("coupon_sale", String.valueOf(10));
		return map;
	}
	public int insert(HashMap<String, String> map) {
		return dao.insert(map);
	}
	
}
