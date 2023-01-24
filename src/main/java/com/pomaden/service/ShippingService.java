package com.pomaden.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pomaden.model.MemberDTO;
import com.pomaden.model.ShippingDAO;
import com.pomaden.model.ShippingDTO;

@Service
public class ShippingService {
	@Autowired private ShippingDAO dao;
	
	public int insert(ShippingDTO dto) {
		return dao.insert(dto);
	}

	public ShippingDTO getShippingDto(MemberDTO dto) {
		ShippingDTO shipDto = new ShippingDTO();
		shipDto.setShipping_member_id(dto.getMember_id());
		shipDto.setShipping_code_add(dto.getMember_code_add());
		shipDto.setShipping_name(dto.getMember_name());
		shipDto.setShipping_phone(dto.getMember_phone());
		shipDto.setShipping_detail_add(dto.getMember_detail_add());
		shipDto.setShipping_load_add(dto.getMember_load_add());
		shipDto.setShipping_msg("부재 시 집 앞에 놔주세요.");
		shipDto.setShipping_rep(1);
		return shipDto;
	}

	public List<ShippingDTO> selectAll(String member_id) {
		return dao.selectAll(member_id);
	}

	public ShippingDTO selectOne(int shipping_idx) {
		return dao.selectOne(shipping_idx);
	}

	public int update(ShippingDTO dto) {
		return dao.update(dto);
	}

	public int delete(int shipping_idx) {
		return dao.delete(shipping_idx);
	}

}
