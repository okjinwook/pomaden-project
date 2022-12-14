package com.pomaden.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface PointDAO {
	
	@Select("select * from point where point_member_id = #{member_id}")
	List<PointDTO> seletAll(String member_id);

}
