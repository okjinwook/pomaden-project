package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ReplyDAO {

	int insert(HashMap<String, Object> map);

	@Select("select * from reply")
	List<ReplyDTO> selectList();

	@Delete("delete reply where reply_idx = #{reply_idx}")
	int delete(int reply_idx);

	@Update("update reply set reply_content = #{reply_content} where reply_idx = #{reply_idx}")
	int update(HashMap<String, String> data);

}
