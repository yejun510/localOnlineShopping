package com.juji.admin.delivery.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.juji.client.delivery.vo.DeliveryVO;

@Repository
public class AdminDeliveryDaoImpl implements AdminDeliveryDao{

	@Autowired
	private SqlSession session;
	
	// 주문목록 구현
	@Override
	public List<DeliveryVO> deliveryList(DeliveryVO dvo) {
		return session.selectList("deliveryList", dvo);
	}

	// 주문 상세보기 구현
	@Override
	public DeliveryVO deliveryDetail(DeliveryVO dvo) {
		return (DeliveryVO)session.selectOne("deliveryDetail", dvo);
	}
	
	// 주문목록 레코드수
	@Override
	public int deliveryListCnt(DeliveryVO dvo) {
		return (Integer)session.selectOne("deliveryListCnt");
	}

	// 주문정보 수정 구현
	@Override
	public int deliveryUpdate(DeliveryVO dvo) {
		return session.update("deliveryUpdate", dvo);
	}
	
	// 특정 주문진행상태 목록 구현
	@Override
	public List<DeliveryVO> statusSelect(DeliveryVO dvo){
		return session.selectList("statusSelect",dvo);
	}

	
	@Override
	public int statusTotal(DeliveryVO dvo) {
		return session.selectOne("statusTotal",dvo);
	}

	@Override
	public Map<String, Integer> total_sales(DeliveryVO dvo) {
		return session.selectMap("total_sales", "");
	}

}
