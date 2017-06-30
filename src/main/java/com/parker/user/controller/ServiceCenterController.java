package com.parker.user.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.parker.user.boardcommon.Paging;
import com.parker.user.service.UserBoardReplyService;
import com.parker.user.service.UserBoardService;
import com.parker.user.vo.UserBoardReplyVO;
import com.parker.user.vo.UserBoardVO;
import com.parker.user.vo.UserVO;

@Controller
@RequestMapping("/serviceCenter")
public class ServiceCenterController {
	Logger logger = Logger.getLogger(myPageController.class);

	// 회원게시판
	@Autowired
	UserBoardService userBoardService;

	// 회원게시판 댓글
	@Autowired
	UserBoardReplyService userBoardReplyService;

	// 회원게시판 목록 리스트
	@RequestMapping(value = "/userBoard/userBoard", method = { RequestMethod.POST, RequestMethod.GET })
	public String userBoard(@ModelAttribute UserBoardVO UBVO, Model model, HttpServletRequest request,
			HttpSession session) {
		logger.info("userBoard 호출 성공");
		// 페이징
		Paging.set(UBVO);

		// 리스트 건수
		int total = userBoardService.userBoardListCnt(UBVO);

		// 전체데이터가져오는 리스트!
		List<UserBoardVO> userBoardList = userBoardService.userBoardList(UBVO);

		model.addAttribute("userBoardList", userBoardList);
		model.addAttribute("total", total);

		return "serviceCenter/userBoard/userBoard";

	}

	// 회원게시판 글쓰기 폼으로 이동
	@RequestMapping(value = "/userBoard/userBoardWriterForm", method = RequestMethod.POST)
	public String userBoardWriter(@ModelAttribute UserBoardVO UBVO, Model model) {
		logger.info("userBoardwriterForm 호출 성공");

		return "serviceCenter/userBoard/userBoardWriterForm";

	}

	// 회원게시판 글쓰기 액션
	@RequestMapping(value = "/userBoard/userBoardInsert", method = { RequestMethod.POST, RequestMethod.GET })
	public String userBoardWriterAction(@ModelAttribute UserBoardVO UBVO, Model model,
			@RequestParam("userboard_url") MultipartFile file, HttpServletRequest request, HttpSession session,
			@ModelAttribute UserVO UVO) {
		logger.info("userBoardInsert 호출 성공");
		String filename = "";

		if (!UBVO.getUserboard_url().isEmpty()) {
			filename = file.getOriginalFilename();

			String path = request.getSession().getServletContext().getRealPath("/resources/images/");

			try {
				new File(path).mkdirs();
				UBVO.getUserboard_url().transferTo(new File(path + filename));
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			UBVO.setUserboard_image(filename);

			// 세션가져와서 넣어준당
			UserVO uvo = (UserVO) session.getAttribute("UVO");
			UBVO.setUser_number(uvo.getUser_number());
			System.out.println("usernumber : " + UBVO);

			int result = userBoardService.userBoardInsert(UBVO);

			System.out.println("result : " + result);

		}
		return "redirect:/serviceCenter/userBoard/userBoard.do";
	}

	// 회원게시판 상세페이지
	@RequestMapping(value = "/userBoard/userBoardDetail", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView userBoardDetail(@ModelAttribute UserBoardVO UBVO, @RequestParam int userboard_number,
			HttpSession session, ModelAndView mav,Model model) {
		logger.info("userBoardDetail 호출 성공");

		// 조회수
		userBoardService.userBoardViewCnt(userboard_number, session);
		
		UserVO uvo = (UserVO) session.getAttribute("UVO");
		String username =uvo.getUser_name();
		String userid = uvo.getUser_id();
		
		System.out.println("username : " +username);
		System.out.println("userid:" + userid);
		
		// 상세페이지 이동
		mav.addObject("userBoardDetail", userBoardService.userBoardDetail(userboard_number));
		//mav.addObject("username",username);
		model.addAttribute("username", username);
		model.addAttribute("userid", userid);
		mav.setViewName("serviceCenter/userBoard/userBoardDetail");
		return mav;
	}

	// 회원게시판 수정 액션
	@RequestMapping(value = "/userBoard/userBoardDetailUpdate", method = { RequestMethod.POST, RequestMethod.GET })
	public String userBoardDetailUpdate(@ModelAttribute UserBoardVO UBVO, HttpSession session,
			@ModelAttribute UserVO UVO, Model model) {
		logger.info("userBoardDetailUpdate 호출 성공");
		
		
		// 정보수정
		int result = userBoardService.userBoardDetailUpdate(UBVO);
		
		
		// 세션가져와서 넣어준당
		List<UserBoardVO> userBoardList = userBoardService.userBoardList(UBVO);
		
		

		if (result == 1) {
			System.out.println("성공");
			model.addAttribute("userBoardList", userBoardList);
		} else {
			System.out.println("실패");
		}

		return "redirect:/serviceCenter/userBoard/userBoard.do";
	}

	// 댓글목록
	@RequestMapping(value = "/userBoard/userBoardReply/all/{userboard_number}.do", method = RequestMethod.GET)
	public ResponseEntity<List<UserBoardReplyVO>> list(@PathVariable("userboard_number") Integer userboard_number) {
		ResponseEntity<List<UserBoardReplyVO>> entity = null;

		try {
			entity = new ResponseEntity<>(userBoardReplyService.userBoardReplyList(userboard_number), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*
	 * 회원 게시판 댓글 글쓰기 구현하기
	 * 
	 * @return String 참고 : @RequestBody
	 */
	@RequestMapping(value = "/userBoard/userBoardReplyInsert")
	public ResponseEntity<String> replyInsert(@RequestBody UserBoardReplyVO UBRVO, HttpSession session) {
		logger.info("replyInsert 호출 성공");
		ResponseEntity<String> entity = null;
		int result;

		UserVO uvo = (UserVO) session.getAttribute("UVO");
		System.out.println("uvo.getUser_number : " + uvo.getUser_number());
		UBRVO.setUser_number(uvo.getUser_number());

		try {
			result = userBoardReplyService.userBoardReplyInsert(UBRVO);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*
	 * 댓글 수정 구현하기
	 * 
	 * @return 참고 : REST방식에서 UPDATE 작업은 PUT.PATCH방식을 이용해서 처리 전체 데이터를 수정하는 경우에는
	 * PUT을 이용하고 일부의 데이터를 수정하는 경우에는 PATCH를 이용
	 */
	@RequestMapping(value = "userBoard/{userboardreply_number}.do", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> replyUpdate(@PathVariable("userboardreply_number") Integer userboardreply_number,
			@RequestBody UserBoardReplyVO UBRVO) {
		logger.info("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;

		try {
			UBRVO.setUserboardreply_number(userboardreply_number);
			userBoardReplyService.userBoardReplyUpdate(UBRVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*
	 * 댓글 삭제 구현하기
	 * 
	 * @return 참고 :REST방식에서 DELETE 작업은 DELETE방식을 이용해서 처리
	 */
	@RequestMapping(value = "userBoard/{userboardreply_number}.do", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyDelete(@PathVariable("userboardreply_number") Integer userboardreply_number) {
		logger.info("replyDelete 호출 성공");
		ResponseEntity<String> entity = null;

		try {
			userBoardReplyService.userBoardReplyDelete(userboardreply_number);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
