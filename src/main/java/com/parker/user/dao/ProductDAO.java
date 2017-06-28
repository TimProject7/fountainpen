package com.parker.user.dao;

import java.util.List;

import com.parker.user.vo.ProductVO;

public interface ProductDAO {

/*	public List<ProductVO> listProduct();*/

	/*public ProductVO detailProduct(int productId);
*/
	//상품목록
	public List<ProductVO> productList(ProductVO pvo);
	//상품상세
	public ProductVO productDetail(ProductVO pvo);
	
	//레코드
	public int productListCnt(ProductVO pvo);

}
