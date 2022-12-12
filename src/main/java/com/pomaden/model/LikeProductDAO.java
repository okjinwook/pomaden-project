package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;


public interface LikeProductDAO {
	
	int insert(HashMap<String, Object> map);
	
	@Select("select * from likeProduct where like_member_id = #{member_id}")
	List<LikeProductDTO> selectAll(String member_id);
	
	@Select("select * from likeProduct where like_member_id = #{member_id} and like_name = #{product_name}")
	LikeProductDTO selectOne(HashMap<String, String> map);
	
	@Delete("delete likeProduct where like_member_id = #{member_id} and like_name = #{product_name}")
	int delete(HashMap<String, Object> map);

}
