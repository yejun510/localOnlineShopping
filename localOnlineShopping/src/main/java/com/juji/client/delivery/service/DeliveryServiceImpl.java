package com.juji.client.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.client.delivery.dao.DeliveryDao;
import com.juji.client.delivery.vo.DeliveryVO;

@Service
@Transactional
public class DeliveryServiceImpl implements DeliveryService {

	@Autowired
	DeliveryDao dao;
	
	@Override
	public List<DeliveryVO> listDelivery(DeliveryVO dvo) {
		
		return dao.listDelivery(dvo);
	}
	
	@Override
	public void deleteDelivery(int o_serialnum) {
		dao.deleteDelivery(o_serialnum);
	}

	@Override
	public void buyDelivery(DeliveryVO dvo) {
		dao.buyDelivery(dvo);
	}
	@Override
	public void insertDelivery(DeliveryVO dvo) {
		dao.insertDelivery(dvo);
	}

	@Override
	public List<DeliveryVO> confirmList(DeliveryVO dvo) {
		return dao.confirmList(dvo);
	}

	@Override
	public int listCnt(String id) {
		return dao.listCnt(id);
	}

	@Override
	public int confirmCnt(String id) {
		return dao.confirmCnt(id);
	}

}
