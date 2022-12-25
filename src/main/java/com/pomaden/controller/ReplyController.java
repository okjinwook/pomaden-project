package com.pomaden.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.ReplyDTO;
import com.pomaden.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired private ReplyService rs;
	
	
	@ResponseBody
	@PostMapping("/reply/insert")
	public int insert(@RequestBody HashMap<String, Object> map) {
		int row = rs.insert(map);
		return row;
	}
	
}
