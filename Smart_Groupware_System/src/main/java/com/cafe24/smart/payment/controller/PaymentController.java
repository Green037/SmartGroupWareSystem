package com.cafe24.smart.payment.controller;

import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.smart.insurance.service.InsuranceService;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.payment.service.PaymentService;

@Controller
public class PaymentController {
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	InsuranceService insuranceService;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	HttpSession session;
	
	Calendar calendar;
	
//	연간 급여내역 조회
	@RequestMapping(value = "pc/list", method = RequestMethod.GET)
	public String pcListCtrl(Model model) {
					
//		List<PaymentView> paymentViewList = ;
		return "payment/pc_list";
	}
	
//	총무부 > 총급여 목록
	@RequestMapping(value = "pa/list", method = RequestMethod.GET)
	public String paListCtrl() {
						
		return "payment/pa_list";
	}
	
//	월급여 조회
	@RequestMapping(value = "pc/content", method = RequestMethod.GET)
	public String pcContentCtrl(Model model) {
		
		int mmCode = (int) session.getAttribute("id");
		
		Member member = paymentService.pcMmContentServ(mmCode);
		
		System.out.println("PaymentController pcContentCtrl mmCode : " + mmCode);
		System.out.println("PaymentController pcContentCtrl member : " + member);
	
		model.addAttribute("member", member);
		
		System.out.println("PaymentController pcContentCtrl model toString : " + model.toString());
		
		return "payment/pc_content";
	}

//	총무부 > 급여내역 추가
	@RequestMapping(value = "pa/add", method = RequestMethod.GET)
	public String paAddCtrl(Model model) {	
		
		calendar = Calendar.getInstance();
		
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		String paymentDate = year + "-" + month + "-25"; 
		
		model.addAttribute("eiContent", insuranceService.eiContentServ(year));
		model.addAttribute("nhiContent", insuranceService.nhiContentServ(year));
		model.addAttribute("ppContent", insuranceService.ppContentServ(year));
		model.addAttribute("paymentDate", paymentDate);
		
		System.out.println("PaymentController paAddCtrl attribute model : " + model);
		System.out.println("PaymentController paAddCtrl attribute paymentDate : " + paymentDate);
		
		return "payment/pa_add";
	}
}