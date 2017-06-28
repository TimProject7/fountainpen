package com.parker.user.service;

import java.util.List;

import com.parker.user.vo.ProductVO;

public interface ProductService {

	/*public List<ProductVO> listProduct();*/

	/*public ProductVO detailProduct(int productId);*/

	// 상품목록
	public List<ProductVO> productList(ProductVO pvo);
	// 상품상세
	public ProductVO productDetail(ProductVO pvo);
	
	// 레코드 건수
	public int productListCnt(ProductVO pvo);
	
}
