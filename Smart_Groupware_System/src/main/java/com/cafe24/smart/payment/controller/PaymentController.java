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
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.smart.insurance.service.InsuranceService;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.payment.domain.Pay;
import com.cafe24.smart.payment.domain.PayContent;
import com.cafe24.smart.payment.service.PaymentService;
import com.cafe24.smart.util.UtilDate;

@Controller
public class PaymentController {
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	InsuranceService insuranceService;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	HttpSession session;
	
	
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

//	총무부 > 급여내역 추가 (get)
	@RequestMapping(value = "pa/add", method = RequestMethod.GET)
	public String paAddFormCtrl(Model model) {	
	
		UtilDate utilDate = new UtilDate();
		
		int year = Integer.parseInt(utilDate.getCurrentYear());
		int paMmCode = (int) session.getAttribute("id");
		
		model.addAttribute("eiContent", insuranceService.eiContentServ(year));
		model.addAttribute("nhiContent", insuranceService.nhiContentServ(year));
		model.addAttribute("ppContent", insuranceService.ppContentServ(year));
		model.addAttribute("paMmCode", paMmCode);
		model.addAttribute("paymentDate", utilDate.getPaymentDate());
		
		System.out.println("PaymentController paAddCtrl attribute model : " + model);
		
		return "payment/pa_add";
	}
	
//	총무부 > 급여내역 추가 (post)
	@RequestMapping(value = "pa/add", method = RequestMethod.POST)
//	required : false면 해당 파라미터를 반드시 받지 않아도 됨
	public String paAddProCtrl(PayContent payContent) {	
		
		System.out.println("PaymentController paAddProCtrl payContent : " + payContent);
		
//		System.out.println("PaymentController paAddProCtrl payContent : " + payContent);
//		System.out.println("PaymentController paAddProCtrl pay : " + pay);
		
		return "payment/pa_add";
	}
}