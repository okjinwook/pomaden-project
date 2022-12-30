package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface PointDAO {
	
	@Select("select * from point where point_member_id = #{member_id} order by point_date desc")
	List<PointDTO> seletAll(String member_id);

	int insert(HashMap<String, String> pointInsertMap);

}
