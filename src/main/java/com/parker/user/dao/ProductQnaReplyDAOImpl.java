package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.ProductQnaReplyVO;
import com.parker.user.vo.UserBoardReplyVO;

@Repository
public class ProductQnaReplyDAOImpl implements ProductQnaReplyDAO {
	@Autowired
	SqlSession session;

	// 상품 댓글 리스트
	@Override
	public List<ProductQnaReplyVO> ProductQnaReplyList(Integer productId) {
		// TODO Auto-generated method stub

		return session.selectList("ProductQnaReplyList", productId);
	}

	@Override
	public int ProductQnaReplyInsert(ProductQnaReplyVO PQRVO) {
		// TODO Auto-generated method stub
		return session.insert("ProductQnaReplyInsert", PQRVO);
	}

	@Override
	public int ProductQnaReplyUpdate(ProductQnaReplyVO PQRVO) {
		// TODO Auto-generated method stub
		return session.update("ProductQnaReplyUpdate", PQRVO);
	}

	@Override
	public int ProductQnaReplyDelete(int productqna_number) {
		// TODO Auto-generated method stub
		return session.delete("ProductQnaReplyDelete", productqna_number);
	}

	@Override
	public int ProductBuyChk(ProductQnaReplyVO PQRVO) {
		// TODO Auto-generated method stub
		return session.selectOne("ProductBuyChk", PQRVO);
	}

}
