package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ReviewDAO {

	int insert(ReviewDTO dto);

	
	List<ReviewDTO> selectList(HashMap<String, String> map);

}
