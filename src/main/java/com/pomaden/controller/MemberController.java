package com.pomaden.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.MemberDTO;

@Controller
public class MemberController {

	
	@GetMapping("/member/login")
	public void login() {}
	
	@GetMapping("/member/join")
	public void getJoin() {}
	
	@PostMapping("/member/join")
	public ModelAndView join(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		System.out.println(dto.getMember_id());
		System.out.println(dto.getMember_pw());
		System.out.println(dto.getMember_name());
		System.out.println(dto.getMember_address());
		System.out.println(dto.getMember_phone());
		System.out.println(dto.getMember_email());
		return mav;
	}
}
