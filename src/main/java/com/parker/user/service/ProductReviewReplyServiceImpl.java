package com.parker.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.ProductQnaReplyDAO;
import com.parker.user.dao.ProductReviewReplyDAO;
import com.parker.user.vo.ProductQnaReplyVO;
import com.parker.user.vo.ProductReviewReplyVO;
import com.parker.user.vo.UserBoardReplyVO;

@Service
@Transactional
public class ProductReviewReplyServiceImpl implements ProductReviewReplyService {
	@Autowired
	ProductReviewReplyDAO PRRDAO;

	// 댓글 리스트
	@Override
	public List<ProductReviewReplyVO> ProductReviewReplyList(Integer reviewReply_number) {
		List<ProductReviewReplyVO> ProductReviewReplyList;
		ProductReviewReplyList = PRRDAO.ProductReviewReplyList(reviewReply_number);
		return ProductReviewReplyList;
	}

	// 댓글 작성
	@Override
	public int ProductReviewReplyInsert(ProductReviewReplyVO PRRVO) {
		// TODO Auto-generated method stub
		return PRRDAO.ProductReviewReplyInsert(PRRVO);
	}

	// 댓글 수정
	@Override
	public int ProductReviewReplyUpdate(ProductReviewReplyVO PRRVO) {
		// TODO Auto-generated method stub
		int result = 0;
		result = PRRDAO.ProductReviewReplyUpdate(PRRVO);
		return result;
	}

	// 댓글 삭제
	@Override
	public int ProductReviewReplyDelete(int reviewReply_number) {
		// TODO Auto-generated method stub
		return PRRDAO.ProductReviewReplyDelete(reviewReply_number);
	}

	@Override
	public int ProductBuyChk(ProductReviewReplyVO PRRVO) {
		// TODO Auto-generated method stub
		return PRRDAO.ProductBuyChk(PRRVO);
	}

}
