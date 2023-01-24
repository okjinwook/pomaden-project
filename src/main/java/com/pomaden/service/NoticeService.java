package com.pomaden.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.NoticeDAO;
import com.pomaden.model.NoticeDTO;

@Service
public class NoticeService {
	@Autowired private NoticeDAO dao;
	public List<NoticeDTO> selectList() {
		return dao.selectList();
	}
	public int insert(NoticeDTO dto) {
		String content = dto.getNotice_content();
		dto.setNotice_content(content.replaceAll("\r\n", "<br>"));
		return dao.insert(dto);
	}
	public NoticeDTO selectOne(int notice_idx) {
		return dao.selectOne(notice_idx);
	}
	public int delete(int notice_idx) {
		return dao.delete(notice_idx);
	}

}
