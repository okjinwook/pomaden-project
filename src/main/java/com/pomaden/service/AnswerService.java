package com.pomaden.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.AnswerDAO;
import com.pomaden.model.AnswerDTO;

@Service
public class AnswerService {
	@Autowired private AnswerDAO dao;
	public int insert(AnswerDTO dto) {
		String content = dto.getAnswer_content();
		dto.setAnswer_content(content.replaceAll("\n", "<br>"));
		return dao.insert(dto);
	}
	public List<AnswerDTO> selectAll() {
		return dao.selectAll();
	}

}
