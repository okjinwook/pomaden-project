package com.pomaden.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReplyDTO {
	private int reply_idx;
	private String reply_member_id;
	private int reply_review_idx;
	private String reply_content;
	private Date reply_date;
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public String getReply_member_id() {
		return reply_member_id;
	}
	public void setReply_member_id(String reply_member_id) {
		this.reply_member_id = reply_member_id;
	}
	public int getReply_review_idx() {
		return reply_review_idx;
	}
	public void setReply_review_idx(int reply_review_idx) {
		this.reply_review_idx = reply_review_idx;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return new SimpleDateFormat("yyyy-MM-dd").format(reply_date);
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
	
	
}
