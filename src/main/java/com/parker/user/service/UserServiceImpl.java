package com.parker.user.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.UserDAO;
import com.parker.user.vo.UserVO;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Override
	public int userinsert(UserVO UVO) {
		int result = 0;
		logger.info(userDAO.toString());
		result = userDAO.userinsert(UVO);
		return result;
	}


	
	@Override
	public UserVO selectList(UserVO uVO) {
		return userDAO.selectLogin(uVO);
	}



	@Override
	public String useridchk(UserVO UVO) {
		String result;
		System.out.println("service1 UVO : " +UVO);
		System.out.println("service1 UVO : " +UVO.getUser_id());
		result = userDAO.useridcheck(UVO) + "";
		return result;
	}



	@Override
	public UserVO useridchk1(UserVO UVO) {
		// TODO Auto-generated method stub
		System.out.println("service UVO : " +UVO);
		System.out.println("service UVO : " +UVO.getUser_id());
		return userDAO.useridcheck1(UVO);
	}



	@Override
	public UserVO sessionLogin(UserVO UVO) {
		
		return userDAO.sessionLogin(UVO);
	}

}
