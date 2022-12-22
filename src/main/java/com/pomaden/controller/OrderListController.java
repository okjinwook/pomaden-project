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
	public ModelAndView insert(@RequestBody List<HashMap<String, Object>> list, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		for(HashMap<String, Object> map : list) {
			map.put("orderList_member_id", login.getMember_id());
			int row = os.insert(map);
		}
		return mav;
	}
}
