package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface OrderListDAO {

	int insert(HashMap<String, Object> map);

	@Select("select * from orderList where orderList_member_id = #{member_id} order by orderList_idx desc")
	List<OrderListDTO> selectList(String member_id);

	@Update("update orderList set orderList_review_check = 1 where orderList_idx = #{orderList_idx}")
	int update(int orderList_idx);

																							// ( orderList 테이블 안에 orderList_order_number로 그룹을 만든다. ( orderlist_idx 제일 높은 것으로 ) 
	@Select("select orderList_order_number, orderList_idx from orderList where orderList_idx in(select max(orderlist_idx) from orderList group by orderlist_order_number) order by orderList_idx desc")
	List<String> selectOrderItem();

}
