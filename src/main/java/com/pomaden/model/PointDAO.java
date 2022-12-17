package com.pomaden.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface PointDAO {
	
	@Select("select * from point where point_member_id = #{member_id}")
	List<PointDTO> seletAll(String member_id);

	@Select("select point_total from (select * from point where point_member_id = #{member_id} order by rownum desc) where rownum = 1")
	PointDTO selectOne(String member_id);

}
