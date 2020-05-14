package com.juji.client.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.juji.client.delivery.vo.DeliveryVO;
import com.juji.client.product.vo.ProductVO;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	private SqlSession session;
	
	//소고기 상품목록 구현
	@Override
	public List<ProductVO>beefList(){
		return session.selectList("beefList");
	}
	// 돼지고기 상품 목록 구현
	@Override
	public List<ProductVO> porkList() {
		return session.selectList("porkList");
	}
	//상품 상세 페이지 구현
	@Override
	public ProductVO productDetail (ProductVO pvo) {
		return (ProductVO)session.selectOne("productDetail",pvo);
	}
	// 구매 페이지 구현
	@Override
	public List<ProductVO> buyList() {
		return session.selectList("buying");
	}

	
}
