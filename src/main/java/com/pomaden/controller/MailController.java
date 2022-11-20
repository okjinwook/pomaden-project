package com.pomaden.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.pomaden.mail.Hash;
import com.pomaden.mail.MailService;

@RestController
public class MailController {
	@Autowired private MailService ms;
	@Autowired private Hash hash;
	
	@GetMapping("/member/sendEmail")
	public HashMap<String, String> sendMail(String member_email, HttpSession session) throws IOException {
		HashMap<String, String> resp = new HashMap<>();
		String authNumber =	ms.getAuthNumber();
		String hashNumber = hash.getHash(authNumber);
		
		//세션은 클라이언트 1명당 1개의 객체가 생성. 세션에 저장해두면 다른 클라이언트와 섞일 일이 없다.
		session.setAttribute("hashNumber", hashNumber);
		String account = "";
		String filePath = session.getServletContext().getRealPath("/WEB-INF/data/account.dat");
		
		
		File f = new File(filePath);
		if(f.exists() == false) {
			System.err.println("메일 전송에 필요한 계정 정보가 없습니다.");
			return null;
		}
		
		Scanner sc = new Scanner(f);
		while(sc.hasNextLine()) {
			account = sc.nextLine();
		}
		sc.close();
		String result = ms.sendMail(member_email, authNumber, account);
		
		if(result.equals(authNumber)) {
			resp.put("status", "OK");
			resp.put("message","인증번호가 발송되었습니다.");
			
		}
		else {
			resp.put("status", "FAIL");
			resp.put("message", "인증번호 발송에 실패했습니다");
		}
		return resp;
	}
	
	
	@GetMapping("/member/getAuthNumber")
	public HashMap<String, String> getAuthNumber(String userNumber, HttpSession session) {
		HashMap<String, String> resp = new HashMap<>();
		String sessionHash = (String)session.getAttribute("hashNumber");
		String userHash = hash.getHash(userNumber);
		boolean flag = userHash.equals(sessionHash);
		
		resp.put("status", flag ? "OK" : "Fail");
		resp.put("message", flag ? "인증이 완료되었습니다." : "인증번호를 다시 확인해주세요");
		return resp;
	}
}
