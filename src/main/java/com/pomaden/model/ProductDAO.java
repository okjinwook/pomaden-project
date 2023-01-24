package com.pomaden.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

public interface ProductDAO {

	int insert(ProductDTO dto);
	
	@Select("select * from product")
	List<ProductDTO> selectAll();
	
	List<ProductDTO> selectList(HashMap<String, String> data);

	@Select("select DISTINCT product_kind from product where product_category = #{category} order by product_kind asc")
	List<ProductDTO> selectKind(String category);
	
	@Select("select * from product where product_name = #{product_name}")
	ProductDTO selectOne(String product_name);
	
	int update(HashMap<String, Object> map);
	
	@Delete("delete product where product_name = #{product_name}")
	int delete(String product_name);

}
