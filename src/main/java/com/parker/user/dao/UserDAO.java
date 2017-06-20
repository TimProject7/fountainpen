package com.parker.user.dao;

import com.parker.user.vo.UserVO;

public interface UserDAO {
	//회원가입
	public int userinsert(UserVO UVO);
	
	//로그인
	public UserVO sessionLogin(UserVO UVO);
	
	//로그인
	public String sessionLogin1(UserVO UVO);
	
	//아이디 중복확인
	public String useridcheck(UserVO UVO);
	
	//아이디 찾기
	public UserVO idfind(UserVO UVO);
	
	//비밀번호 변경 이메일인증
	public UserVO passEmailFind(UserVO UVO);
	
	//비밀번호 변경
	public int passFindChange(UserVO UVO);
	
	//회원정보변경전 비밀번호 확인
	public UserVO passCheck(UserVO UVO);
	
	//회원정보 변경
	public int userUpdate(UserVO UVO);
	
	//회원 탈퇴
	public int userUpdateDelete(UserVO UVO);
}
