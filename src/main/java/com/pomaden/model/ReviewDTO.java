package com.pomaden.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
	private int review_idx;
	private String review_member_id;
	private String review_product;
	private int review_orderList_idx;
	private MultipartFile review_upload;
	private String review_img;
	private String review_content;
	private Date review_date;
	private int review_grade;
	private String review_color;
	private String review_size;
	
	
	public String getReview_color() {
		return review_color;
	}
	public void setReview_color(String review_color) {
		this.review_color = review_color;
	}
	public String getReview_size() {
		return review_size;
	}
	public void setReview_size(String review_size) {
		this.review_size = review_size;
	}
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getReview_member_id() {
		return review_member_id;
	}
	public void setReview_member_id(String review_member_id) {
		this.review_member_id = review_member_id;
	}
	public String getReview_product() {
		return review_product;
	}
	public void setReview_product(String review_product) {
		this.review_product = review_product;
	}
	public MultipartFile getReview_upload() {
		return review_upload;
	}
	public void setReview_upload(MultipartFile review_upload) {
		this.review_upload = review_upload;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return new SimpleDateFormat("yyyy-MM-dd").format(review_date);
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getReview_grade() {
		return review_grade;
	}
	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}
	public int getReview_orderList_idx() {
		return review_orderList_idx;
	}
	public void setReview_orderList_idx(int review_orderList_idx) {
		this.review_orderList_idx = review_orderList_idx;
	}
	
	
}
