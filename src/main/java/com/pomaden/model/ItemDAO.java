package com.pomaden.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ItemDAO {


	@Insert("insert into item values (#{item_name},#{item_color},#{item_size},#{item_count})")
	int insert(ItemDTO dto);
	
	@Select("select item_size from item where item_name = #{product_name}")
	List<String> selectSize(String product_name);

	@Select("select DISTINCT item_color from item where item_name = #{product_name}")
	List<String> selectColor(String product_name);
	

}
