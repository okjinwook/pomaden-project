package com.pomaden.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.ReplyDAO;
import com.pomaden.model.ReplyDTO;

@Service
public class ReplyService {
	@Autowired private ReplyDAO dao;

	public int insert(HashMap<String, Object> map) {
		return dao.insert(map);
	}

	public List<ReplyDTO> selectList() {
		return dao.selectList();
	}

	public int delete(int reply_idx) {
		return dao.delete(reply_idx);
	}

	public int update(HashMap<String, String> data) {
		return dao.update(data);
	}
	
}
