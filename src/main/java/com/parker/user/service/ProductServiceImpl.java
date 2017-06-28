package com.parker.user.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.user.dao.ProductDAO;
import com.parker.user.vo.ProductVO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	Logger logger = Logger.getLogger(ProductServiceImpl.class);
	
	@Autowired
	ProductDAO productDao;
	
	/*상품목록*/
	/*@Override
	public List<ProductVO> listProduct(){
		System.out.println("용호ser1");
		return productDao.listProduct();
	}*/
	
	/*상품상세*/
	/*@Override
	public ProductVO detailProduct(int productId){
		System.out.println("용호ser2");
		return productDao.detailProduct(productId);
	}*/

	/*상품목록*/
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> myList = new ArrayList<ProductVO>();
		myList = productDao.productList(pvo);
		return myList;
	}

	/*상품상세*/
	@Override
	public ProductVO productDetail(ProductVO pvo){
		ProductVO detail = null;
		detail = productDao.productDetail(pvo);
		return detail;
	}
	
	/*전체 레코드 수 구현*/
	@Override
	public int productListCnt(ProductVO pvo) {
		return productDao.productListCnt(pvo);
	}
	
	
	
}
