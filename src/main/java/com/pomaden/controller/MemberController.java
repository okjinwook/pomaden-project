package com.pomaden.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.MemberDTO;
import com.pomaden.service.MemberService;

@Controller
public class MemberController {
	@Autowired private MemberService ms;
	
	@GetMapping("/member/login")
	public void login() {}
	
	@GetMapping("/member/join")
	public void getJoin() {}
	
	@PostMapping("/member/join")
	public ModelAndView join(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		int row = 0;
		row = ms.insert(dto);
		if(row == 1) {
			mav.setViewName("redirect:/member/login");
		}
		else {
			mav.setViewName("redirect:/member/join");
		}
		return mav;
	}
	@ResponseBody
	@GetMapping("/member/check")
	public int check(String id) {
		int row = 0;
		MemberDTO dto = ms.check(id);
		System.out.println(id);
		if(dto != null) {
			row = 1;
		}
		return row;
	}
}
