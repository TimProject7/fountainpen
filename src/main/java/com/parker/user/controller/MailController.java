package com.parker.user.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parker.user.service.UserService;
/*import com.parker.user.service.UserService;*/
import com.parker.user.vo.UserVO;

@Controller
@RequestMapping(value = "/mail")
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private UserService userService;

	// mailSending 코드
	@RequestMapping(value = "/mailForm", method = RequestMethod.POST)
	public String mailSending(HttpServletRequest request, Model model, @ModelAttribute UserVO UVO) {
		/*
		 * Random random = new Random(); int[] key = new int[6];
		 * 
		 * for (int i = 0; i < key.length; i++) { key[i] = random.nextInt(10)+1;
		 * System.out.println("key[i] :"+key[i]); }
		 */
		// 인증키 랜덤함수 생성
		int ran = new Random().nextInt(100000) + 10000; // 10000~99999
		String joincode = String.valueOf(ran);

		String setfrom = "vpzj1234@gmail.com"; // 보내는 사람메일
		String user_email = request.getParameter("user_email"); // 받는 사람 이메일
		String title = "parker이메일 인증키입니다"; // 제목
		String content = joincode; // 인증키

		int emailChk = userService.emailChk(UVO);
		//UserVO passemailChk = userService.passEmailFind(UVO);
		
		if (emailChk == 0  ) {
			try {

				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(user_email); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				// 내용
				model.addAttribute("content", content);

				System.out.println(" user_email : " + user_email);
				// 받는사람메일
				model.addAttribute("user_email", user_email);
				System.out.println(" content : " + content);

				mailSender.send(message);

			} catch (Exception e) {
				System.out.println(e);

			}
			return "mail/mailsending";
		} else {
			model.addAttribute("content", emailChk);
			return "mail/mailsending";
		}
	}

	// mailSending 코드
	@RequestMapping(value = "/passchkmail", method = RequestMethod.POST)
	public String mailSending1(HttpServletRequest request, Model model, @ModelAttribute UserVO UVO) {
		/*
		 * Random random = new Random(); int[] key = new int[6];
		 * 
		 * for (int i = 0; i < key.length; i++) { key[i] = random.nextInt(10)+1;
		 * System.out.println("key[i] :"+key[i]); }
		 */
		// 인증키 랜덤함수 생성
		int ran = new Random().nextInt(100000) + 10000; // 10000~99999
		String joincode = String.valueOf(ran);

		String setfrom = "vpzj1234@gmail.com"; // 보내는 사람메일
		String user_email = request.getParameter("user_email"); // 받는 사람 이메일
		String title = "parker이메일 인증키입니다"; // 제목
		String content = joincode; // 인증키

		// 뷰에서 입력값을 가져온다.
		String user_id = request.getParameter("user_id");// 아이디
		String user_name = request.getParameter("user_name");// 이름

		// 모델에값을넣어서 디비검색
		UVO.setUser_id(user_id);
		UVO.setUser_name(user_name);
		UVO.setUser_email(user_email);

		UVO = userService.passEmailFind(UVO);

		if (UVO != null) {
			System.out.println("성공");

			try {

				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(user_email); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				// 내용
				model.addAttribute("content", content);

				System.out.println(" user_email : " + user_email);
				// 받는사람메일
				model.addAttribute("user_email", user_email);
				System.out.println(" content : " + content);

				mailSender.send(message);

			} catch (Exception e) {
				System.out.println(e);

			}

			return "mail/mailsending";

		} else {

			System.out.println("실패");
			model.addAttribute("content", null);
			return "mail/mailsending";
		}

	}

}
