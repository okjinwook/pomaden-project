package com.pomaden.model;

import org.apache.ibatis.annotations.Select;

public interface MemberDAO {
	
	
	public MemberDTO check(String id);

	public int insert(MemberDTO dto);
	
	@Select("select * from member where member_id = #{member_id} and member_pw = #{member_pw}")
	public MemberDTO login(MemberDTO dto);
}
