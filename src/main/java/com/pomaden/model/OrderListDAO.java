package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface OrderListDAO {

	int insert(HashMap<String, Object> map);

	@Select("select * from orderList where orderList_member_id = #{member_id} order by orderlist_date desc")
	List<OrderListDTO> selectList(String member_id);

	@Update("update orderList set orderList_review_check = 1 where orderList_idx = #{orderList_idx}")
	int update(int orderList_idx);

}
