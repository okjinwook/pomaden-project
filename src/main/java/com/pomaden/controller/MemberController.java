package com.pomaden.controller;

import javax.servlet.http.HttpSession;

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
	
	@PostMapping("/member/login") 
	public ModelAndView login(MemberDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView("/home");
		MemberDTO login = ms.login(dto);
		if(login != null) {
			session.setAttribute("login", login);
		}
		else {
			mav.setViewName("/member/login");
		}
		return mav;
	}
	@GetMapping("/member/logout")
	public String logout(HttpSession sessoin) {
		sessoin.invalidate();
		return "redirect:/";
	}
	
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
		System.out.println(dto.getMember_address());
		System.out.println(dto.getMember_email());
		System.out.println(dto.getMember_id());
		System.out.println(dto.getMember_name());
		System.out.println(dto.getMember_phone());
		System.out.println(dto.getMember_pw());
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/member/check")
	public int check(String id) {
		int row = 0;
		MemberDTO dto = ms.check(id);
		if(dto != null) {
			row = 1;
		}
		return row;
	}
}
