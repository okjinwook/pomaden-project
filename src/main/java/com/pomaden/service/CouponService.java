package com.pomaden.service;

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
	
}
