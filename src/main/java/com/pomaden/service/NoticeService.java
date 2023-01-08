package com.pomaden.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.NoticeDAO;
import com.pomaden.model.NoticeDTO;
import com.pomaden.model.ReviewDTO;

@Service
public class NoticeService {
	@Autowired private NoticeDAO dao;
	public List<NoticeDTO> selectList() {
		return dao.selectList();
	}
	public int insert(NoticeDTO dto) {
		String content = dto.getNotice_content();
		dto.setNotice_content(content.replaceAll("\n", "<br>"));
		return dao.insert(dto);
	}

}
