package com.pomaden.model;

import org.apache.ibatis.annotations.Select;

public interface MemberDAO {
	
	@Select("select * from member where member_id=#{id}")
	MemberDTO check(String id);
}
