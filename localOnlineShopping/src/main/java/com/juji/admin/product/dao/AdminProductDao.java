package com.juji.admin.product.dao;

import java.util.List;

import com.juji.client.product.vo.ProductVO;

public interface AdminProductDao {

	public List<ProductVO> productList(ProductVO pvo);
	public int productListCnt(ProductVO pvo);
	public int productRegist(ProductVO pvo);
	public ProductVO productDetail(ProductVO pvo);
	public int productUpdate(ProductVO pvo);
	public int productDelete(String p_name);
	
}
