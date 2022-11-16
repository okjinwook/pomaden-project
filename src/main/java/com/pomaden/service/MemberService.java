package com.pomaden.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.MemberDAO;
import com.pomaden.model.MemberDTO;

@Service
public class MemberService {
	@Autowired private MemberDAO dao;
	public MemberDTO check(String id) {
		return dao.check(id);
	}

}
