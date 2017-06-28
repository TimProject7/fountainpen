package com.parker.user.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parker.user.boardcommon.Paging;
import com.parker.user.boardcommon.Util;
import com.parker.user.service.ProductService;
import com.parker.user.vo.ProductVO;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

	Logger logger = Logger.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

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

	/* 상품 상세보기 */
	/*
	 * @RequestMapping("/detail/{productId}") public ModelAndView
	 * detail(@PathVariable("productId") int productId, ModelAndView mav){
	 * mav.setViewName("/productDetail"); mav.addObject("vo",
	 * productService.detailProduct(productId)); return mav; }
	 */
}
