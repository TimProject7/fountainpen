package com.parker.user.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.CompleteDAO;
import com.parker.user.vo.CompleteVO;

@Service
@Transactional
public class CompleteServiceImpl implements CompleteService {

	Logger logger = Logger.getLogger(CompleteServiceImpl.class);

	@Autowired
	private CompleteDAO completeDao;

	// 구매내역
	@Override
	public List<CompleteVO> CompleteList(CompleteVO cpvo) {
		List<CompleteVO> comList = new ArrayList<CompleteVO>();
		comList = completeDao.CompleteList(cpvo);
		// TODO Auto-generated method stub
		return comList;
	}

	// 결제완료
	@Override
	public int completeUpdate(CompleteVO cpvo) {
		int result = 0;
		result = completeDao.completeUpdate(cpvo);
		return result;
	}

	// 카트비우기
	@Override
	public int completeDelete(int user_number) {
		// TODO Auto-generated method stub
		int result = 0;
		result = completeDao.completeDelete(user_number);
		return result;
	}

}
