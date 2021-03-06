package com.parker.user.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.parker.user.boardcommon.Paging;
import com.parker.user.boardcommon.Util;
import com.parker.user.service.FAQService;
import com.parker.user.service.NoticeService;
import com.parker.user.service.UserBoardReplyService;
import com.parker.user.service.UserBoardService;
import com.parker.user.vo.FAQVO;
import com.parker.user.vo.NoticeVO;
import com.parker.user.vo.UserBoardReplyVO;
import com.parker.user.vo.UserBoardVO;
import com.parker.user.vo.UserVO;

@Controller
@RequestMapping("/serviceCenter")
public class ServiceCenterController {
	Logger logger = Logger.getLogger(myPageController.class);

	// 의존관계 주입 => BoardServiceImpl 생성
	// IoC 의존관계 역전
	@Inject
	FAQService faqService;

	// 의존관계 주입 => BoardServiceImpl 생성
	// IoC 의존관계 역전
	@Inject
	NoticeService noticeService;

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

		// 글번호 재설정
		int count = total - (Util.nvl(UBVO.getPage()) - 1) * Util.nvl(UBVO.getPageSize());
		logger.info("count = " + count);

		// 전체데이터가져오는 리스트!
		List<UserBoardVO> userBoardList = userBoardService.userBoardList(UBVO);

		model.addAttribute("count", count);
		model.addAttribute("userBoardList", userBoardList);
		model.addAttribute("data", UBVO);
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
			HttpSession session, ModelAndView mav, Model model, HttpServletRequest request) {
		logger.info("userBoardDetail 호출 성공");

		// 조회수
		userBoardService.userBoardViewCnt(userboard_number, session);
		mav.addObject("userBoardDetail", userBoardService.userBoardDetail(userboard_number));
		// 세션정보가져옴
		UserVO uvo = (UserVO) session.getAttribute("UVO");
		// 세션아이디
		String userid = uvo.getUser_id();
		
		
		model.addAttribute("userid", userid);
		mav.setViewName("serviceCenter/userBoard/userBoardDetail");

		return mav;
	}

	// 회원게시판 수정 액션
	@RequestMapping(value = "/userBoard/userBoardDetailUpdate", method = { RequestMethod.POST, RequestMethod.GET })
	public String userBoardDetailUpdate(@ModelAttribute UserBoardVO UBVO, HttpSession session,
			@ModelAttribute UserVO UVO, Model model) {
		logger.info("userBoardDetailUpdate 호출 성공");
		System.out.println("UBVO.getUserboard_name() : " + UBVO.getUserboard_name());
		// 정보수정
		int result = userBoardService.userBoardDetailUpdate(UBVO);

		

		if (result == 1) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}

		return "redirect:/serviceCenter/userBoard/userBoard.do";
	}
	
	// 회원게시판 수정 액션
		@RequestMapping(value = "/userBoard/userBoardDetailDelete", method = { RequestMethod.POST, RequestMethod.GET })
		public String userBoardDetailDelete(@ModelAttribute UserBoardVO UBVO, HttpSession session,
				@ModelAttribute UserVO UVO, Model model) {
			// 정보수정
			int result = userBoardService.userBoardDetailDelete(UBVO);

			

			if (result == 1) {
				System.out.println("성공");
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

	// 01. 게시글 목록
	@RequestMapping("/faq/FAQlist")
	public ModelAndView list(ModelAndView mav, @ModelAttribute FAQVO fvo) throws Exception {
		logger.info("FAQ 리스트 호출 성공");
		Paging.set(fvo);
		// ModelAndView - 모델과 뷰
		int total = faqService.listCnt(fvo);
		int count = total - (Util.nvl(fvo.getPage()) - 1) * Util.nvl(fvo.getPageSize());

		List<FAQVO> list = faqService.listAll(fvo);

		mav.addObject("count", count);
		mav.addObject("data", fvo);
		mav.setViewName("serviceCenter/faq/FAQlist"); // 뷰를 list.jsp로 설정
		mav.addObject("total", total);
		mav.addObject("faq_list", list); // 데이터를 저장

		return mav; // list.jsp로 List가 전달된다.
	}

	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	// @RequestParam : get/post방식으로 전달된 변수 1개
	// HttpSession 세션객체
	@RequestMapping(value = "/faq/FAQview", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int faq_no, HttpSession session) throws Exception {
		// 조회수 증가 처리
		faqService.increaseViewcnt(faq_no, session);
		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("serviceCenter/faq/FAQview");
		// 뷰에 전달할 데이터
		mav.addObject("dto", faqService.read(faq_no));
		return mav;

	}

	// 01. 게시글 목록
	@RequestMapping("/notice/noticelist")
	public ModelAndView list(ModelAndView mav, @ModelAttribute NoticeVO nvo) throws Exception {
		logger.info("Notice 리스트 호출 성공");
		Paging.set(nvo);
		int total = noticeService.noticeListCnt(nvo);
		int count = total - (Util.nvl(nvo.getPage()) - 1) * Util.nvl(nvo.getPageSize());
		List<NoticeVO> list = noticeService.listAll(nvo);

		// ModelAndView - 모델과 뷰
		mav.addObject("count", count);
		mav.addObject("data", nvo);
		mav.addObject("total", total);
		mav.setViewName("serviceCenter/notice/noticelist"); // 뷰를 list.jsp로 설정
		mav.addObject("Notice_list", list); // 데이터를 저장

		return mav; // list.jsp로 List가 전달된다.
	}

	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	// @RequestParam : get/post방식으로 전달된 변수 1개
	// HttpSession 세션객체
	@RequestMapping(value = "/notice/noticeview", method = RequestMethod.GET)
	public ModelAndView noticeview(@RequestParam int notice_no, HttpSession session) throws Exception {
		// 조회수 증가 처리
		noticeService.increaseViewcnt(notice_no, session);
		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("serviceCenter/notice/noticeview");
		// 뷰에 전달할 데이터
		mav.addObject("dto", noticeService.read(notice_no));
		return mav;

	}
}
