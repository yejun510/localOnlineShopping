package com.juji.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.client.delivery.vo.DeliveryVO;
import com.juji.client.product.dao.ProductDao;
import com.juji.client.product.vo.ProductVO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao productDao;
	
	// 소고기 상품 목록 구현
	@Override
	public List<ProductVO> beefList(){
		List<ProductVO>beeflist = null;
		beeflist = productDao.beefList();
		return beeflist;
	}
	// 돼지고기 상품 목록 구현
	@Override
	public List<ProductVO> porkList() {
		List<ProductVO>porklist = null;
		porklist = productDao.porkList();
		
		return porklist;
	}
	// 상품상세페이지 구현
	@Override
	public ProductVO productDetail(ProductVO pvo) {
			ProductVO detail = null;
			detail = productDao.productDetail(pvo);
		return detail;
	}
	// 구매페이지 구현
	@Override
	public List<ProductVO> buyingList(String string) {
		List<ProductVO>buylist = null;
		buylist = productDao.buyList();
		return buylist;
	}



}
