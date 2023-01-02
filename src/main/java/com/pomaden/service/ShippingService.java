package com.pomaden.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.pomaden.model.MemberDTO;
import com.pomaden.model.ShippingDAO;

@Service
public class ShippingService {
	private ShippingDAO dao;
	
	public int insert(HashMap<String, String> shippingMap) {
		return dao.insert(shippingMap);
	}

	public HashMap<String, String> getShippingMap(MemberDTO dto) {
		HashMap<String, String> shippingMap = new HashMap<String, String>();
		shippingMap.put("shipping_member_id", dto.getMember_id());
		shippingMap.put("shipping_name", dto.getMember_name());
		shippingMap.put("shipping_phone", dto.getMember_phone());
		shippingMap.put("shipping_load_add", dto.getMember_load_add());
		shippingMap.put("shipping_code_add", dto.getMember_code_add());
		shippingMap.put("shipping_detail_add", dto.getMember_detail_add());
		return shippingMap;
	}

}
