package com.parker.user.dao;

import com.parker.user.vo.UserVO;

public interface UserDAO {
	public int userinsert(UserVO UVO);
	public UserVO selectLogin(UserVO uvo);
	public String useridcheck(UserVO UVO);
	public UserVO useridcheck1(UserVO UVO);
}
