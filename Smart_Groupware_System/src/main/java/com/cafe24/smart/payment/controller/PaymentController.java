package com.cafe24.smart.payment.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.cafe24.smart.member.service.MemberService;
import com.cafe24.smart.payment.domain.PayContent;
import com.cafe24.smart.payment.domain.PaymentView;
import com.cafe24.smart.payment.service.PaymentService;
import com.cafe24.smart.util.Paging;
import com.cafe24.smart.util.UtilDate;
import com.cafe24.smart.util.UtilMember;

@Controller
public class PaymentController {
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	InsuranceService insuranceService;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	UtilDate utilDate = new UtilDate();
	UtilMember utilMember = new UtilMember();
	
//	총무부 > 총급여목록
	@RequestMapping(value = "pa/listAll", method = RequestMethod.GET)
	public String paListAllCtrl(Model model, HttpServletRequest request) {
		
		int currentPageNo = 1;
		int recordsPerPage = 0;
		String url = null;
		
		if (request.getParameter("pages") != null) {
			currentPageNo = Integer.parseInt(request.getParameter("pages"));
		}
		
		if (request.getParameter("lines") != null) {
			recordsPerPage = Integer.parseInt(request.getParameter("lines"));
		}
		
		System.out.println("PaymentController paListAllCtrl currentPageNo : " + currentPageNo);
		System.out.println("PaymentController paListAllCtrl recordsPerPage : " + recordsPerPage);
		
//		기본 recordsPerPage 설정
		Paging paging = new Paging(currentPageNo, recordsPerPage);
		
		int offset = (paging.getCurrentPageNo() - 1) * paging.getRecordsPerPage();    
		
		System.out.println("PaymentController paListAllCtrl offset : " + offset);
		
		List<PayContent> pcList = paymentService.paListAllServ(offset, paging.getRecordsPerPage());
		
		paging.setNumberOfRecords(paymentService.getPaymentDAO().selectAllCountRe());
		
		paging.makePaging();
		
		int	listCount = paymentService.reCountAllServ();
		
		System.out.println("PaymentController paListAllCtrl pcList : " + pcList);
		System.out.println("PaymentController paListAllCtrl listCount : " + listCount);
		
		List<PaymentView> paList = new ArrayList<PaymentView>();
		
//		총급여목록이 null이 아닌 경우
		if (pcList != null) {

			for (int i = 0; i < pcList.size(); i++) {
				PaymentView paView = new PaymentView();
				
				paView.setPcCode(pcList.get(i).getPcCode()) //급여상세코드
					   .setMmCode(pcList.get(i).getMmCode()) //사원코드
					   .setMmDailyPay(pcList.get(i).getMmDailyPay()) //일급
					   .setPaInsurance(pcList.get(i).getEiAmount()
					  		 		+ pcList.get(i).getNhiAmount()
					  		 		+ pcList.get(i).getPpAmount()) //보험총금액
					   .setPaIncentive(pcList.get(i).getInAmount()) //성과급
					   .setPaSalary(pcList.get(i).getMmDailyPay() + pcList.get(i).getInAmount()) //기본급
					   .setPaSumSalary(pcList.get(i).getInAmount() + pcList.get(i).getMmDailyPay()
							   			- (pcList.get(i).getEiAmount() + pcList.get(i).getNhiAmount()
							   					+ pcList.get(i).getPpAmount())) //실급여
					   .setPaCalculateDate(pcList.get(i).getPcDate().substring(0, 7) + "-20") //급여산정일
					   .setPaPossible(true) //급여지급여부
					   .setPaDate(pcList.get(i).getPcDate()) //급여지급일
					   .setPaMmCode(pcList.get(i).getPaMmCode()); //담당사원코드
				
				paList.add(paView);
				
				model.addAttribute("paging", paging);
				model.addAttribute("servletPath","pa/listAll");
			}
			
			model.addAttribute("paList", paList);
			
			System.out.println("PaymentController paListAllCtrl paList : " + paList);
			
		}
		
		return "payment/pa_listAll";
	}
	
//	연간 급여내역 조회
	@RequestMapping(value = "pc/list", method = RequestMethod.GET)
	public String pcListCtrl(Model model) {
		
		int mmCode = (int) session.getAttribute("mmCode");
		
		Member member = paymentService.pcMmContentServ(mmCode);
		
		List<PayContent> payList = 
				paymentService.paListServ(mmCode, utilDate.getCurrentYear() + "-01-01", utilDate.getLastDate());
		
		System.out.println("PaymentController pcListCtrl 12 - payListSize : " + (12 - payList.size()));
		System.out.println("PaymentController pcListCtrl member : " + member);
		System.out.println("PaymentController pcListCtrl payList : " + payList);
		
//		부서, 직급 정보
		model.addAttribute("dpName", utilMember.getDpName(member.getDpCode()));
		model.addAttribute("member", member);
		model.addAttribute("payList", payList);
		model.addAttribute("pcYear", utilDate.getCurrentYear());
		
		System.out.println("PaymentController pcListCtrl model : " + model);
		
		return "payment/pc_list";
	}

//	월급여 조회
	@RequestMapping(value = "pc/content", method = RequestMethod.GET)
	public String pcContentCtrl(Model model) {
		
		int mmCode = (int) session.getAttribute("mmCode");
		
		Member member = paymentService.pcMmContentServ(mmCode);
		PayContent pcList = paymentService.paContentServ(mmCode, utilDate.getPaymentDate());
		
		System.out.println("PaymentController pcContentCtrl mmCode : " + mmCode);
		System.out.println("PaymentController pcContentCtrl member : " + member);
		System.out.println("PaymentController pcContentCtrl pcList : " + pcList);
	
		model.addAttribute("member", member);
		model.addAttribute("payYear", utilDate.getCurrentYear());
		model.addAttribute("pcList", pcList);
//		월급날짜
		model.addAttribute("payDate", utilDate.getPaymentDate());
//		부서, 직급 정보
		model.addAttribute("dpName", utilMember.getDpName(member.getDpCode()));
		model.addAttribute("ptName", utilMember.getPtName(member.getPtCode()));
		
		System.out.println("PaymentController pcContentCtrl model toString : " + model.toString());
		
		return "payment/pc_content";
	}
	
//	총무부 > 총급여목록 > 특정 사원 월급여 조회
	@RequestMapping(value = "pc/mmContent", method = RequestMethod.GET)
	public String pcMmContentCtrl(@RequestParam(value="pcCode") int pcCode,
																	Model model) {
		
		PayContent payContent = paymentService.paContentPcCodeServ(pcCode);
		
		Member member = paymentService.pcMmContentServ(payContent.getMmCode());
		
		System.out.println("PaymentController pcMmContentCtrl member : " + member);
		System.out.println("PaymentController pcMmContentCtrl payContent : " + payContent);
	
		model.addAttribute("member", member);
		model.addAttribute("payYear", utilDate.getCurrentYear());
		model.addAttribute("pcList", payContent);
//		월급날짜
		model.addAttribute("payDate", utilDate.getPaymentDate());
//		부서, 직급 정보
		model.addAttribute("dpName", utilMember.getDpName(member.getDpCode()));
		model.addAttribute("ptName", utilMember.getPtName(member.getPtCode()));
		
		System.out.println("PaymentController pcContentCtrl model toString : " + model.toString());
		
		return "payment/pc_content";
	}

//	총무부 > 급여내역 추가 (get)
	@RequestMapping(value = "pa/add", method = RequestMethod.GET)
	public String paAddFormCtrl(Model model) {	
	
		int year = Integer.parseInt(utilDate.getCurrentYear());
		int paMmCode = (int) session.getAttribute("mmCode");
		
		model.addAttribute("eiContent", insuranceService.eiContentServ(year));
		model.addAttribute("nhiContent", insuranceService.nhiContentServ(year));
		model.addAttribute("ppContent", insuranceService.ppContentServ(year));
		model.addAttribute("ohiContent", insuranceService.ohiContentServ(year));
		model.addAttribute("paMmCode", paMmCode);
		model.addAttribute("paymentDate", utilDate.getPaymentDate());
		
		System.out.println("PaymentController paAddCtrl attribute model : " + model);
		
		return "payment/pa_add";
	}
	
//	총무부 > 급여내역 추가 (post)
	@RequestMapping(value = "pa/add", method = RequestMethod.POST)
	public String paAddProCtrl(PayContent payContent) {	
		
		System.out.println("PaymentController paAddProCtrl payContent : " + payContent);
		
		paymentService.pcAddServ(payContent);
		
		return "redirect:listAll";
	}
}