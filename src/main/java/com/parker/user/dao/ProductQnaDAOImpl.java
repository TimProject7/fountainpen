package com.parker.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.user.vo.ProductQnaVO;

@Repository
public class ProductQnaDAOImpl implements ProductQnaDAO {

	@Autowired
	SqlSession session;

	@Override
	public List<ProductQnaVO> productQnaList(ProductQnaVO PQVO) {
		// TODO Auto-generated method stub
		
		return session.selectList("productQnaList", PQVO);
	}

	@Override
	public int productQnaListCnt(ProductQnaVO PQVO) {
		// TODO Auto-generated method stub
		return session.selectOne("productQnaListCnt",PQVO);
	}

	@Override
	public int productQnaInsert(ProductQnaVO PQVO) {
		// TODO Auto-generated method stub
		return session.insert("productQnaInsert", PQVO);
	}

	@Override
	public ProductQnaVO productQnaDetail(int productQna_number) {
		// TODO Auto-generated method stub
		return session.selectOne("productQnaDetail",productQna_number);
	}

	@Override
	public int productQnaDetailUpdate(ProductQnaVO PQVO) {
		// TODO Auto-generated method stub
		return session.update("productQnaDetailUpdate", PQVO);
	}

	@Override
	public void productQnaViewCnt(int productQna_number) {
		session.update("productQnaViewCnt", productQna_number);
		
	}

}
