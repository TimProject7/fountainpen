package com.parker.user.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.parker.user.bcrypt.BCrypt;
import com.parker.user.bcrypt.SHA256;
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
		String password = UVO.getUser_password();

		try {
			String bcpass = BCrypt.hashpw(password, BCrypt.gensalt());
			UVO.setUser_password(bcpass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return session.insert("userinsert", UVO);
	}

	@Override
	public UserVO selectLogin(UserVO uVO) {
		/*
		 * uVO.setUser_password(
		 * "$2a$10$.IqBc7XS/TNwUp0uwFXQc.3rWpw/qVe3/Z/oV6uU8b0A5f.PyS6h2");
		 */
		return session.selectOne("selectLogin", uVO);
	}

	@Override
	public String useridcheck(UserVO UVO) {
		// TODO Auto-generated method stub
		logger.debug("디버그 UVO.toString() : " + UVO.toString());
		return session.selectOne("useridcheck", UVO) + "";
	}

	@Override
	public UserVO sessionLogin(UserVO UVO) {
		// UVO.setUser_password("$2a$10$.IqBc7XS/TNwUp0uwFXQc.3rWpw/qVe3/Z/oV6uU8b0A5f.PyS6h2");
		System.out.println("DAO 테스트 UVO.toString() : " + UVO.toString());

		return session.selectOne("selectLoginUser", UVO);

	}

	@Override
	public UserVO idfind(UserVO UVO) {
		// TODO Auto-generated method stub
		return session.selectOne("idFind", UVO);
	}

	@Override
	public UserVO passEmailFind(UserVO UVO) {
		// TODO Auto-generated method stub
		return session.selectOne("passEmailFind", UVO);
	}

	// 비밀번호 변경
	@Override
	public int passFindChange(UserVO UVO) {
		// TODO Auto-generated method stub
		System.out.println(" UVO.getUser_password() " + UVO.getUser_password());
		String password = UVO.getUser_password();

		try {
			String bcpass = BCrypt.hashpw(password, BCrypt.gensalt());
			UVO.setUser_password(bcpass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return session.update("passFindChange", UVO);
	}

	@Override
	public UserVO passCheck(UserVO UVO) {
		
		return session.selectOne("passCheck", UVO);
	}

}
