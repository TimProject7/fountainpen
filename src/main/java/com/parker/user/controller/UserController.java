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
@RequestMapping(value = "/user")
public class UserController {
	Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	PasswordEncoder passswordEncoder;

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

		/*
		 * String pass = request.getParameter("user_password"); String shapass =
		 * passwordEncooder.encode(pass); UVO.setUser_password(shapass);
		 */
		result = userService.userinsert(UVO);

		return "redirect:/";
	}
	// 회원정보 수정 완료
		@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
		public String userUpdate(@ModelAttribute UserVO UVO, HttpServletRequest request) {
			logger.info("userinsert 호출 성공");
			int result = 0;
			String url = "";

		
			result = userService.userUpdate(UVO);
			if(result ==0){
				System.out.println("실패");
			}else{
				System.out.println("성공");
			}

			return "redirect:/";
		}

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
		String usernumber = request.getParameter("user_number");
		String userid = request.getParameter("user_id");
		String pass = request.getParameter("user_password");
		
		int usernumber1 = Integer.parseInt(usernumber);
		
		UVO.setUser_number(usernumber1);
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

	// 중복체크
	@RequestMapping(value = "/useridcheck", method = RequestMethod.POST)
	public String useridcheck(Model model, @ModelAttribute UserVO UVO) {
		logger.info("useridcheck");

		String result = userService.useridchk(UVO);
		System.out.println(UVO.toString());

		logger.info("result = : " + result);

		model.addAttribute("result", result);
		return "/user/useridcheckresult";
	}

	// 로그인폼
	@RequestMapping(value = "/userlogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String userlogin(HttpSession session, @ModelAttribute UserVO UVO) {
		logger.info("userlogin 호출 성공");
		session.invalidate();
		return "user/userlogin";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginProcess(@ModelAttribute UserVO UVO, HttpSession session, HttpServletRequest request) {
		logger.info("login 호출 성공");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");

		String userid = request.getParameter("user_id");
		String pass = request.getParameter("user_password");

		try {
			UVO.setUser_id(userid);
			UVO = userService.sessionLogin(UVO);

			boolean result = BCrypt.checkpw(pass, UVO.getUser_password());

			System.out.println("result:" + result);
			// 비밀번호도 비교해야됨

			if (result == true) {
				session.setAttribute("UVO", UVO);
				
				System.out.println("성공");
			} else if (result == false) {
				System.out.println("실패");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mav;
	}

	// 로그아웃폼
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String userlogout(HttpSession session) {
		logger.info("logout 호출 성공");
		//session.setAttribute("UVO", null);
		session.invalidate();

		return "redirect:/";
	}

	// 아이디찾기
	@RequestMapping(value = "/idFind", method = RequestMethod.GET)
	public String idFind() {
		logger.info("idFind 호출 성공");

		return "user/idFind";
	}

	// 아이디찾기
	@RequestMapping(value = "/idFindchk", method = RequestMethod.POST)
	public String idFindchk(Model model, @ModelAttribute UserVO UVO, HttpServletRequest request) {
		logger.info("idFindchk 호출 성공");

		String username = request.getParameter("user_name");
		String useremail = request.getParameter("user_email");
		System.out.println("username : " + username);
		System.out.println("useremail : " + useremail);
		UVO.setUser_name(username);
		UVO.setUser_email(useremail);

		UVO = userService.idFind(UVO);

		System.out.println("UVO.toString() : " + UVO.toString());

		System.out.println("UVO.getUser_id() : " + UVO.getUser_id());
		System.out.println("UVO.getUser_password() : " + UVO.getUser_email());

		String userid = UVO.getUser_id();

		if (userid != null) {
			model.addAttribute("userid", userid);
		}

		return "user/idFindsending";
	}

	// 비밀번호찾기
	@RequestMapping(value = "/passFind", method = RequestMethod.GET)
	public String passFind() {
		logger.info("passFind 호출 성공");

		return "user/passFind";
	}

	// 비밀번호찾기
	@RequestMapping(value = "/passFindCheck", method = RequestMethod.POST)
	public String passFindget(Model model, @ModelAttribute UserVO UVO, HttpServletRequest request,
			HttpSession session) {
		logger.info("passFindCheck 호출 성공");

		String username = request.getParameter("user_name");
		String userid = request.getParameter("user_id");
		String useremail = request.getParameter("user_email");
		System.out.println("username : " + username);
		System.out.println("userid : " + userid);
		System.out.println("useremail : " + useremail);
		UVO.setUser_name(username);
		UVO.setUser_id(userid);
		UVO.setUser_email(useremail);

		UVO = userService.passEmailFind(UVO);
		/*
		 * System.out.println("UVO.toString() : " +UVO.toString());
		 * System.out.println("비번찾기 UVO.getUser_password() : "
		 * +UVO.getUser_password());
		 */

		if (!UVO.getUser_password().equals("")) {
			System.out.println("성공");
			session.setAttribute("userid", userid);
		}

		return "user/passFindCheck";
	}

	// 비밀번호변경
	@RequestMapping(value = "/passFindChange", method = RequestMethod.POST)
	public String passFindchange(Model model, @ModelAttribute UserVO UVO, HttpServletRequest request) {
		logger.info("passFindChange 호출 성공");
		int result = 0;
		String userpass = request.getParameter("user_password");
		String userid = request.getParameter("user_id");

		/*
		 * String userid =UVO.getUser_id(); UVO.setUser_id(userid);
		 */
		UVO.setUser_password(userpass);
		UVO.setUser_id(userid);

		result = userService.passFindChange(UVO);

		if (result == 1) {
			System.out.println("비밀번호 변경 성공 rsult :" + result);
		}

		return "user/userlogin";
	}
}
