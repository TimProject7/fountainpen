package com.parker.user.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/mail")
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	

	// mailSending 코드
	@RequestMapping(value = "/mailForm", method = RequestMethod.POST)
	public String mailSending(HttpServletRequest request, Model model) {
		/*
		 * Random random = new Random(); int[] key = new int[6];
		 * 
		 * for (int i = 0; i < key.length; i++) { key[i] = random.nextInt(10)+1;
		 * System.out.println("key[i] :"+key[i]); }
		 */
		//인증키 랜덤함수 생성
		int ran = new Random().nextInt(100000) + 10000; // 10000~99999
		String joincode = String.valueOf(ran);

		String setfrom = "vpzj1234@gmail.com";		//보내는 사람메일
		String user_email = request.getParameter("user_email"); // 받는 사람 이메일
		String title = "parker이메일 인증키입니다";		//제목
		String content = joincode;					//인증키

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(user_email); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용
			
			//받는사람메일
			model.addAttribute("user_email", user_email);
			//내용
			model.addAttribute("content", content);
			System.out.println(" user_email : " + user_email);
			System.out.println(" content : " + content);

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "mail/mailsending";
	}

}