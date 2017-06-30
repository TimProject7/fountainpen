package com.parker.user.controller;

import java.util.ArrayList;
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

import com.parker.user.service.CartService;
import com.parker.user.service.ProductService;
import com.parker.user.vo.BuyVO;
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

	@RequestMapping(value = "/cartDelete", method = RequestMethod.GET)
	public String cartDelete(@ModelAttribute CartVO cvo,
			HttpServletRequest request/*
										 * ,@RequestParam("chk") int[] chk,
										 * ModelMap modelMap
										 */) {
		logger.info("delete 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값 담습니다(1 or 0)
		int result = 0;
		String url = "";

		result = cartService.cartDelete(cvo.getCartlistId());

		// 꼭필요한거라는데 선택삭제할때
		/* String[] chk = request.getParameterValues("chk"); */
		/*
		 * for(int cartlistId:chk){ System.out.println("사용자 삭제 = " +
		 * cartlistId); result = cartService.cartDelete(cartlistId); }
		 * System.out.println("바바바밥" + result);
		 */
		/*
		 * for (String user_id : delete_user_ids) {
		 * System.out.println("사용자 삭제 = " + user_id); int delete_count =
		 * service.deleteUser(user_id);
		 */

		if (result == 1) {
			url = "/cart/cartList.do";
		}

		return "redirect:" + url;

	}

	// 4.상품수량 수정
	@RequestMapping(value = "/cartUpdate", method = RequestMethod.POST)
	public String cartUpdate(@ModelAttribute CartVO cvo, HttpServletRequest request, @ModelAttribute UserVO UVO,
			HttpSession session, @RequestParam int[] cartlistId,/*@RequestParam int[] productId,*/ @RequestParam int[] cartlistQuantity) {
		logger.info("cartUpdate 호출 성공 ");

		int result = 0;
		String url = "";
		/*
		 * List<CartVO> cartList = cartService.cartList(cvo);
		 * 
		 * UserVO uvo1 = (UserVO) session.getAttribute("UVO"); List<BuyVO>
		 * buyList = new ArrayList<BuyVO>(); for (CartVO cart : cartList) {
		 * BuyVO bvo = new BuyVO(); bvo.setUser_number(uvo1.getUser_number());
		 * bvo.setBuy_address(uvo1.getZip_code() + " " + uvo1.getUser_address()
		 * + " " + uvo1.getDetail_address());
		 * bvo.setUser_name(uvo1.getUser_name());
		 * bvo.setUser_email(uvo1.getUser_email());
		 * bvo.setUser_cell(uvo1.getUser_cell());
		 * bvo.setUser_phone(uvo1.getUser_phone());
		 * bvo.setBuy_product(cart.getCartlistName());
		 * bvo.setBuy_price(cart.getCartlistPrice());
		 * bvo.setBuy_quantity(cart.getCartlistQuantity());
		 * bvo.setBuy_image(cart.getCartlistImage());
		 * bvo.setMoney(cart.getMoney());
		 * bvo.setProduct_number(cart.getProductId());
		 * 
		 * buyList.add(bvo); }
		 */
		UserVO uvo = (UserVO) session.getAttribute("UVO");

		for (int i = 0; i < cartlistId.length; i++) {
			/*
			 * CartVO cvo1 = new CartVO(); UserVO uvo = new UserVO();
			 */
			CartVO cvo1 = new CartVO();
			cvo1.setUserId(uvo.getUser_number());
			cvo1.setCartlistId(cartlistId[i]);
			/*cvo1.setProductId(productId[i]);*/
			cvo1.setCartlistQuantity(cartlistQuantity[i]);
		
			result = cartService.cartUpdate(cvo1);
			System.out.println(cvo1.toString());
		}

		if (result >= 1) {
			url = "/cart/cartList.do"; // 수정후 목록으로 이동
		} else {
			System.out.println("핵실패");
		}
		return "redirect:" + url;
	}

	/*
	 * @RequestMapping(value="/update",method=RequestMethod.POST) public String
	 * update(@ModelAttribute CartVO vo) { logger.info("update 호출 성공");
	 * 
	 * int result = 0; String url = "";
	 * 
	 * result = cartService.update(vo);
	 * 
	 * if(result==1){ url="/cart/cartList.do"; //수정후 목록으로 이동 //아래 url은 수정 후 상세
	 * 페이지로 이동. //url="/cart/detail.do?productId="+vo.getProductId(); } return
	 * "redirect:" +url; // session의 id int userId = (int)
	 * session.getAttribute("userId"); // 레코드의 갯수 만큼 반복문 실행 for (int i = 0; i <
	 * productId.length; i++) { CartVO vo = new CartVO(); vo.setUserId(userId);
	 * vo.setCartlistQuantity(cartlistQuantity[i]);
	 * vo.setProductId(productId[i]); cartService.modifyCart(vo); }
	 * 
	 * }
	 */
}