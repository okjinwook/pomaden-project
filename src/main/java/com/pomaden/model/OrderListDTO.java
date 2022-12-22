package com.pomaden.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderListDTO {
	private int orderlist_idx;
	private String orderlist_member_id;
	private String orderlist_name;
	private String orderlist_img;
	private int orderlist_price;
	private int orderlist_count;
	private String orderlist_color;
	private String orderlist_size;
	private String orderlist_progress;
	private String orderlist_check;
	private Date orderlist_date;
	public int getOrderlist_idx() {
		return orderlist_idx;
	}
	public void setOrderlist_idx(int orderlist_idx) {
		this.orderlist_idx = orderlist_idx;
	}
	public String getOrderlist_member_id() {
		return orderlist_member_id;
	}
	public void setOrderlist_member_id(String orderlist_member_id) {
		this.orderlist_member_id = orderlist_member_id;
	}
	public String getOrderlist_name() {
		return orderlist_name;
	}
	public void setOrderlist_name(String orderlist_name) {
		this.orderlist_name = orderlist_name;
	}
	public String getOrderlist_img() {
		return orderlist_img;
	}
	public void setOrderlist_img(String orderlist_img) {
		this.orderlist_img = orderlist_img;
	}
	public int getOrderlist_price() {
		return orderlist_price;
	}
	public void setOrderlist_price(int orderlist_price) {
		this.orderlist_price = orderlist_price;
	}
	public int getOrderlist_count() {
		return orderlist_count;
	}
	public void setOrderlist_count(int orderlist_count) {
		this.orderlist_count = orderlist_count;
	}
	public String getOrderlist_color() {
		return orderlist_color;
	}
	public void setOrderlist_color(String orderlist_color) {
		this.orderlist_color = orderlist_color;
	}
	public String getOrderlist_size() {
		return orderlist_size;
	}
	public void setOrderlist_size(String orderlist_size) {
		this.orderlist_size = orderlist_size;
	}
	public String getOrderlist_progress() {
		return orderlist_progress;
	}
	public void setOrderlist_progress(String orderlist_progress) {
		this.orderlist_progress = orderlist_progress;
	}
	public String getOrderlist_check() {
		return orderlist_check;
	}
	public void setOrderlist_check(String orderlist_check) {
		this.orderlist_check = orderlist_check;
	}
	public String getOrderlist_date() {
		return new SimpleDateFormat("yyyy-MM-dd").format(orderlist_date);
	}
	public void setOrderlist_date(Date orderlist_date) {
		this.orderlist_date = orderlist_date;
	}
	
	
	
}
