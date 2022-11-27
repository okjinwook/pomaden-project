package com.pomaden.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.AdminDAO;
import com.pomaden.model.AdminDTO;

@Service
public class AdminService {
	@Autowired private AdminDAO dao;
	public AdminDTO selectOne(AdminDTO dto) {
		return dao.selectOne(dto);
	}

}
