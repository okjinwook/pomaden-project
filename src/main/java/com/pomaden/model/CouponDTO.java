package com.pomaden.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CouponDTO {
	private int coupon_idx;       
    private String coupon_member_id;
    private String coupon_name;
    private String coupon_benefit;
    private String coupon_condition;
    private Date coupon_date;
    private int coupon_sale;
    
    
	public int getCoupon_sale() {
		return coupon_sale;
	}
	public void setCoupon_sale(int coupon_sale) {
		this.coupon_sale = coupon_sale;
	}
	public int getCoupon_idx() {
		return coupon_idx;
	}
	public void setCoupon_idx(int coupon_idx) {
		this.coupon_idx = coupon_idx;
	}
	public String getCoupon_member_id() {
		return coupon_member_id;
	}
	public void setCoupon_member_id(String coupon_member_id) {
		this.coupon_member_id = coupon_member_id;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getCoupon_benefit() {
		return coupon_benefit;
	}
	public void setCoupon_benefit(String coupon_benefit) {
		this.coupon_benefit = coupon_benefit;
	}
	public String getCoupon_condition() {
		return coupon_condition;
	}
	public void setCoupon_condition(String coupon_condition) {
		this.coupon_condition = coupon_condition;
	}
	public String getCoupon_date() {
		return new SimpleDateFormat("yyyy-MM-dd").format(coupon_date);
	}
	public void setCoupon_date(Date coupon_date) {
		this.coupon_date = coupon_date;
	}
    
    
}
