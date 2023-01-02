package com.pomaden.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.CartDAO;
import com.pomaden.model.CartDTO;
import com.pomaden.model.MemberDTO;

@Service
public class CartService {
	@Autowired private CartDAO dao;
	public int insert(HashMap<String, Object> ob) {
		return dao.insert(ob);
	}
	public List<CartDTO> selectAll(String member_id) {
		return dao.selectAll(member_id);
	}
	public int update(HashMap<String, Object> map) {
		return dao.update(map);
	}
	public int cartDelete(int idx) {
		return dao.cartDelete(idx);
	}
	public CartDTO selectOne(HashMap<String, Object> ob) {
		return dao.selectOne(ob);
	}
	public int selectCount(String member_id) {
		return dao.selectCount(member_id);
	}
	public int delete(int idx) {
		return dao.cartDelete(idx);	
	}
	public List<CartDTO> getPayment(int[] list, MemberDTO login) {
		List<CartDTO> cartList = new ArrayList<>();
		for(int idx : list) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("idx", idx + "");
			map.put("member_id", login.getMember_id());
			CartDTO dto = dao.getPaymentItem(map);
			if(dto != null) {
				cartList.add(dto);
			}
		}
		return cartList;
	}

}
