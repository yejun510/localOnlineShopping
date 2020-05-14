package com.juji.client.cart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.client.cart.dao.CartDao;
import com.juji.client.cart.vo.CartVO;

@Service
@Transactional
public class CartServiceImpl implements CartService {
	@Inject
	private CartDao cartDao;
	
	// 1. 장바구니 추가
	@Override
	public void insertCart(CartVO cvo) {
		cartDao.cartInsert(cvo);
	}
	
	// 2. 장바구니 목록
	@Override
	public List<CartVO>cartList(String ID){
		return cartDao.cartList(ID);
	}

	// 3. 장바구니 삭제
	@Override
	public void deleteCart(CartVO cvo) {
		cartDao.deleteCart(cvo);
		
	}
	// 4. 장바구니 금액 합계
	@Override
	public int sumMoney(String ID) {
		
		return cartDao.sumMoney(ID);
	}
	// 5. 장바구니 상품 확인
	@Override
	public int countCart(CartVO cvo) {
		return cartDao.countCart(cvo);
	}
	// 6. 장바구니 상품 수량 변경
	@Override
	public void updateCart(CartVO cvo) {
		cartDao.updateCart(cvo);
		
	}

	@Override
	public void deleteCartList(String id) {
		cartDao.deleteCartList(id);
		
	}

	@Override
	public List<CartVO> cartSelectList(String[] seqArray) {
		return cartDao.cartSelectList(seqArray);
	}

	@Override
	public void selectDelete(String[] seqArray) {
		cartDao.selectDelete(seqArray);
	}

	
}