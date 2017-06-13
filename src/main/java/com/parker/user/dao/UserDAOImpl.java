package com.parker.user.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.parker.user.service.UserServiceImpl;
import com.parker.user.vo.UserVO;

//저장소 
@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	SqlSession session;
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	// 회원가입
	@Override
	public int userinsert(UserVO UVO) {
		return session.insert("userinsert", UVO);
	}

	

	@Override
	public UserVO selectLogin(UserVO uVO) {
		uVO.setUser_password("$2a$10$.IqBc7XS/TNwUp0uwFXQc.3rWpw/qVe3/Z/oV6uU8b0A5f.PyS6h2");
		return session.selectOne("selectLogin", uVO);
	}



	@Override
	public String useridcheck(UserVO UVO) {
		// TODO Auto-generated method stub
		logger.debug("디버그 UVO.toString() : " +UVO.toString());
		return session.selectOne("useridcheck",UVO) + "";
	}



	@Override
	public UserVO useridcheck1(UserVO UVO) {
		// TODO Auto-generated method stub
		System.out.println("DAO UVO : " +UVO);
		System.out.println("DAO UVO : " +UVO.getUser_id());
		return session.selectOne("useridcheck1",UVO);
	}



	@Override
	public UserVO sessionLogin(UserVO UVO) {
		UVO.setUser_password("$2a$10$.IqBc7XS/TNwUp0uwFXQc.3rWpw/qVe3/Z/oV6uU8b0A5f.PyS6h2");
		System.out.println("DAO 테스트 UVO.toString() : " +UVO.toString());
		return session.selectOne("selectLoginUser", UVO) ;
	}



	

}
