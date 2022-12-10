package com.pomaden.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class QuestionDTO {
	private int question_idx;
	private String question_member_id;
	private String question_title;
	private String question_content;
	private Date question_date;
	private String question_check;
	private String question_category;
	public int getQuestion_idx() {
		return question_idx;
	}
	public void setQuestion_idx(int question_idx) {
		this.question_idx = question_idx;
	}
	public String getQuestion_member_id() {
		return question_member_id;
	}
	public void setQuestion_member_id(String question_member_id) {
		this.question_member_id = question_member_id;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public String getQuestion_date() {
		return new SimpleDateFormat("yyyy-MM-dd").format(question_date);
	}
	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}
	public String getQuestion_check() {
		return question_check;
	}
	public void setQuestion_check(String question_check) {
		this.question_check = question_check;
	}
	public String getQuestion_category() {
		return question_category;
	}
	public void setQuestion_category(String question_category) {
		this.question_category = question_category;
	}
	
	
}
