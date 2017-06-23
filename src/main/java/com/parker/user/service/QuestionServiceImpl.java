package com.parker.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.QuestionDAO;
import com.parker.user.vo.QuestionVO;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	QuestionDAO QDAO;

	@Override
	public QuestionVO questionUser(QuestionVO QVO) {
		// TODO Auto-generated method stub
		return QDAO.questionUser(QVO);
	}

	@Override
	public int questionInsert(QuestionVO QVO) {
		int result = 0;
		result = QDAO.questionInsert(QVO);
		return result;
	}

	@Override
	public QuestionVO questionDetail(int question_number) {

		return QDAO.questionDetail(question_number);
	}

	@Override
	public int questionUpdate(QuestionVO QVO) {
		int result = 0;
		result = QDAO.questionUpdate(QVO);
		return result;
	}

	// 1:1문의게시판 리스트
	@Override
	public List<QuestionVO> questionList(QuestionVO QVO) {
		List<QuestionVO> questionList = null;
		questionList = QDAO.questionList(QVO);
		return questionList;
	}

	@Override
	public int questionListCnt(QuestionVO QVO) {
		// TODO Auto-generated method stub
		return QDAO.questionListCnt(QVO);
	}

	// 게시글 조회수 증가
	@Override
	public void questionViewCount(int question_number, HttpSession session) {
		// TODO Auto-generated method stub

		// TODO Auto-generated method stub
		long update_time = 0;
		// 세션에 저장된 조회시간 검색
		// 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행X
		if (session.getAttribute("update_time_" + question_number) != null) {
			// 세션에서 읽어오기
			update_time = (long) session.getAttribute("update_time_" + question_number);
		}
		// 시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		// 시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if (current_time - update_time > 5 * 1000) {
			QDAO.questionViewCount(question_number);
			// 세션에 시간을 저장 : "update_time_"+bno는 다른변수와 중복되지 않게 명명한 것
			session.setAttribute("update_time_" + question_number, current_time);

		}

	}

}
