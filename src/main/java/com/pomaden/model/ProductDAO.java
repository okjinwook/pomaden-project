package com.pomaden.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ProductDAO {

	int insert(ProductDTO dto);
	
	@Select("select * from product")
	List<ProductDTO> selectAll();
}
