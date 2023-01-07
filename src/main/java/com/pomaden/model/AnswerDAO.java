package com.pomaden.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface AnswerDAO {

	@Insert("insert into answer values("
			+ "answer_seq.nextval,"
			+ "#{answer_question_idx},"
			+ "'관리자',"
			+ "#{answer_content},"
			+ "sysdate)")
	int insert(AnswerDTO dto);

	@Select("select * from answer")
	List<AnswerDTO> selectAll();

}
