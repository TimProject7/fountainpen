package com.parker.user.service;

import java.util.List;

import com.parker.user.vo.ProductReviewReplyVO;

public interface ProductReviewReplyService {

	// 댓글목록
	public List<ProductReviewReplyVO> ProductReviewReplyList(Integer reviewReply_number);

	// 댓글 등록
	public int ProductReviewReplyInsert(ProductReviewReplyVO PRRVO);

	// 댓글 수정
	public int ProductReviewReplyUpdate(ProductReviewReplyVO PRRVO);

	// 댓글 삭제
	public int ProductReviewReplyDelete(int reviewReply_number);

}
