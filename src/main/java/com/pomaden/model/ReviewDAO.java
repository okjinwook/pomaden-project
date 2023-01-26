package com.pomaden.model;

import java.util.HashMap;
import java.util.List;


public interface ReviewDAO {

	int insert(ReviewDTO dto);
	
	List<ReviewDTO> selectList(HashMap<String, String> map);

}
