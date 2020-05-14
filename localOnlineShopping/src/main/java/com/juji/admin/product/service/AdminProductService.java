package com.juji.admin.product.service;

import java.util.List;

import com.juji.client.product.vo.ProductVO;

public interface AdminProductService {
	public List<ProductVO> productList(ProductVO pvo);
	public int productListCnt(ProductVO pvo);
	public int productRegist(ProductVO pvo);
	public ProductVO productDetail(ProductVO pvo);
	public int productUpdate(ProductVO pvo);
	public int productDelete(String p_name);

}
