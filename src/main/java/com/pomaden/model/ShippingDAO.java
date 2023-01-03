package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ShippingDAO {

	int insert(HashMap<String, String> shippingMap);

	@Select("select * from shipping where shipping_member_id = #{member_id} order by shipping_idx desc")
	List<ShippingDTO> selectAll(String member_id);

	@Select("select * from shipping where shipping_idx = #{shipping_idx}")
	ShippingDTO selectOne(int shipping_idx);

}
