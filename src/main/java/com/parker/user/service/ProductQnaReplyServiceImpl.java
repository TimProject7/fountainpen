package com.parker.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.ProductQnaReplyDAO;
import com.parker.user.vo.ProductQnaReplyVO;
import com.parker.user.vo.UserBoardReplyVO;

@Service
@Transactional
public class ProductQnaReplyServiceImpl implements ProductQnaReplyService {
	@Autowired
	ProductQnaReplyDAO PQRDAO;

	@Override
	public List<ProductQnaReplyVO> ProductQnaReplyList(Integer productId) {
		List<ProductQnaReplyVO> ProductQnaReplyList;
		ProductQnaReplyList = PQRDAO.ProductQnaReplyList(productId);

		return ProductQnaReplyList;
	}

	@Override
	public int ProductQnaReplyInsert(ProductQnaReplyVO PQRVO) {
		// TODO Auto-generated method stub
		return PQRDAO.ProductQnaReplyInsert(PQRVO);
	}

	@Override
	public int ProductQnaReplyUpdate(ProductQnaReplyVO PQRVO) {
		// TODO Auto-generated method stub
		int result = 0;
		result = PQRDAO.ProductQnaReplyUpdate(PQRVO);
		return result;
	}

	@Override
	public int ProductQnaReplyDelete(int productqna_number) {
		// TODO Auto-generated method stub
		return PQRDAO.ProductQnaReplyDelete(productqna_number);
	}

	@Override
	public int ProductBuyChk(ProductQnaReplyVO PQRVO) {
		// TODO Auto-generated method stub
		return PQRDAO.ProductBuyChk(PQRVO);
	}

}
