package com.parker.user.service;

import java.util.List;

import com.parker.user.vo.ProductQnaReplyVO;
import com.parker.user.vo.ProductVO;
import com.parker.user.vo.UserBoardReplyVO;

public interface ProductQnaReplyService {

	// 댓글목록
	public List<ProductQnaReplyVO> ProductQnaReplyList(Integer productId);

	// 구매확인
	public int ProductBuyChk(ProductQnaReplyVO PQRVO);

	// 댓글 등록
	public int ProductQnaReplyInsert(ProductQnaReplyVO PQRVO);

	// 댓글 수정
	public int ProductQnaReplyUpdate(ProductQnaReplyVO PQRVO);

	// 댓글 삭제
	public int ProductQnaReplyDelete(int productqna_number);

}
