package com.pomaden.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface AnswerDAO {

	int insert(AnswerDTO dto);

	@Select("select * from answer")
	List<AnswerDTO> selectAll();

}
