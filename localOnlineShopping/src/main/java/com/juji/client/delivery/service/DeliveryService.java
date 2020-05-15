package com.juji.client.delivery.service;

import java.util.List;

import com.juji.client.delivery.vo.DeliveryVO;

public interface DeliveryService {

	public List<DeliveryVO> listDelivery(DeliveryVO dvo);
	public void deleteDelivery(int o_serialnum);
	public void buyDelivery(DeliveryVO dvo);
	public void insertDelivery(DeliveryVO dvo);
	public List<DeliveryVO> confirmList(DeliveryVO dvo);
	public int listCnt(String id);
	public int confirmCnt(String id);
}
