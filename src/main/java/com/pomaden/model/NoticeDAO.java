package com.pomaden.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface NoticeDAO {

	@Select("select * from notice")
	List<NoticeDTO> selectList();

	@Insert("insert into notice values("
			+ "notice_seq.nextval,"
			+ "'관리자',"
			+ "#{notice_title},"
			+ "#{notice_content},"
			+ "sysdate"
			+ ")")
	int insert(NoticeDTO dto);

	@Select("select * from notice where notice_idx = #{notice_idx}")
	NoticeDTO selectOne(int notice_idx);

	@Delete("delete notice where notice_idx = #{notice_idx}")
	int delete(int notice_idx);

}
