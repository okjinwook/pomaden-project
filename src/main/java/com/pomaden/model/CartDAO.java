package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


public interface CartDAO {
	int insert(HashMap<String, Object> ob);
	
	@Select("select * from cart where cart_member_id = #{member_id}")
	List<CartDTO> selectAll(String member_id);
	
	@Update("update cart set cart_count = #{cart_count} where cart_idx = #{cart_idx} ")
	int updateCount(HashMap<String, Object> map);

	@Delete("delete cart where cart_idx = #{idx}")
	int cartDelete(int idx);


}
