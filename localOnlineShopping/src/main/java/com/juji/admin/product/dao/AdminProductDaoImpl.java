package com.juji.admin.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.juji.client.product.vo.ProductVO;

@Repository
public class AdminProductDaoImpl implements AdminProductDao {

	@Autowired
	private SqlSession session;

	// 상품목록 구현
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		return session.selectList("productList", pvo);
	}
	
	// 전체 레코드 건수 구현
	@Override
	public int productListCnt(ProductVO pvo) {
		return (Integer)session.selectOne("productListCnt");
	}

	// 상품등록 구현
	@Override
	public int productRegist(ProductVO pvo) {
		return session.insert("productRegist", pvo);
	}

	// 상품상세 구현
	@Override
	public ProductVO productDetail(ProductVO pvo) {
		return (ProductVO) session.selectOne("productDetail", pvo);
	}

	// 상품정보 수정 구현
	@Override
	public int productUpdate(ProductVO pvo) {
		return session.update("productUpdate", pvo);
	}

	// 상품삭제 구현
	@Override
	public int productDelete(String p_name) {
		return session.delete("productDelete", p_name);
	}

}
