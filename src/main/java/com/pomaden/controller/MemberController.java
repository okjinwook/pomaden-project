package com.pomaden.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

	@GetMapping("/member/login")
	public void login() {}
	
	@GetMapping("/member/join")
	public void join() {}
}
