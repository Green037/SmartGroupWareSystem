package com.cafe24.smart.payment.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.member.dao.MemberDAO;
import com.cafe24.smart.member.domain.Member;

@Service
public class PaymentServiceImpl implements PaymentService {
	private static final Logger log = Logger.getLogger(PaymentServiceImpl.class);

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public Member pcMmContentServ(int mmCode) {
	
		System.out.println("PaymentServiceImpl pcMmContentCtrl mmCode : " + mmCode);
		
		return memberDAO.selectByMm(mmCode);
	}
}