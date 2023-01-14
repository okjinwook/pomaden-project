package com.pomaden.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.NoticeDTO;
import com.pomaden.service.NoticeService;

@Controller
public class CenterController {
	@Autowired private NoticeService ns;
	
	@GetMapping("/cs/center")
	public ModelAndView notice() {
		ModelAndView mav = new ModelAndView();
		List<NoticeDTO> list = ns.selectList();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/cs/notice_detail")
	public ModelAndView notice_detail(int notice_idx) {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = ns.selectOne(notice_idx);
		mav.addObject("dto", dto);
		return mav;
	}
}
