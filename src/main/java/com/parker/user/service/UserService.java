package com.parker.user.service;

import com.parker.user.vo.UserVO;

public interface UserService {
	public int userinsert(UserVO UVO);

	public UserVO sessionLogin(UserVO UVO);

	// 로그인
	public String sessionLogin1(UserVO UVO);

	public String useridchk(UserVO UVO);

	public UserVO idFind(UserVO UVO);

	public UserVO passEmailFind(UserVO UVO);
	
	//회원가입 이메일중복 체크
		public int emailChk(UserVO UVO);

	public int passFindChange(UserVO UVO);

	public UserVO passCheck(UserVO UVO);

	public int userUpdate(UserVO UVO);

	public int userUpdateDelete(UserVO UVO);
}
