package com.cafe24.smart.reward.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.service.MemberService;
import com.cafe24.smart.payment.service.PaymentService;
import com.cafe24.smart.reward.service.IncentiveService;
import com.cafe24.smart.reward.service.RewardService;

@RestController
public class RewardRestController {

	private static final Logger log = LoggerFactory.getLogger(RewardRestController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	IncentiveService incentiveService;
	
	@Autowired
	RewardService rewardService;
	
	@Autowired
	HttpSession session;
	
//	인사부 > 고과내역 삭제시 유효성검사 후 삭제 (비밀번호 한 번 더 입력하여 비교 후 삭제)
	@RequestMapping(value = "re/mmContent", method = RequestMethod.POST)
	public boolean reMmContentCtrl(@RequestParam(value="memberData", required=true) String memberData,
									@RequestParam(value="reCode", required=true) int reCode) {
			
		log.debug("PaymentController reMmContentCtrl memberData : " + memberData);
		
		int id = (int) session.getAttribute("mmCode");
		
		log.debug("PaymentController reMmContentCtrl id : " + id);
		
		Member member = paymentService.pcMmContentServ(id);
		
		log.debug("PaymentController reMmContentCtrl member : " + member);
	
		if (member.getMmPassword().equals(memberData)) {
			rewardService.reRemoveServ(reCode);
			incentiveService.inRemoveServ(reCode);
			
			return true;
		}
		
		return false;
	}
}