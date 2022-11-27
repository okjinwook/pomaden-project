package com.pomaden.model;

import org.apache.ibatis.annotations.Select;

public interface AdminDAO {
	
	@Select("select * from admin where admin_id = #{admin_id} and admin_pw = #{admin_pw}")
	AdminDTO selectOne(AdminDTO dto);

	
}
