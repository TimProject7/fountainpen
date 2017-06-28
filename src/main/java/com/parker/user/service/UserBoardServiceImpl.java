package com.parker.user.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.UserBoardDAO;
import com.parker.user.vo.UserBoardVO;

@Service
@Transactional
public class UserBoardServiceImpl implements UserBoardService {

	@Autowired
	UserBoardDAO UBDAO;

	@Override
	public List<UserBoardVO> userBoardList(UserBoardVO UBVO) {
		List<UserBoardVO> userBoardList = null;
		userBoardList = UBDAO.userBoardList(UBVO);

		System.out.println("DAO userBoardList :" + userBoardList);
		return userBoardList;
	}

	@Override
	public int userBoardListCnt(UserBoardVO UBVO) {
		// TODO Auto-generated method stub
		return UBDAO.userBoardListCnt(UBVO);
	}

	@Override
	public int userBoardInsert(UserBoardVO UBVO) {
		// TODO Auto-generated method stub
		return UBDAO.userBoardInsert(UBVO);
	}

	// 게시글 조회수 증가
	@Override
	public void userBoardViewCnt(int userboard_number, HttpSession session) {
		// TODO Auto-generated method stub

		// TODO Auto-generated method stub
		long update_time = 0;
		// 세션에 저장된 조회시간 검색
		// 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행X
		if (session.getAttribute("update_time_" + userboard_number) != null) {
			// 세션에서 읽어오기
			update_time = (long) session.getAttribute("update_time_" + userboard_number);
		}
		// 시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		// 시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if (current_time - update_time > 5 * 1000) {
			UBDAO.userBoardViewCnt(userboard_number);
			// 세션에 시간을 저장 : "update_time_"+bno는 다른변수와 중복되지 않게 명명한 것
			session.setAttribute("update_time_" + userboard_number, current_time);

		}

	}

	@Override
	public UserBoardVO userBoardDetail(int userboard_number) {
		// TODO Auto-generated method stub
		return UBDAO.userBoardDetail(userboard_number);
	}

	@Override
	public int userBoardDetailUpdate(UserBoardVO UBVO) {
		// TODO Auto-generated method stub
		int result = 0;
		result = UBDAO.userBoardDetailUpdate(UBVO);
		System.out.println("서비스 result :"+result);
		return result;
	}

}
