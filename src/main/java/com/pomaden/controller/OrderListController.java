package com.pomaden.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.MemberDTO;
import com.pomaden.service.OrderListService;

@Controller
public class OrderListController {
	@Autowired private OrderListService os;
	
	@ResponseBody
	@PostMapping("/orderList/insert")
	public HashMap<String, String> insert(@RequestBody List<HashMap<String, Object>> list, HttpSession session) {
		int row = 1;
		HashMap<String, String> resp = new HashMap<String, String>(); 
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		for(HashMap<String, Object> map : list) {
			map.put("orderList_member_id", login.getMember_id());
			row = os.insert(map);
			if(row == 0) {
				resp.put("status", "FAIL");
				resp.put("msg", "결제요청에 실패하였습니다.");
				return resp;
			}
		}
		resp.put("status", "OK");
		resp.put("msg", "정상적으로 상품이 구매되었습니다.");
		return resp;
	}
}
