package com.parker.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.parker.user.vo.ProductQnaVO;

public interface ProductQnaService {
	// 전체 리스트 가져오기
	public List<ProductQnaVO> productQnaList(ProductQnaVO PQVO);

	public int productQnaListCnt(ProductQnaVO PQVO);

	// 상품Qna 글쓰기
	public int productQnaInsert(ProductQnaVO PQVO);

	// 상세보기
	public ProductQnaVO productQnaDetail(int productQna_number);

	// 수정
	public int productQnaDetailUpdate(ProductQnaVO PQVO);

	// 상품 Qna조회수 증가
	public void productQnaViewCnt(int productQna_number, HttpSession session);
}
