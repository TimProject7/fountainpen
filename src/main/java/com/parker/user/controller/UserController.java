package com.parker.user.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parker.user.service.UserService;
import com.parker.user.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	BCryptPasswordEncoder passwordEncooder;
	@Autowired
	UserService userService;

	// 글쓰기폼
	@RequestMapping(value = "/userinsertForm", method = RequestMethod.GET)
	public String writeForm(HttpSession session) {
		logger.info("userinsertForm 호출 성공");

		return "user/userinsertForm";
	}

	// 회원가입
	@RequestMapping(value = "/userinsert", method = RequestMethod.POST)
	public String userinsert(@ModelAttribute UserVO UVO, HttpServletRequest request) {
		logger.info("userinsert 호출 성공");
		int result = 0;
		String url = "";

		String pass = request.getParameter("user_password");
		String shapass = passwordEncooder.encode(pass);
		UVO.setUser_password(shapass);
		result = userService.userinsert(UVO);

		return "/user/userinsert";
	}

	@RequestMapping(value = "/useridcheck", method = RequestMethod.POST)
	public String useridcheck(Model model, @ModelAttribute UserVO UVO) {
		logger.info("useridcheck");

		String result = userService.useridchk(UVO);
		System.out.println(UVO.toString());

		logger.info("result = : " + result);

		/*
		 * System.out.println("UVO:" + UVO.toString());
		 * System.out.println("UVO1:" + UVO); model.addAttribute("result", UVO);
		 */
		model.addAttribute("result", result);
		return "/user/useridcheckresult";
	}

	// 로그아웃
	/*
	 * @RequestMapping(value ="/userlogin") public String logout(HttpSession
	 * session) { session.setAttribute("UVO", null); return "user/userlogin"; }
	 */

	// 로그인폼
	@RequestMapping(value = "/userlogin", method = RequestMethod.GET)
	public String userlogin(HttpSession session) {
		logger.info("userlogin 호출 성공");
		session.setAttribute("UVO", null);
		return "user/login";
	}

	// 로그인
	@RequestMapping(value = "/login", method =RequestMethod.POST)
	public String login(@ModelAttribute UserVO UVO, Model model, HttpSession session) {
		logger.info("login 호출 성공");
		String url="";
		int result = 0;
		/*
		 * result = userService.loginselect(UVO);
		 * System.out.println("userService.login(UVO) : " +
		 * userService.loginselect(UVO));
		 */

		UVO = userService.selectList(UVO);
		logger.info("result=" + result);

		model.addAttribute("UVO", UVO);
		if (UVO != null) {
			url = "user/userlogin";
			session.setAttribute("UVO", UVO);
		}else if(UVO ==null){
			session.setAttribute("UVO", null);
			url="../../index";
		}

		return url;

	}
	// 로그아웃폼
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String userlogout(HttpSession session,UserVO UVO) {
			logger.info("userlogin 호출 성공");
			session.setAttribute("UVO", null);
			return "../../index";
		}
}
