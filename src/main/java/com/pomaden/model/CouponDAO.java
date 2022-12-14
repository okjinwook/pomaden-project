package com.pomaden.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface CouponDAO {

	@Select("select * from coupon where coupon_member_id = #{member_id}")
	List<CouponDTO> selectAll(String member_id);
	
}
