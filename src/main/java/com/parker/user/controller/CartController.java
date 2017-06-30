package com.parker.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.parker.user.service.CartService;
import com.parker.user.service.ProductService;
import com.parker.user.vo.CartVO;
import com.parker.user.vo.ProductVO;
import com.parker.user.vo.UserVO;

@Controller
@RequestMapping(value = "/cart")
public class CartController {

	Logger logger = Logger.getLogger(CartController.class);

	@Autowired
	private CartService cartService;

	@Autowired
	private ProductService productService;

	// 장바구니 추가
	@RequestMapping(value = "/cartInsert", method = { RequestMethod.GET, RequestMethod.POST })
	public String cartInsert(@RequestParam String cartlistQuantity, @ModelAttribute CartVO cvo,
			@ModelAttribute ProductVO pvo, Model model, HttpSession session, @ModelAttribute UserVO UVO,
			HttpServletRequest request) {

		logger.info("cartInsert 호출성공");

		int result = 0;

		pvo = productService.productDetail(pvo);

		int productnumber = pvo.getProductId();
		String productname = pvo.getProductName();
		String productcompany = pvo.getProductCompany();
		String productorigin = pvo.getProductOrigin();
		String productimage = pvo.getProductImage();
		int productprice = pvo.getProductPrice();

		UserVO uvo = (UserVO) session.getAttribute("UVO");
		cvo.setUserId(uvo.getUser_number());

		cvo.setCartlistName(productname);
		cvo.setProductId(productnumber);
		cvo.setCartlistCompany(productcompany);
		cvo.setCartlistOrigin(productorigin);
		cvo.setCartlistImage(productimage);
		cvo.setCartlistPrice(productprice);

		result = cartService.cartInsert(cvo);

		if (result == 1) {
			System.out.println("장바구니 추가 성공 : " + result);
		} else {
			System.out.println("장바구니 추가 실패");
		}

		return "redirect:/cart/cartList.do";
	}

	// 장바구니 목록
	@RequestMapping(value = "/cartList", method = { RequestMethod.GET, RequestMethod.POST })
	public String cartList(@ModelAttribute CartVO cvo, Model model, HttpServletRequest request,
			@ModelAttribute UserVO UVO, HttpSession session) {

		logger.info("cartList 호출 성공");

		logger.info("productId = " + cvo.getProductId());

		logger.info("userId = " + session.getAttribute("UVO"));

		UserVO uvo = (UserVO) session.getAttribute("UVO");
		cvo.setUserId(uvo.getUser_number());

		List<CartVO> cartList = cartService.cartList(cvo);

		int sumMoney = cartService.sumMoney(cvo.getUserId());

		model.addAttribute("cartList", cartList);
		model.addAttribute("total", sumMoney);

		return "cart/cartList";

	}
	// 3. 장바구니 삭제

	// 하나 삭제
	@RequestMapping(value = "/cartDelete", method = RequestMethod.GET)
	public String cartDeleteGET(int cartlistId) {
		logger.info("delete 호출 성공");

		cartService.cartDelete(cartlistId);
	
		return "redirect:/cart/cartList.do";
	}
	
	// 여러개 삭제
	@RequestMapping(value = "/cartDelete", method = RequestMethod.POST)
	public String cartDeletePOST(@RequestParam("chk") int[] cartlistId) {
		logger.info("delete 호출 성공");

		for(int cartlistIdx : cartlistId){
			System.out.println("삭제 = " + cartlistIdx);
			cartService.cartDelete(cartlistIdx);
		}
	
		return "redirect:/cart/cartList.do";
	}



	// 4.상품수량 수정
	@RequestMapping(value = "/cartUpdate", method = RequestMethod.POST)
	public String cartUpdate(@ModelAttribute CartVO cvo, HttpServletRequest request, @ModelAttribute UserVO UVO,
			HttpSession session, @RequestParam int[] cartlistId, @RequestParam int[] cartlistQuantity) {
		logger.info("cartUpdate 호출 성공 ");

		int result = 0;
		String url = "";

		UserVO uvo = (UserVO) session.getAttribute("UVO");

		for (int i = 0; i < cartlistId.length; i++) {
			CartVO cvo1 = new CartVO();
			cvo1.setUserId(uvo.getUser_number());
			cvo1.setCartlistId(cartlistId[i]);
			cvo1.setCartlistQuantity(cartlistQuantity[i]);

			result = cartService.cartUpdate(cvo1);
		}

		if (result >= 1) {
			url = "/cart/cartList.do"; // 수정후 목록으로 이동
		} else {
			System.out.println("실패");
		}
		return "redirect:" + url;
	}

}