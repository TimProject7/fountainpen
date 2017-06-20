package com.parker.user.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.parsing.GenericTokenParser;
import org.apache.log4j.Logger;
import org.jsoup.Connection.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.parker.user.bcrypt.BCrypt;
import com.parker.user.bcrypt.SHA256;
import com.parker.user.boardcommon.Paging;
import com.parker.user.boardcommon.Util;
import com.parker.user.service.QuestionService;
import com.parker.user.service.UserService;
import com.parker.user.vo.QuestionVO;
import com.parker.user.vo.UserVO;

//마이페이지 컨트롤러
@Controller
@RequestMapping(value = "/myPage")
public class myPageController {
	Logger logger = Logger.getLogger(myPageController.class);

	@Autowired
	PasswordEncoder passswordEncoder;

	// 로그인,회원가입 서비스
	@Autowired
	UserService userService;

	// 1:1문의 게시판 서비스
	@Autowired
	QuestionService questionService;

	// 마이페이지 진입 전 비밀번호 입력폼
	@RequestMapping(value = "/myPagePasswordForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String myPageUpdatePassword(HttpSession session, @ModelAttribute UserVO UVO, Model model,
			HttpServletRequest request) {
		logger.info("myPagePasswordForm 호출 성공");

		return "/myPage/myPagePasswordForm";
	}

	// 마이페이지 진입전 패스워드 처리
	@RequestMapping(value = "/myPageForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String userUpdateForm1(HttpSession session, @ModelAttribute UserVO UVO, Model model,
			HttpServletRequest request) {
		logger.info("myPageForm 호출 성공");
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

		return "/myPage/myPageForm";
	}

