package com.parker.user.dao;

import com.parker.user.vo.UserVO;

public interface UserDAO {
	public int userinsert(UserVO UVO);
	public UserVO selectLogin(UserVO uvo);
	
	public UserVO sessionLogin(UserVO UVO);
	public String useridcheck(UserVO UVO);
	
	public UserVO idfind(UserVO UVO);
	public UserVO passEmailFind(UserVO UVO);
	public int passFindChange(UserVO UVO);
	
	public UserVO passCheck(UserVO UVO);
}
