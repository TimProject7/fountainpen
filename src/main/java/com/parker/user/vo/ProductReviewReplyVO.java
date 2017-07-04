package com.parker.user.vo;

import java.sql.Date;

public class ProductReviewReplyVO {
	private int reviewReply_number; // 후기번호
	private String reviewReply_title; // 후기제목
	private String reviewReply_content; // 후기내용
	private Date reviewReply_writedate; // 후기날짜
	private String reviewReply_image; // 후기이미지
	private int user_number; // 회원번호
	private int productId; // 상품번호
	private String user_id; // 회원아이디

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getReviewReply_number() {
		return reviewReply_number;
	}

	public void setReviewReply_number(int reviewReply_number) {
		this.reviewReply_number = reviewReply_number;
	}

	public String getReviewReply_title() {
		return reviewReply_title;
	}

	public void setReviewReply_title(String reviewReply_title) {
		this.reviewReply_title = reviewReply_title;
	}

	public String getReviewReply_content() {
		return reviewReply_content;
	}

	public void setReviewReply_content(String reviewReply_content) {
		this.reviewReply_content = reviewReply_content;
	}

	public Date getReviewReply_writedate() {
		return reviewReply_writedate;
	}

	public void setReviewReply_writedate(Date reviewReply_writedate) {
		this.reviewReply_writedate = reviewReply_writedate;
	}

	public String getReviewReply_image() {
		return reviewReply_image;
	}

	public void setReviewReply_image(String reviewReply_image) {
		this.reviewReply_image = reviewReply_image;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}


	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	@Override
	public String toString() {
		return "ProductReviewReplyVO [reviewReply_number=" + reviewReply_number + ", reviewReply_title="
				+ reviewReply_title + ", reviewReply_content=" + reviewReply_content + ", reviewReply_writedate="
				+ reviewReply_writedate + ", reviewReply_image=" + reviewReply_image + ", user_number=" + user_number
				+ ", productId=" + productId + ", user_id=" + user_id + "]";
	}



}