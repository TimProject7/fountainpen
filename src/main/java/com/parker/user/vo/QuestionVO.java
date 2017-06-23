package com.parker.user.vo;

import java.io.File;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.parker.user.boardcommon.PagingVO;

public class QuestionVO extends PagingVO {
	private int question_number; // --게시글 번호
	private String question_title; // --글 제목
	private String question_content; // --글내용
	private Date question_writedate; // --작성일
	private String user_name; // 작성자
	private String question_image; // --이미지
	private MultipartFile question_url;
	private int question_viewCount; // --조회수
	private int user_number; // --회원번호

	public String getQuestion_image() {
		return question_image;
	}

	public void setQuestion_image(String question_image) {
		this.question_image = question_image;
	}

	public MultipartFile getQuestion_url() {
		return question_url;
	}

	public void setQuestion_url(MultipartFile question_url) {
		this.question_url = question_url;
	}

	public int getQuestion_number() {
		return question_number;
	}

	public void setQuestion_number(int question_number) {
		this.question_number = question_number;
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

	public Date getQuestion_writedate() {
		return question_writedate;
	}

	public void setQuestion_writedate(Date question_writedate) {
		this.question_writedate = question_writedate;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public int getQuestion_viewCount() {
		return question_viewCount;
	}

	public void setQuestion_viewCount(int question_viewCount) {
		this.question_viewCount = question_viewCount;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "QuestionVO [question_number=" + question_number + ", question_title=" + question_title
				+ ", question_content=" + question_content + ", question_writedate=" + question_writedate
				+ ", user_name=" + user_name + ", question_image=" + question_image + ", question_viewCount="
				+ question_viewCount + ", user_number=" + user_number + "]";
	}

}
