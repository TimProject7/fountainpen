package com.parker.user.dao;

import java.util.List;

import com.parker.user.vo.ProductQnaVO;
import com.parker.user.vo.UserBoardVO;

public interface ProductQnaDAO {

	// 전체 리스트 가져오기
	public List<ProductQnaVO> productQnaList(ProductQnaVO PQVO);

	public int productQnaListCnt(ProductQnaVO PQVO);

	// 상품Qna 글쓰기
	public int productQnaInsert(ProductQnaVO PQVO);
	
	// 상세보기
	public ProductQnaVO productQnaDetail(int productQna_number);
	
	//수정
	public int productQnaDetailUpdate(ProductQnaVO PQVO);
}
