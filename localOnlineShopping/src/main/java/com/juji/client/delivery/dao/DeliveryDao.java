package com.juji.client.delivery.dao;

import java.util.List;

import com.juji.client.delivery.vo.DeliveryVO;

public interface DeliveryDao {
	public List<DeliveryVO> listDelivery(String id);
}
