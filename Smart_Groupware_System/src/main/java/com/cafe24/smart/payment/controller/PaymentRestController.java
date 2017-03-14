package com.cafe24.smart.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.payment.service.PaymentService;

@RestController
public class PaymentRestController {
	private static final Logger log = LoggerFactory.getLogger(PaymentRestController.class);
	
	@Autowired
	PaymentService paymentService;
	
//	총무부 > 급여내역 추가 > 사원코드 검색 > 특정 사원 정보 select
	@RequestMapping(value = "pc/mmContent", method = RequestMethod.POST)
	public Member paMmContentCtrl(@RequestParam(value="mmCode", required=false) int mmCode) {
			
		System.out.println("PaymentController paMmContentCtrl mmCode : " + mmCode);
		
		Member member = paymentService.pcMmContentServ(mmCode);
		
		System.out.println("PaymentController paMmContentCtrl member : " + member);
		
		return member;
	}
}