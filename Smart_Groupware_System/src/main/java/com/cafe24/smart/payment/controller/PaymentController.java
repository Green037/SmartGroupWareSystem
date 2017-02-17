package com.cafe24.smart.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PaymentController {
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	@RequestMapping(value = "pc/content", method = RequestMethod.GET)
	public String pcContentCtrl() {
						
		return "payment/pc_content";
	}
	
	@RequestMapping(value = "pc/list", method = RequestMethod.GET)
	public String pcListCtrl() {
						
		return "payment/pc_list";
	}
}