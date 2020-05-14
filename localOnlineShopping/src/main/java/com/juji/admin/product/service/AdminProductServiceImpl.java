package com.juji.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.admin.product.dao.AdminProductDao;
import com.juji.client.product.vo.ProductVO;

@Service
@Transactional
public class AdminProductServiceImpl implements AdminProductService {

	@Autowired
	private AdminProductDao adminProductDao;

	// 상품목록 구현
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> myList = null;

		// 정렬에 대한 기본값 설정
		if (pvo.getOrder_by() == null)
			pvo.setOrder_by("p_num");
		if (pvo.getOrder_sc() == null)
			pvo.setOrder_sc("DESC");

		myList = adminProductDao.productList(pvo);
		return myList;
	}

	// 전체 레코드 수 구현
	@Override
	public int productListCnt(ProductVO pvo) {
		return adminProductDao.productListCnt(pvo);
	}

	// 상품등록 구현
	@Override
	public int productRegist(ProductVO pvo) {
		int result = 0;
		try {
			result = adminProductDao.productRegist(pvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 상품상세 구현
	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail = null;
		detail = adminProductDao.productDetail(pvo);
		return detail;
	}

	// 상품정보 수정 구현
	@Override
	public int productUpdate(ProductVO pvo) {
		int result = 0;
		try {
			result = adminProductDao.productUpdate(pvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 상품 삭제 구현
	@Override
	public int productDelete(String p_name) {
		int result = 0;
		try {
			result = adminProductDao.productDelete(p_name);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
