package com.juji.client.delivery.service;

import java.util.List;

import com.juji.client.delivery.vo.DeliveryVO;

public interface DeliveryService {

	public List<DeliveryVO> listDelivery(String id);
}
