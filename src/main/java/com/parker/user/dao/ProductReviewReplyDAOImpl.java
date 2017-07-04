package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.ProductQnaReplyVO;
import com.parker.user.vo.ProductReviewReplyVO;
import com.parker.user.vo.UserBoardReplyVO;

@Repository
public class ProductReviewReplyDAOImpl implements ProductReviewReplyDAO {
	@Autowired
	SqlSession session;

	// 상품 댓글 리스트
	@Override
	public List<ProductReviewReplyVO> ProductReviewReplyList(Integer reviewReply_number) {
		// TODO Auto-generated method stub

		return session.selectList("ProductReviewReplyList", reviewReply_number);
	}

	@Override
	public int ProductReviewReplyInsert(ProductReviewReplyVO PRRVO) {
		// TODO Auto-generated method stub
		return session.insert("ProductReviewReplyInsert", PRRVO);
	}

	@Override
	public int ProductReviewReplyUpdate(ProductReviewReplyVO PRRVO) {
		// TODO Auto-generated method stub
		return session.update("ProductReviewReplyUpdate", PRRVO);
	}

	@Override
	public int ProductReviewReplyDelete(int reviewReply_number) {
		// TODO Auto-generated method stub
		return session.delete("ProductReviewReplyDelete", reviewReply_number);
	}

}
