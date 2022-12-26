package com.pomaden.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.model.CouponDTO;
import com.pomaden.model.LikeProductDTO;
import com.pomaden.model.MemberDTO;
import com.pomaden.model.OrderListDTO;
import com.pomaden.model.PointDTO;
import com.pomaden.model.QuestionDTO;
import com.pomaden.model.ReviewDTO;
import com.pomaden.service.CouponService;
import com.pomaden.service.LikeProductService;
import com.pomaden.service.MemberService;
import com.pomaden.service.MyPageService;
import com.pomaden.service.OrderListService;
import com.pomaden.service.PointService;
import com.pomaden.service.QuestionService;
import com.pomaden.service.ReviewService;

@Controller
public class MyPageController {
	@Autowired private MemberService ms;
	@Autowired private QuestionService qs;
	@Autowired private LikeProductService ls;
	@Autowired private CouponService cs;
	@Autowired private PointService ps;
	@Autowired private OrderListService os;
	@Autowired private ReviewService rs;
	
	
	@GetMapping("/myPage/orderList")
	public ModelAndView orderList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		List<OrderListDTO> list = os.selectList(login.getMember_id());
		mav.addObject("list", list);
		return mav;
	}
		
	@GetMapping("/myPage/point")
	public ModelAndView point(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		String member_id = login.getMember_id();
		List<PointDTO> list = ps.selectAll(member_id);
		mav.addObject("list", list);
		return mav;
	}
	@GetMapping("/myPage/coupon")
	public ModelAndView coupon(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		String member_id = login.getMember_id();
		List<CouponDTO> list = cs.selectAll(member_id);
		mav.addObject("list", list);
		return mav;
	}
	@GetMapping("/myPage/board")
	public ModelAndView board(HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		map.put("member_id", login.getMember_id());
		map.put("sort", "review_grade");
		List<ReviewDTO> list = rs.selectList(map);
		mav.addObject("list", list);
		return mav;
	}
	
	
	@GetMapping("/myPage/like")
	public ModelAndView like(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		mav.addObject("login", session.getAttribute("login"));
		List<LikeProductDTO> list = ls.selectAll(dto.getMember_id());
		mav.addObject("list", list);
		return mav;
	}
	
	
	@GetMapping("/myPage/member_info")
	public ModelAndView member_info(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("login", session.getAttribute("login"));
		return mav;
	}
	@GetMapping("/myPage/myQuestion")
	public ModelAndView myQuestion(HttpSession session, String page) {
		HashMap<String , String> map = new HashMap<String, String>();
		ModelAndView mav = new ModelAndView();
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		map.put("offset", page);
		map.put("member", member.getMember_id());
		int count = qs.getCount(map); 
		List<QuestionDTO> list = qs.selectAll(map);
		mav.addObject("list", list);
		mav.addObject("count", count);
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
