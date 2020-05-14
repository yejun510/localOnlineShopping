package com.juji.client.cart.dao;

import java.util.List;

import com.juji.client.cart.vo.CartVO;

public interface CartDao {

	void cartInsert(CartVO cvo);

	List<CartVO> cartList(String iD);

	void deleteCart(CartVO cvo);

	int sumMoney(String iD);

	int countCart(CartVO cvo);

	void updateCart(CartVO cvo);
	
	void deleteCartList(String id);
	
	public void selectDelete(String[] seqArray);

	List<CartVO> cartSelectList(String[] seqArray);



	
}
