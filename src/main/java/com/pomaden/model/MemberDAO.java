package com.pomaden.model;

import java.util.HashMap;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberDAO {
	
	@Select("select * from member where member_id=#{member_id}")
	public MemberDTO selectOne(String member_id);

	@Select("select * from member where member_email=#{member_email}")
	public MemberDTO emailCheck(String member_email);
	
	public int insert(MemberDTO dto);
	
	@Select("select * from member where member_id = #{member_id} and member_pw = #{member_pw}")
	public MemberDTO login(MemberDTO dto);
	
	@Select("select * from member where member_name = #{member_name} and member_email = #{member_email}")
	public MemberDTO findId(MemberDTO dto);
	
	@Select("select * from member where member_id = #{member_id} and member_name = #{member_name} and member_email = #{member_email}")
	public MemberDTO findPw(MemberDTO dto);
	
	public int update(HashMap<String, String> map);

}
