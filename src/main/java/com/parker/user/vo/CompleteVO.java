package com.parker.user.vo;

import java.util.Date;

import com.parker.user.boardcommon.PagingVO;

public class CompleteVO extends PagingVO {

	private int Buy_number;
	private String Buy_image;
	private String Buy_product;
	private int Buy_price;
	private int Buy_quantity;
	private Date Buy_day;
	private String Buy_status;
	private String Buy_status2;
	private int user_number;
	private int product_number;
	private String Buy_address;

	public int getBuy_number() {
		return Buy_number;
	}

	public void setBuy_number(int buy_number) {
		Buy_number = buy_number;
	}

	public String getBuy_image() {
		return Buy_image;
	}

	public void setBuy_image(String buy_image) {
		Buy_image = buy_image;
	}

	public String getBuy_product() {
		return Buy_product;
	}

	public void setBuy_product(String buy_product) {
		Buy_product = buy_product;
	}

	public int getBuy_price() {
		return Buy_price;
	}

	public void setBuy_price(int buy_price) {
		Buy_price = buy_price;
	}

	public int getBuy_quantity() {
		return Buy_quantity;
	}

	public void setBuy_quantity(int buy_quantity) {
		Buy_quantity = buy_quantity;
	}

	public Date getBuy_day() {
		return Buy_day;
	}

	public void setBuy_day(Date buy_day) {
		Buy_day = buy_day;
	}

	public String getBuy_status() {
		return Buy_status;
	}

	public void setBuy_status(String buy_status) {
		Buy_status = buy_status;
	}

	public String getBuy_status2() {
		return Buy_status2;
	}

	public void setBuy_status2(String buy_status2) {
		Buy_status2 = buy_status2;
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

	public String getBuy_address() {
		return Buy_address;
	}

	public void setBuy_address(String buy_address) {
		Buy_address = buy_address;
	}

	@Override
	public String toString() {
		return "CompleteVO [Buy_number=" + Buy_number + ", Buy_image=" + Buy_image + ", Buy_product=" + Buy_product
				+ ", Buy_price=" + Buy_price + ", Buy_quantity=" + Buy_quantity + ", Buy_day=" + Buy_day
				+ ", Buy_status=" + Buy_status + ", Buy_status2=" + Buy_status2 + ", user_number=" + user_number
				+ ", product_number=" + product_number + ", Buy_address=" + Buy_address + "]";
	}

}
