package com.parker.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.parker.user.service.BuyService;
import com.parker.user.service.CartService;
import com.parker.user.service.ProductService;
import com.parker.user.vo.BuyVO;
import com.parker.user.vo.CartVO;
import com.parker.user.vo.UserVO;

@Controller
@RequestMapping(value = "/buy")
public class BuyController {

	Logger logger = Logger.getLogger(CartController.class);

	@Autowired
	private BuyService buyService;

	@Autowired
	private ProductService productService;

	@Autowired
	private CartService cartService;

	// 주문/결제 추가

	@RequestMapping(value = "/buyInsert", method = { RequestMethod.POST, RequestMethod.GET })
	public String buyInsert(@ModelAttribute CartVO cvo, @ModelAttribute UserVO UVO, HttpServletRequest request,
			Model model, HttpSession session) {

		int result = 0;

		List<CartVO> cartList = cartService.cartList(cvo);

		UserVO uvo = (UserVO) session.getAttribute("UVO");
		List<BuyVO> buyList = new ArrayList<BuyVO>();

		for (CartVO cart : cartList) {
			BuyVO bvo = new BuyVO();
			bvo.setUser_number(uvo.getUser_number());
			bvo.setBuy_address(uvo.getZip_code() + " " + uvo.getUser_address() + " " + uvo.getDetail_address());
			bvo.setUser_name(uvo.getUser_name());
			bvo.setUser_email(uvo.getUser_email());
			bvo.setUser_cell(uvo.getUser_cell());
			bvo.setUser_phone(uvo.getUser_phone());
			bvo.setBuy_product(cart.getCartlistName());
			bvo.setBuy_price(cart.getCartlistPrice());
			bvo.setBuy_quantity(cart.getCartlistQuantity());
			bvo.setBuy_image(cart.getCartlistImage());
			bvo.setMoney(cart.getMoney());
			bvo.setProduct_number(cart.getProductId());

			buyList.add(bvo);
		}

		for (BuyVO buyVO : buyList) {

			result = buyService.buyInsert(buyVO);

		}

		return "redirect:/buy/buyList.do";
	}

	// 주문/결제 목록 & 입력
	@RequestMapping(value = "/buyList", method = RequestMethod.GET)
	public String buyList(@ModelAttribute BuyVO bvo, Model model, @ModelAttribute UserVO UVO, HttpSession session) {

		logger.info("buyList 호출 성공");

		UserVO uvo = (UserVO) session.getAttribute("UVO");
		
		bvo.setUser_number(uvo.getUser_number()); 
		bvo.setUser_name(uvo.getUser_name());
		bvo.setUser_cell(uvo.getUser_cell());
		bvo.setUser_phone(uvo.getUser_phone());
		bvo.setUser_email(uvo.getUser_email());
		bvo.setUser_address(uvo.getZip_code() + " " + uvo.getUser_address() + " " + uvo.getDetail_address()); 

		List<BuyVO> buyList = buyService.buyList(bvo);
		int sumMoney = cartService.sumMoney(bvo.getUser_number());
		
		
		
		
		model.addAttribute("total", sumMoney);
		
		model.addAttribute("buyList", buyList);

		return "/buy/buyList";
	}

}
