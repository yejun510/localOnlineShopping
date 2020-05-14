package com.juji.admin.delivery.dao;

import java.util.List;
import java.util.Map;

import com.juji.client.delivery.vo.DeliveryVO;

public interface AdminDeliveryDao {

	public List<DeliveryVO> deliveryList(DeliveryVO dvo);
	public int deliveryListCnt(DeliveryVO dvo);
	public DeliveryVO deliveryDetail(DeliveryVO dvo);
	public int deliveryUpdate(DeliveryVO dvo);
	public List<DeliveryVO> statusSelect(DeliveryVO dvo);
	public int statusTotal(DeliveryVO dvo);
	public Map<String, Integer> total_sales(DeliveryVO dvo);

}
