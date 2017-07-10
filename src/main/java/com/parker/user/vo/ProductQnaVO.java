package com.parker.user.vo;

import java.sql.Date;

import com.parker.user.boardcommon.PagingVO;

//상품qna게시판
public class ProductQnaVO extends PagingVO {
	private int productQna_number; // 상품qna번호 프라이머리키
	private String productQna_name; // 상품qna 작성자
	private String productQna_type; // 상품문의 유형
	private String productQna_content;// --상품qna내용
	private Date productQna_writedate;// --상품등록날짜
	private int productQna_viewCnt; // 상품조회수
	private int user_number;// --회원번호
	private int productId; // 상품번호

	public int getProductQna_number() {
		return productQna_number;
	}

	public void setProductQna_number(int productQna_number) {
		this.productQna_number = productQna_number;
	}

	public String getProductQna_name() {
		return productQna_name;
	}

	public void setProductQna_name(String productQna_name) {
		this.productQna_name = productQna_name;
	}

	public String getProductQna_type() {
		return productQna_type;
	}

	public void setProductQna_type(String productQna_type) {
		this.productQna_type = productQna_type;
	}

	public String getProductQna_content() {
		return productQna_content;
	}

	public void setProductQna_content(String productQna_content) {
		this.productQna_content = productQna_content;
	}

	public Date getProductQna_writedate() {
		return productQna_writedate;
	}

	public void setProductQna_writedate(Date productQna_writedate) {
		this.productQna_writedate = productQna_writedate;
	}

	public int getProductQna_viewCnt() {
		return productQna_viewCnt;
	}

	public void setProductQna_viewCnt(int productQna_viewCnt) {
		this.productQna_viewCnt = productQna_viewCnt;
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
		return "ProductQnaVO [productQna_number=" + productQna_number + ", productQna_name=" + productQna_name
				+ ", productQna_type=" + productQna_type + ", productQna_content=" + productQna_content
				+ ", productQna_writedate=" + productQna_writedate + ", productQna_viewCnt=" + productQna_viewCnt
				+ ", user_number=" + user_number + ", productId=" + productId + "]";
	}

}