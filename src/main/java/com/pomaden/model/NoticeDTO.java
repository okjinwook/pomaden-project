package com.pomaden.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class NoticeDTO {
	private int notice_idx;
	private String notice_admin;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_admin() {
		return notice_admin;
	}
	public void setNotice_admin(String notice_admin) {
		this.notice_admin = notice_admin;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_date() {
		return new SimpleDateFormat("yyyy-MM-dd").format(notice_date);
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	
}
