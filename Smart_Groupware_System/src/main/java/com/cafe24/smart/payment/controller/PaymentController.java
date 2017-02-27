package com.cafe24.smart.payment.controller;


import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.smart.insurance.service.InsuranceService;

@Controller
public class PaymentController {
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	InsuranceService insuranceService;
	
	@RequestMapping(value = "pc/list", method = RequestMethod.GET)
	public String pcListCtrl() {
						
		return "payment/pc_list";
	}
	
	@RequestMapping(value = "pa/list", method = RequestMethod.GET)
	public String paListCtrl() {
						
		return "payment/pa_list";
	}
	
	@RequestMapping(value = "pc/content", method = RequestMethod.GET)
	public String pcContentCtrl() {
						
		return "payment/pc_content";
	}
	
	@RequestMapping(value = "pa/add", method = RequestMethod.GET)
	public String paAddCtrl(Model model) {	
		
		Calendar calendar = Calendar.getInstance();
		
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		
		model.addAttribute("eiContent", insuranceService.eiContentServ(year));
		model.addAttribute("nhiContent", insuranceService.nhiContentServ(year));
		model.addAttribute("ppContent", insuranceService.ppContentServ(year));
		model.addAttribute("month", month);
		
		System.out.println("PaymentController paAddCtrl model : " + model);
		System.out.println("PaymentController paAddCtrl month : " + month);
		
		return "payment/pa_add";
	}
}