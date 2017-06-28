package com.parker.user.vo;

import java.sql.Date;

public class UserBoardReplyVO {
	private int userboardreply_number;// 회원게시판댓글 번호
	private String userboardreply_content;// 회원게시판 댓글내용
	private Date userboardreply_writedate; // 회원게시판 댓글작성일
	private int userboard_number; // 회원게시판 번호
	private int user_number; // 회원번호
	private String user_name; // 회원이름
	private String user_id; // 회원아이디

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getUserboardreply_number() {
		return userboardreply_number;
	}

	public void setUserboardreply_number(int userboardreply_number) {
		this.userboardreply_number = userboardreply_number;
	}

	public String getUserboardreply_content() {
		return userboardreply_content;
	}

	public void setUserboardreply_content(String userboardreply_content) {
		this.userboardreply_content = userboardreply_content;
	}

	public Date getUserboardreply_writedate() {
		return userboardreply_writedate;
	}

	public void setUserboardreply_writedate(Date userboardreply_writedate) {
		this.userboardreply_writedate = userboardreply_writedate;
	}

	public int getUserboard_number() {
		return userboard_number;
	}

	public void setUserboard_number(int userboard_number) {
		this.userboard_number = userboard_number;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;

	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "UserBoardReplyVO [userboardreply_number=" + userboardreply_number + ", userboardreply_content="
				+ userboardreply_content + ", userboardreply_writedate=" + userboardreply_writedate
				+ ", userboard_number=" + userboard_number + ", user_number=" + user_number + ", user_name=" + user_name
				+ ", user_id=" + user_id + "]";
	}

}
