package com.parker.user.controller;

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

		//체크박스로 여러개 삭제하는 기능추가
		/*String[] arrIdx = paramMap.get("idx").toString().split(",");
		for(int i=0; i<arrIdx.length; i++){
			testMapper.delect(Integer.parseInt(arrIdx[i]));
		}
		*/
		model.addAttribute("cartList", cartList);
		model.addAttribute("total", sumMoney);

		return "cart/cartList";

		/*
		 * Map<String, Object> map = new HashMap<String, Object>(); int userId =
		 * (int) session.getAttribute("userId"); // session에 저장된 // user_number
		 * String userId = "4"; List<CartVO> list =
		 * cartService.listCart(userId); // 장바구니 정보 int sumMoney =
		 * cartService.sumMoney(userId); // 장바구니 전체 금액 호출 // 장바구니 전체 긍액에 따라 배송비
		 * 구분 // 배송료(10만원이상 => 무료, 미만 => 2500원) int fee = sumMoney >= 100000 ? 0
		 * : 2500; map.put("list", list); // 장바구니 정보를 map에 저장 map.put("count",
		 * list.size()); // 장바구니 상품의 유무 map.put("sumMoney", sumMoney); // 장바구니
		 * 전체 금액 map.put("fee", fee); // 배송금액 map.put("allSum", sumMoney + fee);
		 * // 주문 상품 전체 금액 mav.setViewName("/cart/cartList"); // view(jsp)의 이름 저장
		 * mav.addObject("map", map); // map 변수 저장 return mav;
		 */
	}
	// 3. 장바구니 삭제

	@RequestMapping(value = "/cartDelete", method = RequestMethod.GET)
	public String cartDelete(@ModelAttribute CartVO cvo) {
		logger.info("delete 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값 담습니다(1 or 0)
		int result = 0;
		String url = "";

		result = cartService.cartDelete(cvo.getCartlistId());

		if (result == 1) {
			url = "/cart/cartList.do";
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