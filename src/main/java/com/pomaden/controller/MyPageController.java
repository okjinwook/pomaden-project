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
import com.pomaden.service.MyPageService;

@Controller
public class MyPageController {
	@Autowired private MemberService ms;
	
	@GetMapping("/myPage")
	public ModelAndView orderList(String category, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", category);
		mav.setViewName("/myPage/" + category);
		mav.addObject("login", session.getAttribute("login"));
		return mav;
	}
	
	@PostMapping("/myPage/updateMember")
	public ModelAndView updateMember(MemberDTO getDto, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/myPage?category=member_info");
		HashMap<String, String> data = new HashMap<String, String>();
		int row = 0;
		if(getDto.getMember_pw() != "") {
			data.put("member_pw", getDto.getMember_pw());
		}
		data.put("member_id", getDto.getMember_id());
		data.put("member_email", getDto.getMember_email());
		data.put("member_code_add", getDto.getMember_code_add());
		data.put("member_load_add", getDto.getMember_load_add());
		data.put("member_detail_add", getDto.getMember_detail_add());
		row = ms.update(data);
		if(row == 1) {
			mav.addObject("status", "OK");
			mav.addObject("message", "정상적으로 회원정보가 수정되었습니다.");
			session.setAttribute("login", ms.selectOne(getDto.getMember_id()));
		}
		else {
			mav.addObject("status", "Fail");
			mav.addObject("message", "회원정보수정 실패하였습니다");
		}
		return mav;
	}
	
}
