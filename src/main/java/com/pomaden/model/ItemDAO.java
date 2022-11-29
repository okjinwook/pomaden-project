package com.pomaden.model;

import org.apache.ibatis.annotations.Insert;

public interface ItemDAO {
	@Insert("insert into item values (#{item_name},#{item_color},#{item_size},#{item_count})")
	int insert(ItemDTO dto);

}
