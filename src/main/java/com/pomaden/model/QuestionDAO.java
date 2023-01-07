package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface QuestionDAO {
	
	int insert(QuestionDTO getDto);

	List<QuestionDTO> selectAll(HashMap<String, String> map);

	@Update("update question set question_check = '답변완료' where question_idx = #{question_idx}")
	int update(int question_idx);
	


}
