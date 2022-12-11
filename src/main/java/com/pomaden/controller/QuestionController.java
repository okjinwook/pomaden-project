package com.pomaden.controller;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.QuestionDTO;
import com.pomaden.service.QuestionService;

@Controller
public class QuestionController {
	@Autowired private QuestionService qs;
	
	@GetMapping("/question/questionList")
	public ModelAndView question(String category, String check, String kind, String search, String page) {
		ModelAndView mav = new ModelAndView();
		HashMap<String , String> map = new HashMap<String, String>();
		map.put("category", null); 
		map.put("check", null);
		map.put("kind", null);
		map.put("search", null);
		map.put("offset", page);
		
		
		if(category != "" && "전체".equals(category) != true) {
			map.put("category", category); 
		}
		if(check != "" && "전체".equals(check) != true) {
			map.put("check", check); 
		}
		if(kind != "" && "제목".equals(kind)) {
			map.put("kind", "question_title"); 
		}
		if(kind != "" && "작성자".equals(kind)) {
			map.put("kind", "question_member_id"); 
		}
		if(search != "") {
			map.put("search", search); 
		}
		
		int count = qs.getCount(map);
		List<QuestionDTO> list = qs.selectAll(map);
		mav.addObject("list", list);
		mav.addObject("count", count);
		return mav;
	}
	
	@PostMapping("question/insert")
	public ModelAndView insert(QuestionDTO getDto) {
		ModelAndView mav = new ModelAndView("redirect:/question/questionList?page=0");
		int row = 0;
		row = qs.insert(getDto);
		if(row == 1) {
			mav.addObject("msg", "정상적으로 문의 되었습니다.");
		}
		else {
			mav.addObject("msg", "문의 작성에 실패하였습니다.");
		}
		return mav;
	}
}
