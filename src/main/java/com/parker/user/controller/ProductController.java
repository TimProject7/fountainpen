package com.parker.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parker.user.boardcommon.Paging;
import com.parker.user.boardcommon.Util;
import com.parker.user.service.ProductQnaReplyService;
import com.parker.user.service.ProductReviewReplyService;
import com.parker.user.service.ProductService;
import com.parker.user.vo.BuyVO;
import com.parker.user.vo.ProductQnaReplyVO;
import com.parker.user.vo.ProductReviewReplyVO;
import com.parker.user.vo.ProductVO;
import com.parker.user.vo.UserBoardReplyVO;
import com.parker.user.vo.UserVO;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

	Logger logger = Logger.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductQnaReplyService productQnaReplyService;

	@Autowired
	private ProductReviewReplyService productReviewReplyService;

	/*
	 * @RequestMapping("/list.do") public ModelAndView list(ModelAndView mav) {
	 * mav.setViewName("/productList"); mav.addObject("list",
	 * productService.listProduct()); return mav; }
	 */
	/* 상품 전체목록 */
	@RequestMapping(value = "/productList")
	public String productList(@ModelAttribute ProductVO pvo, Model model) {
		logger.info("productList 호출 성공");

		// 페이지 세팅
		Paging.set(pvo);

		// 전체 레코드 수 구하기
		int total = productService.productListCnt(pvo);
		logger.info("total = " + total);

		int count = total - (Util.nvl(pvo.getPage()) - 1) * Util.nvl(pvo.getPageSize());
		logger.info("count = " + count);

		// 상품 목록
		List<ProductVO> productList = productService.productList(pvo);

		model.addAttribute("productList", productList);
		model.addAttribute("count", count);
		model.addAttribute("data", pvo);
		model.addAttribute("total", total);

		return "product/productList";
	}

	// 상품상세보기
	@RequestMapping(value = "/productDetail", method = RequestMethod.GET)
	public String productDetail(@ModelAttribute ProductVO pvo, Model model) {

		logger.info("producidtDetail 호출 성공");

		logger.info("productId = " + pvo.getProductId());

		ProductVO detail = new ProductVO();
		detail = productService.productDetail(pvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setProductContent(detail.getProductContent().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "product/productDetail";

	}

	// Q&A 댓글목록
	@RequestMapping(value = "/productQnaReply/all/{productId}.do", method = RequestMethod.GET)
	public ResponseEntity<List<ProductQnaReplyVO>> list(@PathVariable("productId") Integer productId) {
		ResponseEntity<List<ProductQnaReplyVO>> entity = null;

		try {
			entity = new ResponseEntity<>(productQnaReplyService.ProductQnaReplyList(productId), HttpStatus.OK);
			System.out.println("Qna entity : " + entity.toString());
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	

	/*
	 * * Q&A 댓글 글쓰기 구현하기
	 * 
	 * @return String 참고 : @RequestBody
	 */

	@RequestMapping(value = "/productQnaReplyInsert")
	public ResponseEntity<String> replyInsert(@RequestBody ProductQnaReplyVO PQRVO, HttpSession session, @RequestBody BuyVO BVO, @RequestBody UserVO UVO) {
		logger.info("replyInsert 호출 성공");
		ResponseEntity<String> entity = null;
		int result;

		UserVO uvo = (UserVO) session.getAttribute("UVO");
		System.out.println("uvo.getUser_number : " + uvo.getUser_number());
		PQRVO.setUser_number(uvo.getUser_number());
		
		
		
		
		

		try {
			result = productQnaReplyService.ProductQnaReplyInsert(PQRVO);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*
	 * * Q&A 댓글 수정 구현하기
	 * 
	 * @return 참고 : REST방식에서 UPDATE 작업은 PUT.PATCH방식을 이용해서 처리 전체 데이터를 수정하는 경우에는
	 * PUT을 이용하고 일부의 데이터를 수정하는 경우에는 PATCH를 이용
	 */

	@RequestMapping(value = "/productQnaReply/{productqna_number}.do", method = { RequestMethod.GET, RequestMethod.PUT,
			RequestMethod.PATCH })
	public ResponseEntity<String> replyUpdate(@PathVariable("productqna_number") Integer productqna_number,
			@RequestBody ProductQnaReplyVO PQRVO) {
		logger.info("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;

		try {
			PQRVO.setProductqna_number(productqna_number);
			productQnaReplyService.ProductQnaReplyUpdate(PQRVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*
	 * * Q&A 댓글 삭제 구현하기
	 * 
	 * @return 참고 :REST방식에서 DELETE 작업은 DELETE방식을 이용해서 처리
	 */

	@RequestMapping(value = "/productQnaReply/{productqna_number}.do", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyDelete(@PathVariable("productqna_number") Integer productqna_number) {
		logger.info("replyDelete 호출 성공");
		ResponseEntity<String> entity = null;

		try {
			productQnaReplyService.ProductQnaReplyDelete(productqna_number);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 후기 댓글목록
	@RequestMapping(value = "/productReviewReply/all/{reviewReply_number}.do", method = RequestMethod.GET)
	public ResponseEntity<List<ProductReviewReplyVO>> list1(
			@PathVariable("reviewReply_number") Integer reviewReply_number) {
		ResponseEntity<List<ProductReviewReplyVO>> entity = null;

		try {
			entity = new ResponseEntity<>(productReviewReplyService.ProductReviewReplyList(reviewReply_number),
					HttpStatus.OK);
			System.out.println("Review entity : " + entity.toString());
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*
	 * * 후기 댓글 글쓰기 구현하기
	 * 
	 * @return String 참고 : @RequestBody
	 */

	@RequestMapping(value = "/productReviewReplyInsert")
	public ResponseEntity<String> replyInsert1(@RequestBody ProductReviewReplyVO PRRVO, HttpSession session) {
		logger.info("replyInsert 호출 성공");
		ResponseEntity<String> entity = null;
		int result;

		UserVO uvo = (UserVO) session.getAttribute("UVO");
		System.out.println("uvo.getUser_number : " + uvo.getUser_number());
		PRRVO.setUser_number(uvo.getUser_number());

		try {
			result = productReviewReplyService.ProductReviewReplyInsert(PRRVO);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*
	 * * 후기 댓글 수정 구현하기
	 * 
	 * @return 참고 : REST방식에서 UPDATE 작업은 PUT.PATCH방식을 이용해서 처리 전체 데이터를 수정하는 경우에는
	 * PUT을 이용하고 일부의 데이터를 수정하는 경우에는 PATCH를 이용
	 */

	@RequestMapping(value = "/productReviewReplyUpdate/{reviewReply_number}.do", method = { RequestMethod.GET,
			RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> replyUpdate1(@PathVariable("reviewReply_number") Integer reviewReply_number,
			@RequestBody ProductReviewReplyVO PRRVO) {
		logger.info("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;

		try {
			PRRVO.setReviewReply_number(reviewReply_number);
			productReviewReplyService.ProductReviewReplyUpdate(PRRVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*
	 * *후기 댓글 삭제 구현하기
	 * 
	 * @return 참고 :REST방식에서 DELETE 작업은 DELETE방식을 이용해서 처리
	 */

	@RequestMapping(value = "/productReviewReplyDelete/{reviewReply_number}.do", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyDelete1(@PathVariable("reviewReply_number") Integer reviewReply_number) {
		logger.info("replyDelete 호출 성공");
		ResponseEntity<String> entity = null;

		try {
			productReviewReplyService.ProductReviewReplyDelete(reviewReply_number);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
