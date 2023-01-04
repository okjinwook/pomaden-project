package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

public interface ShippingDAO {

	int insert(ShippingDTO dto);

	@Select("select * from shipping where shipping_member_id = #{member_id} order by shipping_idx desc")
	List<ShippingDTO> selectAll(String member_id);

	@Select("select * from shipping where shipping_idx = #{shipping_idx}")
	ShippingDTO selectOne(int shipping_idx);

	int update(ShippingDTO dto);

	@Delete("delete shipping where shipping_idx = #{shipping_idx}")
	int delete(int shipping_idx);

}
