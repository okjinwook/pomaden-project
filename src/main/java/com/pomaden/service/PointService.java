package com.pomaden.service;

import java.util.HashMap;
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
	public int insert(HashMap<String, String> pointInsertMap) {
		return dao.insert(pointInsertMap);
	}
	public HashMap<String, String> joinPointMap(String member_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("point_member_id", member_id);
		map.put("point_content", "회원가입 환영 적립금");
		map.put("point_change", "+500");
		map.put("point_total", "500");
		return map;
	}

}
