package com.pomaden.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.PointDAO;
import com.pomaden.model.PointDTO;

@Service
public class PointService {
	@Autowired private PointDAO dao;
	public List<PointDTO> selectAll(String member_id) {
		return dao.seletAll(member_id);
	}

}
