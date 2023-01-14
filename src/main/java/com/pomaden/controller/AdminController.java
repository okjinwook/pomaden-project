package com.pomaden.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pomaden.mail.Hash;
import com.pomaden.model.AdminDTO;
import com.pomaden.model.AnswerDTO;
import com.pomaden.model.ItemDTO;
import com.pomaden.model.MemberDTO;
import com.pomaden.model.NoticeDTO;
import com.pomaden.model.ProductDTO;
import com.pomaden.model.QuestionDTO;
import com.pomaden.model.ReviewDTO;
import com.pomaden.service.AdminService;
import com.pomaden.service.AnswerService;
import com.pomaden.service.ItemService;
import com.pomaden.service.MemberService;
import com.pomaden.service.NoticeService;
import com.pomaden.service.ProductService;
import com.pomaden.service.QuestionService;
import com.pomaden.service.ReviewService;

@Controller
public class AdminController {
	@Autowired private AdminService as;
	@Autowired private ProductService ps;
	@Autowired private ItemService is;
	@Autowired private MemberService ms;
	@Autowired private ReviewService rs;
	@Autowired private NoticeService ns; 
	@Autowired private QuestionService qs;
	@Autowired private AnswerService aws;
	
	@GetMapping("/admin")
	public void admin() {}
	
	@PostMapping("/admin/login")
	public ModelAndView login(AdminDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/admin/product_list");
		AdminDTO login = as.selectOne(dto);
		if(login != null) {
			session.setAttribute("adminLogin", login);
		}
		else {
			mav.setViewName("redirect:/admin");
		}
		return mav;
	}
	@GetMapping("/admin/product_insert")
	public void getProduct_insert() {}
	
	@PostMapping("admin/product_insert")
	public ModelAndView product_insert(ProductDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/admin/product_insert");
		ProductDTO checkDto = ps.selectOne(dto.getProduct_name());
		if(checkDto == null) {
			int row = ps.insert(dto);
			if(row == 1) {
				mav.addObject("msg", "정상적으로 등록되었습니다.");
				mav.addObject("dto", dto);
				mav.addObject("product_name", dto.getProduct_name());
			}
			else {
				mav.addObject("msg", "상품등록 실패!!!.");
			}
		}
		else {
			mav.addObject("msg", "이미 등록된 상품입니다.");
		}
		return mav;
	}
	@PostMapping("/admin/item_insert")
	public ModelAndView item_insert(ItemDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/admin/product_insert");
		int row = is.insert(dto);
		if(row == 1) {
			mav.addObject("msg", "정상적으로 등록되었습니다.");
			mav.addObject("product_name", dto.getItem_name());
		}
		else {
			mav.addObject("msg", "상품등록 실패!!!.");
		}
		return mav;
	}
	
	@GetMapping("/admin/product_list")
	public ModelAndView product_list() {
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> list = ps.selectAll();
		mav.addObject("list", list);
		return mav;
	}
	@ResponseBody
	@PostMapping("/admin/product_update")
	public HashMap<String, String> productUpdate(@RequestBody HashMap<String, Object> map) {
		HashMap<String, String> resp = new HashMap<String, String>();
		int row = ps.update(map);
		if(row == 1) {
			resp.put("msg", "상품이 수정되었습니다.");
		}
		else {
			resp.put("msg", "수정 실패");
		}
		return resp;
	}
	@ResponseBody
	@PostMapping("/admin/product_delete")
	public HashMap<String, String> productDelete(String product_name) {
		HashMap<String, String> resp = new HashMap<String, String>();
		int row = ps.delete(product_name);
		if(row == 1) {
			resp.put("msg", "상품이 삭제되었습니다.");
		}
		else {
			resp.put("msg", "수정 실패");
		}
		return resp;
	}
	
	@GetMapping("/admin/member_list")
	public ModelAndView member_list() {
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = ms.selectAll();
		mav.addObject("list", list);
		return mav;
	}
	@GetMapping("/admin/review_list")
	public ModelAndView review_list() {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sort", "review_date");
		List<ReviewDTO> list = rs.selectList(map);
		mav.addObject("list", list);
		return mav;
	}
	@GetMapping("/admin/notice_list")
	public ModelAndView notice_list() {
		ModelAndView mav = new ModelAndView();
		List<NoticeDTO> list = ns.selectList();
		mav.addObject("list", list);
		return mav;
	}
	@GetMapping("/admin/notice_insert")
	public void getNotice_insert() {}
	@PostMapping("/admin/notice_insert")
	public ModelAndView notice_insert(NoticeDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/admin/notice_insert");
		int row = ns.insert(dto);
		if(row == 1) {
			mav.addObject("msg", "공지가 등록되었습니다.");
		}
		else {
			mav.addObject("msg", "공지 등록 실패!!.");
		}
		return mav;
	}
	@GetMapping("/admin/question_list")
	public ModelAndView question_list(String check, String category) {
		HashMap<String, String> map = new HashMap<String, String>();
		ModelAndView mav = new ModelAndView();
		map.put("search", null);
		map.put("category", null); 
		map.put("check", null);
		map.put("page", null);
		if(check != null && "전체".equals(check) == false && check != "") {
			map.put("check", check);
			System.out.println(check);
		}
		if(category != null && "전체".equals(category) == false && category != "") {
			System.out.println(category);
			map.put("category", category);
		}
		List<QuestionDTO> list = qs.selectList(map);
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/admin/answer_insert")
	public ModelAndView answer_insert(AnswerDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/admin/question_list");
		int updateRow = qs.update(dto.getAnswer_question_idx());
		int insertRow = aws.insert(dto);
		if(insertRow == 1 && updateRow == 1) {
			mav.addObject("msg", "답변이 등록되었습니다.");
		}
		else {
			mav.addObject("msg", "답변 실패!!");
		}
		return mav;
	}
}
