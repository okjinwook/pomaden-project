package com.pomaden.model;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private String product_name;
	private MultipartFile product_upload;
	private String product_img;
	private int product_price;
	private int product_sale;
	private String product_category;
	private String product_kind;
	private int product_like;
	
	
	public MultipartFile getProduct_upload() {
		return product_upload;
	}
	public void setProduct_upload(MultipartFile product_upload) {
		this.product_upload = product_upload;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_sale() {
		return product_sale;
	}
	public void setProduct_sale(int product_sale) {
		this.product_sale = product_sale;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_kind() {
		return product_kind;
	}
	public void setProduct_kind(String product_kind) {
		this.product_kind = product_kind;
	}
	public int getProduct_like() {
		return product_like;
	}
	public void setProduct_like(int product_like) {
		this.product_like = product_like;
	}
	
	
}
