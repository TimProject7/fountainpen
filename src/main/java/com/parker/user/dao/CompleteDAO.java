package com.parker.user.dao;

import java.util.List;

import com.parker.user.vo.CompleteVO;

public interface CompleteDAO {

	
	// 구매내역 리스트
		public List<CompleteVO> CompleteList(CompleteVO cpvo);
	
	// 결제완료 
		public int completeUpdate(CompleteVO cpvo);
		
		// 카트비우기
		public int completeDelete(int user_number);
		
}
