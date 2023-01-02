package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface CouponDAO {

	@Select("select * from coupon where coupon_member_id = #{member_id} order by coupon_date desc")
	List<CouponDTO> selectAll(String member_id);

	@Update("update coupon set coupon_use = 1 where coupon_idx = #{coupon_idx}")
	int update(int coupon_idx);

	int insert(HashMap<String, String> map);
	
}
