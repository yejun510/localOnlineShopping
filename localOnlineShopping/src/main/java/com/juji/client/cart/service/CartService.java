package com.juji.client.cart.service;

import java.util.List;

import com.juji.client.cart.vo.CartVO;

public interface CartService {
	
	
	void insertCart(CartVO cvo);
	List<CartVO> cartList(String id);
	int countCart(CartVO cvo);
	int sumMoney(String id);
	void deleteCart(CartVO cvo);
	void updateCart(CartVO cvo);
	void deleteCartList(String id);
	public void selectDelete(String[] seqArray);
	List<CartVO> cartSelectList(String[] seqArray);





	
}
