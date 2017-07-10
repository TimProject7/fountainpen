package com.parker.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.ProductQnaDAO;
import com.parker.user.vo.ProductQnaReplyVO;
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

	@Override
	public ProductQnaReplyVO productQnaReply(int productQna_number) {
		// TODO Auto-generated method stub
		return productQnaDAO.productQnaReply(productQna_number);
	}

	/*
	 * @Override public void productQnaViewCnt(int productQna_number,
	 * HttpSession session) { long update_time = 0; // 세션에 저장된 조회시간 검색 // 최초로
	 * 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행X if (session.getAttribute("update_time_"
	 * + productQna_number) != null) { // 세션에서 읽어오기 update_time = (long)
	 * session.getAttribute("update_time_" + productQna_number); } // 시스템의 현재시간을
	 * current_time에 저장 long current_time = System.currentTimeMillis(); // 일정시간이
	 * 경과 후 조회수 증가 처리 24*60*60*1000(24시간) // 시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록
	 * 지정한 시간) if (current_time - update_time > 5 * 1000) {
	 * productQnaDAO.productQnaViewCnt(productQna_number); // 세션에 시간을 저장 :
	 * "update_time_"+bno는 다른변수와 중복되지 않게 명명한 것
	 * session.setAttribute("update_time_" + productQna_number, current_time);
	 * 
	 * }
	 * 
	 * }
	 */

}
