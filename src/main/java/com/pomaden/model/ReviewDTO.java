package com.pomaden.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
	private int review_idx;
	private String review_member_id;
	private String review_product;
	private MultipartFile review_upload;
	private String review_img;
	private String review_content;
	private Date review_date;
	private int review_grade;
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
	
	
}
