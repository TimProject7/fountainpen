package com.parker.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parker.user.service.BuyService;
import com.parker.user.vo.BuyVO;
import com.parker.user.vo.UserVO;

@Controller
@RequestMapping(value = "/buy")
public class ComController {
	
	Logger logger = Logger.getLogger(CartController.class);

	@Autowired
	private BuyService buyService;

	
	// 주문/결제 목록 & 입력
		@RequestMapping(value = "/completeList", method = RequestMethod.GET)
		public String buyList(@ModelAttribute BuyVO bvo, Model model, @ModelAttribute UserVO UVO, HttpSession session) {

			logger.info("buyList 호출 성공");

			UserVO uvo = (UserVO) session.getAttribute("UVO");
			
			bvo.setUser_number(bvo.getUser_number());
			bvo.setBuy_number(bvo.getBuy_number());
			bvo.setBuy_image(bvo.getBuy_image());
			bvo.setBuy_product(bvo.getBuy_product());
			bvo.setBuy_price(bvo.getBuy_price());
			bvo.setBuy_quantity(bvo.getBuy_quantity());
			bvo.setBuy_day(bvo.getBuy_day());
			bvo.setBuy_status(bvo.getBuy_status());
			
			List<BuyVO> completeList = buyService.buyList(bvo);
			
			model.addAttribute("completeList", completeList);

			return "redirect:buy/complete.do";
		}

	
}
