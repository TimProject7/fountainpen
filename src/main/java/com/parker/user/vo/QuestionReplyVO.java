package com.parker.user.vo;

import java.sql.Date;

public class QuestionReplyVO {

	private int questionreply_number;
	private String questionreply_content;
	private Date questionreply_writedate;
	private String questionreply_image;
	private int question_number;
	private int admin_number;

	public int getQuestionreply_number() {
		return questionreply_number;
	}

	public void setQuestionreply_number(int questionreply_number) {
		this.questionreply_number = questionreply_number;
	}

	public String getQuestionreply_content() {
		return questionreply_content;
	}

	public void setQuestionreply_content(String questionreply_content) {
		this.questionreply_content = questionreply_content;
	}

	public String getQuestionreply_image() {
		return questionreply_image;
	}

	public void setQuestionreply_image(String questionreply_image) {
		this.questionreply_image = questionreply_image;
	}

	public int getQuestion_number() {
		return question_number;
	}

	public void setQuestion_number(int question_number) {
		this.question_number = question_number;
	}

	public int getAdmin_number() {
		return admin_number;
	}

	public void setAdmin_number(int admin_number) {
		this.admin_number = admin_number;
	}

	public Date getQuestionreply_writedate() {
		return questionreply_writedate;
	}

	public void setQuestionreply_writedate(Date questionreply_writedate) {
		this.questionreply_writedate = questionreply_writedate;
	}

	@Override
	public String toString() {
		return "QuestionReplyVO [questionreply_number=" + questionreply_number + ", questionreply_content="
				+ questionreply_content + ", questionreply_writedate=" + questionreply_writedate
				+ ", questionreply_image=" + questionreply_image + ", question_number=" + question_number
				+ ", admin_number=" + admin_number + "]";
	}

}
