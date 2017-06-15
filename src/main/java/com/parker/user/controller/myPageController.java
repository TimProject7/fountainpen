package com.parker.user.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.parker.user.bcrypt.BCrypt;
import com.parker.user.bcrypt.SHA256;
import com.parker.user.service.UserService;
import com.parker.user.vo.UserVO;

@Controller
@RequestMapping(value = "/myPage")
@SessionAttributes(value = "UVO")
public class myPageController {
	Logger logger = Logger.getLogger(myPageController.class);

	@Autowired
	PasswordEncoder passswordEncoder;

	@Autowired
	UserService userService;

	

	// 회원정보변경 비밀번호 확인폼
	@RequestMapping(value = "/userUpdatePassword", method = { RequestMethod.POST, RequestMethod.GET })
	public String userUpdatePassword(HttpSession session, @ModelAttribute UserVO UVO, Model model,
			HttpServletRequest request) {
		logger.info("userUpdatePassword 호출 성공");

		return "/myPage/userUpdatePassword";
	}

	// 회원정보변경 폼
	@RequestMapping(value = "/userUpdateForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String userUpdateForm(HttpSession session, @ModelAttribute UserVO UVO, Model model,
			HttpServletRequest request) {
		logger.info("userUpdatePassword 호출 성공");

		String userid = request.getParameter("user_id");
		String pass = request.getParameter("user_password");
		UVO.setUser_id(userid);
		UVO = userService.passCheck(UVO);

		boolean result = BCrypt.checkpw(pass, UVO.getUser_password());

		System.out.println("result :" + result);
		if (result == false) {
			System.out.println("실패");
		} else if (result == true) {
			session.setAttribute("UVO", UVO);
			System.out.println("성공");
		}

		return "/myPage/userUpdateForm";
	}

	
}
