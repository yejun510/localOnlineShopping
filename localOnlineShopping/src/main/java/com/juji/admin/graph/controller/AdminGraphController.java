package com.juji.admin.graph.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.juji.admin.delivery.service.AdminDeliveryService;
import com.juji.client.delivery.vo.DeliveryVO;


@Controller
@RequestMapping(value = "/admin")
public class AdminGraphController {
	private Logger log = LoggerFactory.getLogger(AdminGraphController.class);
	
	@Autowired
	private AdminDeliveryService adminDeliveryService;
	
	@RequestMapping(value = "/graph/monthGraph.do", method = RequestMethod.GET)
	public String monthGraph(@ModelAttribute DeliveryVO dvo, Model model,HttpServletRequest req) {
		log.info("admin monthGraph 호출 성공");
		Map<String, Integer> total = null;
		if(req.getParameter("schMonth") != null && req.getParameter("schMonth").length() != 0) {
			dvo.setO_date(req.getParameter("schMonth"));
			System.out.println(dvo.getO_date());
			total = adminDeliveryService.total_sales(dvo);
			
		}
		System.out.println("달       "+req.getParameter("schMonth"));
		
		
		
		model.addAttribute("graph", total);
		model.addAttribute("month",req.getParameter("schMonth"));
		return "admin/graph/monthGraph";
	}

}
