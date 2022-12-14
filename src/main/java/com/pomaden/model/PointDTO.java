package com.pomaden.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class PointDTO {
	private int point_idx;
    private String point_member_id;
    private String point_content;
    private String point_change;
    private int point_total;
    private Date point_date;
	public int getPoint_idx() {
		return point_idx;
	}
	public void setPoint_idx(int point_idx) {
		this.point_idx = point_idx;
	}
	public String getPoint_member_id() {
		return point_member_id;
	}
	public void setPoint_member_id(String point_member_id) {
		this.point_member_id = point_member_id;
	}
	public String getPoint_content() {
		return point_content;
	}
	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}
	public String getPoint_change() {
		return point_change;
	}
	public void setPoint_change(String point_change) {
		this.point_change = point_change;
	}
	public int getPoint_total() {
		return point_total;
	}
	public void setPoint_total(int point_total) {
		this.point_total = point_total;
	}
	public String getPoint_date() {
		return new SimpleDateFormat("yyyy-MM-dd").format(point_date);
	}
	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}
    
    
}
