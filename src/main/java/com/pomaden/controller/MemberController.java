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
		ModelAndView mav = new ModelAndView();
		MemberDTO login = ms.login(dto);
		if(login != null) {
			session.setAttribute("login", login);
			mav.setViewName("redirect:/");
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
		MemberDTO dto = ms.selectOne(member_id);
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
	
	@PostMapping("/member/find_pw")
	public ModelAndView find_pw(MemberDTO getDTO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = ms.findPw(getDTO);
		if(dto == null) {
			mav.addObject("message", "일치하는 회원을 찾을 수 없습니다.");
		}
		else {
			session.setAttribute("id", dto.getMember_id());
			mav.setViewName("/member/findPw_result");
		}
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/member/change_pw")
	public HashMap<String, String> change_pw(String pw , HttpSession session) {
		int row = 0;
		HashMap<String, String> data = new HashMap<String, String>();
		HashMap<String, String> view = new HashMap<String, String>();
		data.put("member_pw", pw);
		data.put("member_id", (String) session.getAttribute("id"));
		row = ms.update(data);
		if(row == 1) {
			view.put("status", "OK");
			view.put("message", "정상적으로 비밀번호가 변경되었습니다.");
		}
		else {
			view.put("status", "Fail");
			view.put("message", "비밀번호 변경 실패하였습니다");
		}
		return view;
	}
}
