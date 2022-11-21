package com.pomaden.controller;

import java.util.HashMap;

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
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/member/idCheck")
	public int idCheck(String member_id) {
		int row = 0;
		MemberDTO dto = ms.idCheck(member_id);
		if(dto != null) {
			row = 1;
		}
		return row;
	}
	@ResponseBody
	@GetMapping("/member/emailCheck")
	public HashMap<String, String> emailCheck(String member_email) {
		HashMap<String, String> map = new HashMap<String, String>();
		MemberDTO dto = ms.emailCheck(member_email);
		if(dto != null) {
			map.put("status", "OK");
		}
		else {
			map.put("status", "Fail");
		}
		return map;
	}
	
	@GetMapping("/member/find_id")
	public void getFind_id() {}
	@GetMapping("/member/find_pw")
	public void getFind_pw() {}
	@PostMapping("/member/find_id")
	public ModelAndView find_id(MemberDTO getDTO) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = ms.findId(getDTO);
		if(dto == null) {
			mav.addObject("message", "일치하는 회원을 찾을 수 없습니다.");
		}
		else {
			mav.addObject("dto", dto);
			mav.setViewName("/member/findId_result");
		}
		return mav;
	}
}
