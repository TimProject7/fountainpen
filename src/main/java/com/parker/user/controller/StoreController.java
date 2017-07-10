package com.parker.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class StoreController {
	
	
	@RequestMapping("/store.do")
	public String store(){
		return "/store";
	}
	
}
