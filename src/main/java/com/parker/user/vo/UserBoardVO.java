package com.parker.user.vo;

import java.io.File;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.parker.user.boardcommon.PagingVO;

public class UserBoardVO extends PagingVO {

	private int userboard_number; // 회원게시판번호
	private String userboard_title; // 회원게시판 제목
	private String userboard_id; // 회원아이디
	private String userboard_name; // 회원게시판 작성자
	private String userboard_content; // 회원게시판 내용
	private Date userboard_writedate; // 회원게시판 작성일
	private String userboard_image; // 회원게시판 이미지
	private MultipartFile userboard_url; // 회원게시판 이미지
	private int userboard_viewCnt; // 회원게시판 조회수
	private int user_number; // 회원번호

	public String getUserboard_id() {
		return userboard_id;
	}

	public void setUserboard_id(String userboard_id) {
		this.userboard_id = userboard_id;
	}

	public int getUserboard_number() {
		return userboard_number;
	}

	public void setUserboard_number(int userboard_number) {
		this.userboard_number = userboard_number;
	}

	public String getUserboard_title() {
		return userboard_title;
	}

	public void setUserboard_title(String userboard_title) {
		this.userboard_title = userboard_title;
	}

	public String getUserboard_name() {
		return userboard_name;
	}

	public void setUserboard_name(String userboard_name) {
		this.userboard_name = userboard_name;
	}

	public String getUserboard_content() {
		return userboard_content;
	}

	public void setUserboard_content(String userboard_content) {
		this.userboard_content = userboard_content;
	}

	public Date getUserboard_writedate() {
		return userboard_writedate;
	}

	public void setUserboard_writedate(Date userboard_writedate) {
		this.userboard_writedate = userboard_writedate;
	}

	public String getUserboard_image() {
		return userboard_image;
	}

	public void setUserboard_image(String userboard_image) {
		this.userboard_image = userboard_image;
	}

	public int getUserboard_viewCnt() {
		return userboard_viewCnt;
	}

	public void setUserboard_viewCnt(int userboard_viewCnt) {
		this.userboard_viewCnt = userboard_viewCnt;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public MultipartFile getUserboard_url() {
		return userboard_url;
	}

	public void setUserboard_url(MultipartFile userboard_url) {
		this.userboard_url = userboard_url;
	}

	@Override
	public String toString() {
		return "UserBoardVO [userboard_number=" + userboard_number + ", userboard_title=" + userboard_title
				+ ", userboard_id=" + userboard_id + ", userboard_name=" + userboard_name + ", userboard_content="
				+ userboard_content + ", userboard_writedate=" + userboard_writedate + ", userboard_image="
				+ userboard_image + ", userboard_url=" + userboard_url + ", userboard_viewCnt=" + userboard_viewCnt
				+ ", user_number=" + user_number + "]";
	}

}
