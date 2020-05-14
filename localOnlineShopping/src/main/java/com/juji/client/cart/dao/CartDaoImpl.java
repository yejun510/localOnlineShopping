package com.juji.client.cart.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.juji.client.cart.vo.CartVO;

@Repository
public class CartDaoImpl implements CartDao{
		
		@Inject
		private SqlSession sqlsession;
		
		// 1. 장바구니넣기
		@Override
		public void cartInsert(CartVO cvo) {
			sqlsession.insert("cartInsert",cvo);
			
		}
		
		// 2. 장바구니 리스트 출력
		@Override
		public List<CartVO> cartList(String iD) {
			return sqlsession.selectList("cartList",iD);
			
		}
		
		// 3. 선택 장바구니 삭제
		@Override
		public void deleteCart(CartVO cvo) {
			sqlsession.delete("deleteCart",cvo);
		}
		
		// 4. 장바구니 내의 상품의 총 가격
		@Override
		public int sumMoney(String iD) {
			return sqlsession.selectOne("sumMoney",iD);
		}
		
		// 5. 기존 장바구니 내의 상품 카운트
		@Override
		public int countCart(CartVO cvo) {
			
			return sqlsession.selectOne("countCart",cvo);
		}
		
		// 6. 추가하려는 상품이 기존 장바구니 내에 존재할 경우 수량 올림
		@Override
		public void updateCart(CartVO cvo) {
			sqlsession.update("sumCart",cvo);
		}

		// 7. 구매한 상품 장바구니에서 삭제
		@Override
		public void deleteCartList(String id) {
			sqlsession.delete("deleteCartList",id);
		}

		@Override
		public List<CartVO> cartSelectList(String[] seqArray) {
			return sqlsession.selectList("cartSelectList",seqArray);
		}

		@Override
		public void selectDelete(String[] seqArray) {
			sqlsession.delete("selectDelete",seqArray);
		}

}
