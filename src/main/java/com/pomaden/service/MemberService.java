package com.pomaden.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.MemberDAO;
import com.pomaden.model.MemberDTO;

@Service
public class MemberService {
	@Autowired private MemberDAO dao;
	public MemberDTO idCheck(String member_id) {
		return dao.idCheck(member_id);
	}
	public int insert(MemberDTO dto) {
		return dao.insert(dto);
	}
	public MemberDTO login(MemberDTO dto) {
		return dao.login(dto);
	}
	public MemberDTO emailCheck(String member_email) {
		return dao.emailCheck(member_email);
	}
	public MemberDTO findId(MemberDTO dto) {
		return dao.findId(dto);
	}

}
