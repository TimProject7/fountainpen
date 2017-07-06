package com.parker.user.service;

import java.util.List;

import com.parker.user.vo.CompleteVO;

public interface CompleteService {

	// 구매내역 목록확인
	public List<CompleteVO> CompleteList(CompleteVO cpvo);
	
	// 결제완료업데이트
	public int completeUpdate(CompleteVO cpvo);

	//카트비우기
	public int completeDelete(int user_number);
	
}
