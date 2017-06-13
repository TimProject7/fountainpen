package com.parker.user.vo;

import java.util.Date;

public class CartlistVO {
	private int Cartlist_number; // 장바구니 번호
	private String Cartlist_name; // 상품명
	private int Cartlist_quantity; // 수량
	private String Cartlist_company; // 제조사
	private String Cartlist_origin; // 원산지
	private String Cartlist_image; // 이미지
	private String Cartlist_price; // 가격
	private Date Cartlist_adddate; // 장바구니 등록날짜
	private int user_number; // 회원번호
	private int product_number; // 상품번호

	public int getCartlist_number() {
		return Cartlist_number;
	}

	public void setCartlist_number(int cartlist_number) {
		Cartlist_number = cartlist_number;
	}

	public String getCartlist_name() {
		return Cartlist_name;
	}

	public void setCartlist_name(String cartlist_name) {
		Cartlist_name = cartlist_name;
	}

	public int getCartlist_quantity() {
		return Cartlist_quantity;
	}

	public void setCartlist_quantity(int cartlist_quantity) {
		Cartlist_quantity = cartlist_quantity;
	}

	public String getCartlist_company() {
		return Cartlist_company;
	}

	public void setCartlist_company(String cartlist_company) {
		Cartlist_company = cartlist_company;
	}

	public String getCartlist_origin() {
		return Cartlist_origin;
	}

	public void setCartlist_origin(String cartlist_origin) {
		Cartlist_origin = cartlist_origin;
	}

	public String getCartlist_image() {
		return Cartlist_image;
	}

	public void setCartlist_image(String cartlist_image) {
		Cartlist_image = cartlist_image;
	}

	public String getCartlist_price() {
		return Cartlist_price;
	}

	public void setCartlist_price(String cartlist_price) {
		Cartlist_price = cartlist_price;
	}

	public Date getCartlist_adddate() {
		return Cartlist_adddate;
	}

	public void setCartlist_adddate(Date cartlist_adddate) {
		Cartlist_adddate = cartlist_adddate;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}

	@Override
	public String toString() {
		return "CartlistVO [Cartlist_number=" + Cartlist_number + ", Cartlist_name=" + Cartlist_name
				+ ", Cartlist_quantity=" + Cartlist_quantity + ", Cartlist_company=" + Cartlist_company
				+ ", Cartlist_origin=" + Cartlist_origin + ", Cartlist_image=" + Cartlist_image + ", Cartlist_price="
				+ Cartlist_price + ", Cartlist_adddate=" + Cartlist_adddate + ", user_number=" + user_number
				+ ", product_number=" + product_number + "]";
	}

}
