package com.parker.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.parker.user.boardcommon.Paging;
import com.parker.user.boardcommon.Util;
import com.parker.user.service.ProductQnaService;
import com.parker.user.service.ProductReviewReplyService;
import com.parker.user.service.ProductService;
import com.parker.user.vo.ProductQnaVO;
import com.parker.user.vo.ProductReviewReplyVO;
import com.parker.user.vo.ProductVO;
import com.parker.user.vo.UserBoardVO;
import com.parker.user.vo.UserVO;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

	Logger logger = Logger.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductQnaService productQnaService;

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
	public String productDetail(@ModelAttribute ProductVO pvo, Model model, @ModelAttribute ProductQnaVO PQVO) {

		logger.info("producidtDetail 호출 성공");

		logger.info("productId = " + pvo.getProductId());

		ProductVO detail = new ProductVO();
		detail = productService.productDetail(pvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setProductContent(detail.getProductContent().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		// 페이징
		Paging.set(PQVO);

		System.out.println("PVO.getProductId() : " + pvo.getProductId());

		// 리스트 건수
		int total = productQnaService.productQnaListCnt(PQVO);

		// 글번호 재설정
		int count = total - (Util.nvl(PQVO.getPage()) - 1) * Util.nvl(PQVO.getPageSize());
		logger.info("total = " + total);
		logger.info("count = " + count);

		// 전체데이터가져오는 리스트!
		List<ProductQnaVO> ProductQnaList = productQnaService.productQnaList(PQVO);

		System.out.println("ProductQnaList : " + ProductQnaList);

		model.addAttribute("count", count);
		model.addAttribute("ProductQnaList", ProductQnaList);
		model.addAttribute("data", PQVO);
		model.addAttribute("total", total);

		return "product/productDetail";

	}

	// 상품Q&A 글쓰기 폼으로 이동
	@RequestMapping(value = "/productQnaWriterForm", method = RequestMethod.POST)
	public String userBoardWriter(@ModelAttribute UserBoardVO UBVO, Model model, @ModelAttribute ProductVO pvo) {

		logger.info("productQnaWriterForm 호출 성공");
		int productId = pvo.getProductId();
		System.out.println("productId : " + productId);
		model.addAttribute("productId", productId);

		return "product/productQnaWriterForm";

	}

	// 상품Qna 글쓰기
	@RequestMapping(value = "/productQnaInsert", method = { RequestMethod.POST, RequestMethod.GET })
	public String userBoardWriterAction(@ModelAttribute ProductQnaVO PQVO, Model model, HttpServletRequest request,
			HttpSession session, @ModelAttribute UserVO UVO, @ModelAttribute ProductVO pvo, RedirectAttributes red) {
		logger.info("userBoardInsert 호출 성공");

		// 세션가져와서 넣어준당
		UserVO uvo = (UserVO) session.getAttribute("UVO");
		System.out.println("uvo.getUser_number() : " + uvo.getUser_number());
		PQVO.setUser_number(uvo.getUser_number());

		String productId = request.getParameter("productId");
		int productId1 = Integer.parseInt(productId);
		PQVO.setProductId(productId1);

		int result = productQnaService.productQnaInsert(PQVO);
		System.out.println("PQVO.toString() : " + PQVO.toString());

		System.out.println("result : " + result);
		red.addAttribute("productId", productId);

		return "redirect:/product/productList.do";
	}

	// 상품Qna 상세페이지
	@RequestMapping(value = "/productQnaDetail", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productQnaDetail(@ModelAttribute ProductQnaVO PQVO, @RequestParam int productQna_number,
			HttpSession session, ModelAndView mav, Model model, HttpServletRequest request,
			@ModelAttribute ProductVO pvo) {
		logger.info("productQnaDetail 호출 성공");

		// 게시글 조회수 증가
		productQnaService.productQnaViewCnt(productQna_number, session);
		//세션아디 불러온다
		UserVO uvo = (UserVO) session.getAttribute("UVO");
		String userid = uvo.getUser_id();
		System.out.println("userid:" + userid);
		int productId = PQVO.getProductId();
		System.out.println("productId : " + productId);

		// 상세페이지 이동
		mav.addObject("productQnaDetail", productQnaService.productQnaDetail(productQna_number));
		// mav.addObject("username",username);
		model.addAttribute("userid", userid);
		model.addAttribute("productId", productId);
		mav.setViewName("product/productQnaDetail");
		return mav;
	}

	// 상품Qna게시판 수정 액션
	@RequestMapping(value = "/productQnaDetailUpdate", method = { RequestMethod.POST, RequestMethod.GET })
	public String productQnaDetailUpdate(@ModelAttribute ProductQnaVO PQVO, HttpSession session,
			@ModelAttribute UserVO UVO, Model model, @RequestParam int productQna_number, @ModelAttribute ProductVO pvo,
			RedirectAttributes red) {
		logger.info("productQnaDetailUpdate 호출 성공");
		int url = 0;
		System.out.println("productQna_number" + productQna_number);
		System.out.println("pvo.getProductId() : " + pvo.getProductId());
		PQVO.setProductQna_number(productQna_number);
		PQVO.setProductId(pvo.getProductId());
		int productId = pvo.getProductId();
		// 정보수정
		int result = productQnaService.productQnaDetailUpdate(PQVO);
		System.out.println("PQVO : " + PQVO);
		System.out.println("result : " + result);
		// 세션가져와서 넣어준당
		red.addAttribute("productId", productId);

		if (result == 1) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}

		return "redirect:/product/productDetail.do";
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
			// 구매를했는지 확인
			int buychk = productReviewReplyService.ProductBuyChk(PRRVO);
			if (buychk != 0) {

				result = productReviewReplyService.ProductReviewReplyInsert(PRRVO);
				// 댓글성공
				if (result == 1) {
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				}
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
