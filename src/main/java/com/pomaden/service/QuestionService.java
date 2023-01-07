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
		String offset = map.get("offset");
		int resultPage = Integer.parseInt(offset) * 10;
		map.put("page", resultPage + "");
		return dao.selectAll(map);
	}
	public int getCount(HashMap<String, String> map) {
		List<QuestionDTO> list = dao.selectAll(map);
		int count = list.size();
		int resultCount = count / 10;
		resultCount += (count % 10 == 0) ? 0 : 1;
		return resultCount;
	}
	public List<QuestionDTO> selectList(HashMap<String, String> map) {
		return dao.selectAll(map);
	}
	public int update(int question_idx) {
		return dao.update(question_idx);
	}

}
