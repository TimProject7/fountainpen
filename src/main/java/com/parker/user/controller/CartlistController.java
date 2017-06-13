package com.parker.user.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.parker.user.vo.CartlistVO;

@Controller
@RequestMapping("/")
@SessionAttributes({"cart"})
public class CartlistController {
	
	/**
	 * 세션에 cart가 없을 경우 생성한다.
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String getCart(Model model) {
		if (!model.containsAttribute("cart")) {
			model.addAttribute("cart", new ArrayList<CartlistVO>());
		}
		return "cartList";
	}
	
	/**
	 * 세션에 저장되 있는 cart에 상품을 추가
	 * @param goods
	 * @param cart
	 * @return
	 */
	@RequestMapping(value="add", method = RequestMethod.POST)
	public String add(@ModelAttribute CartlistVO goods,
			          @ModelAttribute("cart") List<CartlistVO> cart) {
		cart.add(goods);
		return "redirect:/";
	}
	
	
}
