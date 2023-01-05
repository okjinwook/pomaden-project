package com.pomaden.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.MemberDAO;
import com.pomaden.model.MemberDTO;

@Service
public class MemberService {
	@Autowired private MemberDAO dao;
	public MemberDTO selectOne(String member_id) {
		return dao.selectOne(member_id);
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
	public MemberDTO findPw(MemberDTO dto) {
		return dao.findPw(dto);
	}
	public int update(HashMap<String, String> map) {
		return dao.update(map);
	}
	public List<MemberDTO> selectAll() {
		return dao.selectAll();
	}

}
