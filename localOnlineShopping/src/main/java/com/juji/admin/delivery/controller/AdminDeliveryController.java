package com.juji.admin.delivery.controller;

import java.io.IOException;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.juji.admin.delivery.service.AdminDeliveryService;
import com.juji.client.common.page.Paging;
import com.juji.client.common.util.Util;
import com.juji.client.delivery.vo.DeliveryVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminDeliveryController {
	private Logger log = LoggerFactory.getLogger(AdminDeliveryController.class);

	@Autowired
	private AdminDeliveryService adminDeliveryService;

	// 주문목록 구현하기
	@RequestMapping(value = "/delivery/deliveryList.do", method = RequestMethod.GET)
	public String deliveryList(@ModelAttribute DeliveryVO dvo, Model model) {
		log.info("admin deliveryList 호출 성공");

		// 페이징 세팅
		Paging.setPage(dvo);
		
		List<DeliveryVO> deliveryList = new ArrayList<DeliveryVO>();
		
		int total;
		
		if (dvo.getO_status() != null && !dvo.getO_status().equals("")) {
			total = adminDeliveryService.statusTotal(dvo);
			log.info("total = " + total);
			deliveryList = adminDeliveryService.statusSelect(dvo);
		} else {
			total = adminDeliveryService.deliveryListCnt(dvo);
			log.info("total = " + total);
			deliveryList = adminDeliveryService.deliveryList(dvo);
		}

		int count = total - (Util.nvl(dvo.getPage()) - 1) * Util.nvl(dvo.getPageSize());
		log.info("count = " + count);
		
		model.addAttribute("deliveryList", deliveryList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", dvo);

		return "admin/delivery/deliveryList";
	}

	// 주문상세보기 구현하기
	@RequestMapping(value = "/delivery/deliveryDetail.do", method = RequestMethod.GET)
	public String deliveryDetail(@ModelAttribute DeliveryVO dvo, Model model) {
		log.info("admin deliveryDetail 호출 성공");
		log.info("o_serialnum = " + dvo.getO_serialnum());

		DeliveryVO detail = new DeliveryVO();
		detail = adminDeliveryService.deliveryDetail(dvo);

		model.addAttribute("detail", detail);
		model.addAttribute("data", dvo);

		return "admin/delivery/deliveryDetail";
	}

	// 주문정보수정 구현
	@RequestMapping(value = "/delivery/deliveryupdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String deliveryUpdate(@ModelAttribute DeliveryVO dvo) throws IllegalStateException, IOException {
		log.info("deliveryUpdate 호출 성공");

		int result = 0;
		String url = "";

		result = adminDeliveryService.deliveryUpdate(dvo);

		if (result == 1) {
			url = "/admin/delivery/deliveryList.do";
		} else {
			url = "/admin/delivery/deliveryDetail.do?o_serialnum=" + dvo.getO_serialnum();
		}
		return "redirect:" + url;
	}

}
