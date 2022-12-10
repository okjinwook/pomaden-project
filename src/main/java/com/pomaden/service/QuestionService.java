package com.pomaden.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.QuestionDAO;
import com.pomaden.model.QuestionDTO;

@Service
public class QuestionService {
	@Autowired private QuestionDAO dao;
	public int insert(QuestionDTO getDto) {
		return dao.insert(getDto);
	}
	public List<QuestionDTO> selectAll(HashMap<String, String> map) {
		return dao.selectAll(map);
	}

}
