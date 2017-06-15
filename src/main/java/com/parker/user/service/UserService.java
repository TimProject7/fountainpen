package com.parker.user.service;


import com.parker.user.vo.UserVO;

public interface UserService {
	public int userinsert(UserVO UVO);
	
	public UserVO selectList(UserVO uVO);
	
	public UserVO sessionLogin(UserVO UVO);
	
	public String useridchk(UserVO UVO);
	
	public UserVO idFind(UserVO UVO);

	public UserVO passEmailFind(UserVO UVO);
	
	public int passFindChange(UserVO UVO);
	public UserVO passCheck(UserVO UVO);
	
}
