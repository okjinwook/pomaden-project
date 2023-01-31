package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


public interface CartDAO {
	int insert(HashMap<String, Object> ob);
	@Select("select * from cart where cart_member_id = #{member_id} order by cart_idx desc")
	List<CartDTO> selectAll(String member_id);
	
	@Update("update cart set cart_count = #{cart_count}, cart_total = #{cart_total} where cart_idx = #{cart_idx} ")
	int update(HashMap<String, Object> map);

	@Delete("delete from cart where cart_idx = #{idx}")
	int cartDelete(int idx);
	
	@Select("select * from cart where cart_name = #{cart_name} and cart_color = #{cart_color} and cart_size = #{cart_size} and cart_member_id = #{cart_member_id}")
	CartDTO selectOne(HashMap<String, Object> ob);

	@Select("select count(*) from cart where cart_member_id = #{member_id}")
	int selectCount(String member_id);
	
	@Select("select * from cart where cart_member_id = #{member_id} and cart_idx = #{idx}")
	CartDTO getPaymentItem(HashMap<String, String> map);


}
