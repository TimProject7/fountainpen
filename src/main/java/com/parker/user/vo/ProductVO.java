package com.parker.user.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.parker.user.boardcommon.PagingVO;

public class ProductVO extends PagingVO {
	private int productId; // 상품번호
	private String productName; // 상품이름
	private int productPrice; // 상품가격
	private String productContent; // 상품 상세내용
	private String productImage; // 상품이미지 경로
	private int productQuantity; // 상품수량
	private String productCompany; // 상품제조사
	private String productOrigin; // 상품원산지
	private MultipartFile productPhoto; // 상품이미지 파일
	private Date productRegdate; // 등록일자

	// 조건검색시 사용할 필드
	private String search = "";
	private String keyword = "";

	// 검색
	private String weeks2;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getProductCompany() {
		return productCompany;
	}

	public void setProductCompany(String productCompany) {
		this.productCompany = productCompany;
	}

	public String getProductOrigin() {
		return productOrigin;
	}

	public void setProductOrigin(String productOrigin) {
		this.productOrigin = productOrigin;
	}

	public MultipartFile getProductPhoto() {
		return productPhoto;
	}

	public void setProductPhoto(MultipartFile productPhoto) {
		this.productPhoto = productPhoto;
	}

	public Date getProductRegdate() {
		return productRegdate;
	}

	public void setProductRegdate(Date productRegdate) {
		this.productRegdate = productRegdate;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getWeeks2() {
		return weeks2;
	}

	public void setWeeks2(String weeks2) {
		this.weeks2 = weeks2;
	}

}
