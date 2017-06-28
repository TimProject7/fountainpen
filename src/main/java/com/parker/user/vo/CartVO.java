package com.parker.user.vo;

import java.util.Date;
import java.util.List;

public class CartVO {

	private int cartlistId; // --장바구니 번호
	private String cartlistName;// --장바구니 상품명
	private int cartlistQuantity;// --장바구니 상품 수량
	private String cartlistCompany;// --장바구니 상품 제조사
	private String cartlistOrigin;// --장바구니 상품 원산지
	private String cartlistImage;// --장바구니 상품 이미지
	private int cartlistPrice;// --장바구니 상품가격
	private Date cartlistAdddate;// --장바구니등록일자
	private int userId;// --회원번호
	private int productId;// --상품번호
	private int money; // 합계금액
	private int total; // 총구매금액
	private List<CartVO> list;

	public int getCartlistId() {
		return cartlistId;
	}

	public void setCartlistId(int cartlistId) {
		this.cartlistId = cartlistId;
	}

	public String getCartlistName() {
		return cartlistName;
	}

	public void setCartlistName(String cartlistName) {
		this.cartlistName = cartlistName;
	}

	public int getCartlistQuantity() {
		return cartlistQuantity;
	}

	public void setCartlistQuantity(int cartlistQuantity) {
		this.cartlistQuantity = cartlistQuantity;
	}

	public String getCartlistCompany() {
		return cartlistCompany;
	}

	public void setCartlistCompany(String cartlistCompany) {
		this.cartlistCompany = cartlistCompany;
	}

	public String getCartlistOrigin() {
		return cartlistOrigin;
	}

	public void setCartlistOrigin(String cartlistOrigin) {
		this.cartlistOrigin = cartlistOrigin;
	}

	public String getCartlistImage() {
		return cartlistImage;
	}

	public void setCartlistImage(String cartlistImage) {
		this.cartlistImage = cartlistImage;
	}

	public int getCartlistPrice() {
		return cartlistPrice;
	}

	public void setCartlistPrice(int cartlistPrice) {
		this.cartlistPrice = cartlistPrice;
	}

	public Date getCartlistAdddate() {
		return cartlistAdddate;
	}

	public void setCartlistAdddate(Date cartlistAdddate) {
		this.cartlistAdddate = cartlistAdddate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<CartVO> getList() {
		return list;
	}

	public void setList(List<CartVO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "CartVO [cartlistId=" + cartlistId + ", cartlistName=" + cartlistName + ", cartlistQuantity="
				+ cartlistQuantity + ", cartlistCompany=" + cartlistCompany + ", cartlistOrigin=" + cartlistOrigin
				+ ", cartlistImage=" + cartlistImage + ", cartlistPrice=" + cartlistPrice + ", cartlistAdddate="
				+ cartlistAdddate + ", userId=" + userId + ", productId=" + productId + ", money=" + money + ", total="
				+ total + "]";
	}

}
