package com.parker.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.ProductQnaDAO;
import com.parker.user.vo.ProductQnaVO;

@Service
@Transactional
public class ProductQnaServiceImpl implements ProductQnaService {

	@Autowired
	ProductQnaDAO productQnaDAO;

	@Override
	public List<ProductQnaVO> productQnaList(ProductQnaVO PQVO) {
		// TODO Auto-generated method stub
		List<ProductQnaVO> productQnaList;
		productQnaList = productQnaDAO.productQnaList(PQVO);
		return productQnaList;
	}

	@Override
	public int productQnaListCnt(ProductQnaVO PQVO) {
		// TODO Auto-generated method stub
		return productQnaDAO.productQnaListCnt(PQVO);
	}

	@Override
	public int productQnaInsert(ProductQnaVO PQVO) {
		System.out.println("PQVO.toString(): " + PQVO.toString());
		// TODO Auto-generated method stub
		return productQnaDAO.productQnaInsert(PQVO);
	}

	@Override
	public ProductQnaVO productQnaDetail(int productQna_number) {
		// TODO Auto-generated method stub
		return productQnaDAO.productQnaDetail(productQna_number);
	}

	@Override
	public int productQnaDetailUpdate(ProductQnaVO PQVO) {
		// TODO Auto-generated method stub
		
		
		return productQnaDAO.productQnaDetailUpdate(PQVO);
	}
}
