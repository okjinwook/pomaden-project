package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface OrderListDAO {

	int insert(HashMap<String, Object> map);

	@Select("select * from orderList where orderList_member_id = #{member_id}")
	List<OrderListDTO> selectList(String member_id);

}
