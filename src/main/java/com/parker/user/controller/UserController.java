package com.parker.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	public String userlogin(HttpSession session, @ModelAttribute UserVO UVO) {
		logger.info("userlogin 호출 성공");
		return "user/userlogin";
	}

	// 로그인
	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public
	 * String login(@ModelAttribute UserVO UVO, Model model, HttpSession
	 * session, HttpServletRequest request) { logger.info("login 호출 성공"); String
	 * url = ""; int result = 0;
	 * 
	 * String userid = request.getParameter("user_id"); String userpass =
	 * request.getParameter("user_pass"); System.out.println("받아온 userid" +
	 * userid); UVO = userService.selectList(UVO); System.out.println("UVO아이디" +
	 * UVO.getUser_id()); logger.info("result=" + result);
	 * 
	 * if (UVO.getUser_id().equals(userid)) { session.setAttribute("UVO",
	 * UVO.getUser_id()); model.addAttribute("UVO",UVO.getUser_id()); url =
	 * "user/login"; } else { session.invalidate(); url = "user/login"; } return
	 * url;
	 * 
	 * }
	 */

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginProcess(@ModelAttribute UserVO UVO, HttpSession session, HttpServletRequest request) {
		logger.info("loginProcess 호출 성공");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:userlogin.do");

		
		String userid = request.getParameter("user_id");
		String pass = request.getParameter("user_password");
		String shapass = passwordEncooder.encode(pass);
		
		UserVO loginUser = userService.sessionLogin(UVO);
		
		/*System.out.println(" 컨트롤러 UVO.toString() : " +UVO.toString());
		System.out.println(" 컨트롤러 UVO.toString() : " +userid);
		System.out.println(" 컨트롤러 UVO.toString() : " +UVO.getUser_password());
		System.out.println(" 컨트롤러 UVO.toString() : " +shapass);
		*/
		//비밀번호도 비교해야됨
		if (UVO.getUser_id().equals(userid)) {
			
			session.setAttribute("UVO", UVO);
		}else if(!UVO.getUser_id().equals(userid)) {
			
		}

		return mav;

	}

	// 로그아웃폼
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String userlogout(HttpSession session) {
		logger.info("userlogin 호출 성공");
		session.invalidate();
		return "redirect:userlogin.do";
	}
	
	@RequestMapping(value = "/page1", method = RequestMethod.GET)
	public String page(HttpSession session, @ModelAttribute UserVO UVO) {
		logger.info("userpage1 호출 성공");
		return "user/page1";
	}
}
