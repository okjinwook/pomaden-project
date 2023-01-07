package com.pomaden.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class AnswerDTO {
	private int answer_idx;
	private int answer_question_idx;
	private String answer_admin;
	private String answer_content;
	private Date answer_date;
	public int getAnswer_idx() {
		return answer_idx;
	}
	public void setAnswer_idx(int answer_idx) {
		this.answer_idx = answer_idx;
	}
	public int getAnswer_question_idx() {
		return answer_question_idx;
	}
	public void setAnswer_question_idx(int answer_question_idx) {
		this.answer_question_idx = answer_question_idx;
	}
	public String getAnswer_admin() {
		return answer_admin;
	}
	public void setAnswer_admin(String answer_admin) {
		this.answer_admin = answer_admin;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public String getAnswer_date() {
		return new SimpleDateFormat("yyyy-MM-dd").format(answer_date);
	}
	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
	}
	
	
}