	// 마이페이지 회원정보변경 폼
	@RequestMapping(value = "/userUpdateForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String userUpdateForm(HttpSession session, @ModelAttribute UserVO UVO, Model model,
			HttpServletRequest request) {
		logger.info("userUpdateForm 호출 성공");
		
		//회원번호
		String usernumber = request.getParameter("user_number");
		//비밀번호
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

	// 마이페이지 회원정보 수정 완료
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public String userUpdateclear(@ModelAttribute UserVO UVO, HttpServletRequest request, HttpSession session) {
		logger.info("userUpdate 호출 성공");
		int result = 0;

		String usernumber = request.getParameter("user_number");
		String pass = request.getParameter("user_password");

		int usernumber1 = Integer.parseInt(usernumber);

		UVO.setUser_number(usernumber1);
		UVO = userService.passCheck(UVO);

		boolean bool = BCrypt.checkpw(pass, UVO.getUser_password());

		if (bool == false) {
			System.out.println("실패");
		} else if (bool == true) {
			session.setAttribute("UVO", UVO);
			System.out.println("성공");
			result = userService.userUpdate(UVO);
			System.out.println("result :" + result);
		} else if (result == 0) {
			System.out.println("실패");
		} else if (result == 1) {
			System.out.println("성공");
		}

		return "redirect:/";
	}

	// 마이페이지 회원탈퇴 폼 비밀번호 확인
	@RequestMapping(value = "/userDelete", method = { RequestMethod.POST, RequestMethod.GET })
	public String myPageUserUpdateDelete(HttpSession session, @ModelAttribute UserVO UVO, Model model,
			HttpServletRequest request) {
		logger.info("userDelete 호출 성공");

		int result = 0;

		String usernumber = request.getParameter("user_number");
		String pass = request.getParameter("user_password");

		int usernumber1 = Integer.parseInt(usernumber);

		UVO.setUser_number(usernumber1);
		UVO = userService.passCheck(UVO);

		boolean bool = BCrypt.checkpw(pass, UVO.getUser_password());

		if (bool == false) {
			System.out.println("실패");
		} else if (bool == true) {
			session.setAttribute("UVO", UVO);
			System.out.println("성공");

			result = userService.userUpdateDelete(UVO);
			System.out.println("result :" + result);
		} else if (result == 0) {
			System.out.println("실패");
		} else if (result == 1) {
			System.out.println("성공");

			session.invalidate();
		}
		return "redirect:/";
	}

	// 마이페이지 1:1문의 게시판 리스트 폼
	@RequestMapping(value = "/question/question", method =  RequestMethod.GET )
	public String question(HttpSession session, @ModelAttribute UserVO UVO, Model model, HttpServletRequest request,
			@ModelAttribute QuestionVO QVO) {
		logger.info("question 호출 성공");
		
		Paging.set(QVO);
		System.out.println("QVO.getPage() : " + QVO.getPage());
		
		//전체레코드건수
		int total = questionService.questionListCnt(QVO);
		
		System.out.println("total:"+total);
		
		//글번호 재설정
				int count = total - (Util.nvl(QVO.getPage())-1) * Util.nvl(QVO.getPageSize());
				logger.info("count = " + count);
		
		//전체리스트
		List<QuestionVO> questionList = questionService.questionList(QVO);
		
		model.addAttribute("count", count);
		model.addAttribute("questionList", questionList);
		model.addAttribute("data",QVO);
		model.addAttribute("total",total);

		/* QVO = questionService.questionUser(QVO); */

		return "/myPage/question/question";
	}

	// 마이페이지 1:1문의 게시판 글쓰기폼
	@RequestMapping(value = "/question/writer", method = { RequestMethod.POST, RequestMethod.GET })
	public String questionwrite(HttpSession session, @ModelAttribute UserVO UVO, Model model,
			HttpServletRequest request, @ModelAttribute QuestionVO QVO) {
		logger.info("question 호출 성공");

		return "/myPage/question/writer";
	}

	// 마이페이지 1:1문의 게시판 글작성액션
	@RequestMapping(value = "/question/questionInsert", method = { RequestMethod.POST, RequestMethod.GET })
	public String questionInsert(HttpSession session, @ModelAttribute UserVO UVO, Model model,
			HttpServletRequest request, @ModelAttribute QuestionVO QVO) {
		logger.info("question 호출 성공");

		int result = questionService.questionInsert(QVO);
		System.out.println("result :" + result);
		if (result == 1) {
			System.out.println("성공");

			session.setAttribute("UVO", UVO);
		} else {
			System.out.println("실패");
		}

		return "redirect:/myPage/question/question.do";
	}

	// 상세페이지
	@RequestMapping(value = "/question/Detail", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView myPageDetail(HttpServletRequest Request, @RequestParam int question_number,
			@ModelAttribute QuestionVO QVO, ModelAndView mav, Model model) {
		logger.info("Detail 호출 성공");
		
		
		
		
		mav.addObject("questionDetail", questionService.questionDetail(question_number));
		mav.setViewName("myPage/question/Detail");
		
		return mav;
	}
	
	@RequestMapping(value="/question/DetailUpdate", method={RequestMethod.POST, RequestMethod.GET})
	public String myPageDetailUpdate(HttpServletRequest Request, @ModelAttribute QuestionVO QVO,Model model){
			
		//수정
		int result = questionService.questionUpdate(QVO);
		
		
		//전체리스트
				List<QuestionVO> questionList = questionService.questionList(QVO);
		if(result==1){
			System.out.println("성공");
			model.addAttribute("questionList", questionList);
			return "myPage/question/question";
		}else{
			System.out.println("실패");
			return "myPage/question/question";

		}
		
	}
	

	// 마이페이지 장바구니
	@RequestMapping(value = "/cartList/cartList", method = { RequestMethod.POST, RequestMethod.GET })
	public String cartList(HttpSession session, @ModelAttribute UserVO UVO, Model model, HttpServletRequest request) {
		logger.info("cartList 호출 성공");
		return "/myPage/cartList/cartList";
	}

	// 마이페이지 구매내역
	@RequestMapping(value = "/buyList/buyList", method = { RequestMethod.POST, RequestMethod.GET })
	public String buyList(HttpSession session, @ModelAttribute UserVO UVO, Model model, HttpServletRequest request) {
		logger.info("buyList 호출 성공");
		return "/myPage/buyList/buyList";
	}

	// 마이페이지 배송정보
	@RequestMapping(value = "/shippingInfo/shippingInfo", method = { RequestMethod.POST, RequestMethod.GET })
	public String shippingInfo(HttpSession session, @ModelAttribute UserVO UVO, Model model,
			HttpServletRequest request) {
		logger.info("shippingInfo 호출 성공");
		return "/myPage/shippingInfo/shippingInfo";
	}

}
