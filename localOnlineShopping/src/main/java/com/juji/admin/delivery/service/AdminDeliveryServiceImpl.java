package com.juji.admin.delivery.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.juji.admin.delivery.dao.AdminDeliveryDao;
import com.juji.client.common.page.Paging;
import com.juji.client.delivery.vo.DeliveryVO;

@Service
@Transactional
public class AdminDeliveryServiceImpl implements AdminDeliveryService {

	@Autowired
	private AdminDeliveryDao adminDeliveryDao;

	@Override
	public List<DeliveryVO> deliveryList(DeliveryVO dvo) {
		List<DeliveryVO> aList = null;

		// 페이지 세팅
		Paging.setPage(dvo);

		
		// 정렬에 대한 기본값 설정
		if (dvo.getOrder_by() == null)
			dvo.setOrder_by("o_serialnum");
		if (dvo.getOrder_sc() == null)
			dvo.setOrder_sc("DESC");

		if (!dvo.getKeyword().equals("")) {
			dvo.setStart_date("");
			dvo.setEnd_date("");
		}
		aList = adminDeliveryDao.deliveryList(dvo);
		return aList;
	}

	@Override
	public int deliveryListCnt(DeliveryVO dvo) {
		return adminDeliveryDao.deliveryListCnt(dvo);
	}

	// 상세 주문정보 구현
	@Override
	public DeliveryVO deliveryDetail(DeliveryVO dvo) {
		DeliveryVO detail = null;
		detail = adminDeliveryDao.deliveryDetail(dvo);
		return detail;
	}

	// 주문정보 수정 구현
	@Override
	public int deliveryUpdate(DeliveryVO dvo) {
		int result = 0;
		try {
			result = adminDeliveryDao.deliveryUpdate(dvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public List<DeliveryVO> statusSelect(DeliveryVO dvo) {
		return adminDeliveryDao.statusSelect(dvo);
	}

	@Override
	public int statusTotal(DeliveryVO dvo) {
		return adminDeliveryDao.statusTotal(dvo);
	}

	@Override
	public Map<String,Integer> total_sales(DeliveryVO dvo) {
		return adminDeliveryDao.total_sales(dvo);
	}

}
