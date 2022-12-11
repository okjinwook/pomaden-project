package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

public interface QuestionDAO {
	
	int insert(QuestionDTO getDto);

	List<QuestionDTO> selectAll(HashMap<String, String> map);


}
