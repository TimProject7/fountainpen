package com.parker.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.parker.user.service.CompleteService;
import com.parker.user.vo.BuyVO;
import com.parker.user.vo.CompleteVO;
import com.parker.user.vo.UserVO;

@Controller
@RequestMapping(value = "/buy")
public class ComController {

	Logger logger = Logger.getLogger(CartController.class);

	@Autowired
	private CompleteService completeService;
	
	@RequestMapping(value = "/completeUpdate", method = RequestMethod.POST)
	public String completeUpdate(@ModelAttribute UserVO UVO, HttpSession session, @ModelAttribute BuyVO bvo,
			@RequestParam int[] buy_number, RedirectAttributes redirectAttributes,@ModelAttribute CompleteVO cpvo, Model model) {
		logger.info("completeUpdate 호출성공");
		
		int result = 0;
		
		// 회원번호 불러오기
		UserVO uvo = (UserVO) session.getAttribute("UVO");
		
		for (int i = 0; i < buy_number.length; i++) {
			CompleteVO cpvo1 = new CompleteVO();
			cpvo1.setUser_number(uvo.getUser_number());
			cpvo1.setBuy_number(buy_number[i]);
			result = completeService.completeUpdate(cpvo1);
			
		}
		
		if (result != 0) {
			
			
			logger.info("completeDelete 호출 성공");
			completeService.completeDelete(uvo.getUser_number());
			
			logger.info("completeList 호출 성공");
			cpvo.setUser_number(uvo.getUser_number());
			
			List<CompleteVO> completeList = new ArrayList<CompleteVO>();
			
			for (int i = 0; i < buy_number.length; i++) {
				CompleteVO cpvo1 = new CompleteVO();
				cpvo1.setUser_number(uvo.getUser_number());
				cpvo1.setBuy_number(buy_number[i]);
				
				List<CompleteVO> completeListTemp =completeService.CompleteList(cpvo1);
				completeList.add(completeListTemp.get(0));
			}
			
			model.addAttribute("completeList", completeList);
			
		} 
		return "/buy/complete";

	}
}

