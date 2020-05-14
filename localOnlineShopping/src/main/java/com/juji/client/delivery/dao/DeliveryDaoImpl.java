package com.juji.client.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.juji.client.delivery.vo.DeliveryVO;

public class DeliveryDaoImpl implements DeliveryDao {
	@Autowired
	SqlSession session;

	@Override
	public List<DeliveryVO> listDelivery(String id) {
		return session.selectList("listDelivery",id);
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

}
