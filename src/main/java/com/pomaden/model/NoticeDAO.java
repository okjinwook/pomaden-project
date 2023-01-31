package com.pomaden.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface NoticeDAO {

	@Select("select * from notice")
	List<NoticeDTO> selectList();

	int insert(NoticeDTO dto);

	@Select("select * from notice where notice_idx = #{notice_idx}")
	NoticeDTO selectOne(int notice_idx);

	@Delete("delete from notice where notice_idx = #{notice_idx}")
	int delete(int notice_idx);

}
