package com.pomaden.model;


public interface MemberDAO {
	
	
	public MemberDTO check(String id);

	public int insert(MemberDTO dto);
}
