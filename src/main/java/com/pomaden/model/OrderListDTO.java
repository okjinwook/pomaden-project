package com.pomaden.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderListDTO {
	private int orderList_idx;
	private String orderList_order_number;
	private String orderList_member_id;
	private String orderList_name;
	private String orderList_img;
	private int orderList_price;
	private int orderList_count;
	private String orderList_color;
	private String orderList_size;
	private String orderList_progress;
	private String orderList_check;
	private Date orderList_date;
	private int orderList_review_check;
	
	
	public String getOrderList_order_number() {
		return orderList_order_number;
	}
	public void setOrderList_order_number(String orderList_order_number) {
		this.orderList_order_number = orderList_order_number;
	}
	public int getOrderList_idx() {
		return orderList_idx;
	}
	public void setOrderList_idx(int orderList_idx) {
		this.orderList_idx = orderList_idx;
	}
	public String getOrderList_member_id() {
		return orderList_member_id;
	}
	public void setOrderList_member_id(String orderList_member_id) {
		this.orderList_member_id = orderList_member_id;
	}
	public String getOrderList_name() {
		return orderList_name;
	}
	public void setOrderList_name(String orderList_name) {
		this.orderList_name = orderList_name;
	}
	public String getOrderList_img() {
		return orderList_img;
	}
	public void setOrderList_img(String orderList_img) {
		this.orderList_img = orderList_img;
	}
	public int getOrderList_price() {
		return orderList_price;
	}
	public void setOrderList_price(int orderList_price) {
		this.orderList_price = orderList_price;
	}
	public int getOrderList_count() {
		return orderList_count;
	}
	public void setOrderList_count(int orderList_count) {
		this.orderList_count = orderList_count;
	}
	public String getOrderList_color() {
		return orderList_color;
	}
	public void setOrderList_color(String orderList_color) {
		this.orderList_color = orderList_color;
	}
	public String getOrderList_size() {
		return orderList_size;
	}
	public void setOrderList_size(String orderList_size) {
		this.orderList_size = orderList_size;
	}
	public String getOrderList_progress() {
		return orderList_progress;
	}
	public void setOrderList_progress(String orderList_progress) {
		this.orderList_progress = orderList_progress;
	}
	public String getOrderList_check() {
		return orderList_check;
	}
	public void setOrderList_check(String orderList_check) {
		this.orderList_check = orderList_check;
	}
	public String getOrderList_date() {
		return new SimpleDateFormat("yyyy-MM-dd").format(orderList_date);
	}
	public void setOrderList_date(Date orderList_date) {
		this.orderList_date = orderList_date;
	}
	public int getOrderList_review_check() {
		return orderList_review_check;
	}
	public void setOrderList_review_check(int orderList_review_check) {
		this.orderList_review_check = orderList_review_check;
	}
	
	
}
