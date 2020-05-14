package com.juji.client.product.service;

import java.util.List;

import com.juji.client.delivery.vo.DeliveryVO;
import com.juji.client.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> beefList();
	public List<ProductVO> porkList();
	public ProductVO productDetail(ProductVO pvo);
	public List<ProductVO> buyingList(String string);

	



}
