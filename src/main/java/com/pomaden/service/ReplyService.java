package com.pomaden.service;

import java.util.HashMap;

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
	
}
