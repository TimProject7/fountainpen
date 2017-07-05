package com.parker.user.vo;

import java.util.Date;

import com.parker.user.boardcommon.PagingVO;

public class BuyVO extends PagingVO {
	// 프라이머리 키
	private int buy_number; // 구매번호
	private int user_number; // 회원번호
	private int product_number; // 상품번호

	private Date buy_day; // 구매날짜
	private String buy_address; // 구매주소
	private String buy_product; // 구매상품명
	private int buy_quantity; // 구매수량
	private int buy_price; // 구매가격
	private String buy_status; // 구매후 배송상태
	private int group_number; // 구매그룹번호
	private String buy_image; // 구매상품이미지
	private String user_name; // 회원이름
	private String user_email; // 회원이메일
	private String user_cell; // 전화번호
	private String user_phone; // 핸드폰번호
	private String name; // 받는사람이름
	private String cell; // 받는사람전화번호
	private String email; // 받는사람이메일
	private String zip_code; // 우편번호
	private String user_address; // 주소
	private String detail_address; // 상세주소
	private String buy_Message; // 배송메시지
	private int money; // 합계금액
	private int total; // 총구매금액

	// 조건검색시 사용할 필드
	private String search = "";
	private String keyword = "";

	// 검색
	private String week1_buy;
	private String week2_buy;
	private String month1_buy;

	

	public String getWeek1_buy() {
		return week1_buy;
	}

	public void setWeek1_buy(String week1_buy) {
		this.week1_buy = week1_buy;
	}

	public String getWeek2_buy() {
		return week2_buy;
	}

	public void setWeek2_buy(String week2_buy) {
		this.week2_buy = week2_buy;
	}

	public String getMonth1_buy() {
		return month1_buy;
	}

	public void setMonth1_buy(String month1_buy) {
		this.month1_buy = month1_buy;
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

	public int getBuy_number() {
		return buy_number;
	}

	public void setBuy_number(int buy_number) {
		this.buy_number = buy_number;
	}

	public Date getBuy_day() {
		return buy_day;
	}

	public void setBuy_day(Date buy_day) {
		this.buy_day = buy_day;
	}

	public String getBuy_address() {
		return buy_address;
	}

	public void setBuy_address(String buy_address) {
		this.buy_address = buy_address;
	}

	public String getBuy_product() {
		return buy_product;
	}

	public void setBuy_product(String buy_product) {
		this.buy_product = buy_product;
	}

	public int getBuy_quantity() {
		return buy_quantity;
	}

	public void setBuy_quantity(int buy_quantity) {
		this.buy_quantity = buy_quantity;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}

	public String getBuy_status() {
		return buy_status;
	}

	public void setBuy_status(String buy_status) {
		this.buy_status = buy_status;
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

	public int getGroup_number() {
		return group_number;
	}

	public void setGroup_number(int group_number) {
		this.group_number = group_number;
	}

	public String getBuy_image() {
		return buy_image;
	}

	public void setBuy_image(String buy_image) {
		this.buy_image = buy_image;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_cell() {
		return user_cell;
	}

	public void setUser_cell(String user_cell) {
		this.user_cell = user_cell;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCell() {
		return cell;
	}

	public void setCell(String cell) {
		this.cell = cell;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

	public String getBuy_Message() {
		return buy_Message;
	}

	public void setBuy_Message(String buy_Message) {
		this.buy_Message = buy_Message;
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

	@Override
	public String toString() {
		return "BuyVO [buy_number=" + buy_number + ", user_number=" + user_number + ", product_number=" + product_number
				+ ", buy_day=" + buy_day + ", buy_address=" + buy_address + ", buy_product=" + buy_product
				+ ", buy_quantity=" + buy_quantity + ", buy_price=" + buy_price + ", buy_status=" + buy_status
				+ ", group_number=" + group_number + ", buy_image=" + buy_image + ", user_name=" + user_name
				+ ", user_email=" + user_email + ", user_cell=" + user_cell + ", user_phone=" + user_phone + ", name="
				+ name + ", cell=" + cell + ", email=" + email + ", zip_code=" + zip_code + ", user_address="
				+ user_address + ", detail_address=" + detail_address + ", buy_Message=" + buy_Message + ", money="
				+ money + ", total=" + total + ", search=" + search + ", keyword=" + keyword + ", week1_buy="
				+ week1_buy + ", week2_buy=" + week2_buy + ", month1_buy=" + month1_buy + "]";
	}

	

}
