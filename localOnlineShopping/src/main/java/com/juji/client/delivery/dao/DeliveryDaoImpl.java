package com.juji.client.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.juji.client.delivery.vo.DeliveryVO;

public class DeliveryDaoImpl implements DeliveryDao {
	@Autowired
	SqlSession session;

	@Override
	public List<DeliveryVO> listDelivery(DeliveryVO dvo) {
		return session.selectList("listDelivery",dvo);
	}

	@Override
	public void deleteDelivery(int o_serialnum) {
		session.update("deleteDelivery",o_serialnum);
	}
	
	@Override
	public void buyDelivery(DeliveryVO dvo) {
		session.update("buyDelivery",dvo);
	}
	@Override
	public void insertDelivery(DeliveryVO dvo) {
		 session.insert("insertDelivery", dvo);
	}

	@Override
	public List<DeliveryVO> confirmList(DeliveryVO dvo) {
		return session.selectList("confirmList",dvo);
	}

	@Override
	public int listCnt(String id) {
		return session.selectOne("listCnt",id);
	}

	@Override
	public int confirmCnt(String id) {
		return session.selectOne("confirmCnt",id);
	}

}
