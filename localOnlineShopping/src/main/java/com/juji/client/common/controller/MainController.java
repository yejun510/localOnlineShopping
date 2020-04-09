package com.juji.client.common.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/")
public class MainController {

	@RequestMapping(value = "agreement/agreementInfo", method = RequestMethod.GET)
	public String agreement() {
		return "agreement/agreementInfo";
	}
	
	@RequestMapping(value = "privacy/privacyInfo", method = RequestMethod.GET)
	public String privacy() {
		return "privacy/privacyInfo";
	}
	
	@RequestMapping(value = "refund/refundInfo", method = RequestMethod.GET)
	public String refund() {
		return "refund/refundInfo";
	}
}
