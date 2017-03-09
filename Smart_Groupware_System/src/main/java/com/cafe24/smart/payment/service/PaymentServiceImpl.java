package com.cafe24.smart.payment.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.member.dao.MemberDAO;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.payment.dao.PaymentDAO;
import com.cafe24.smart.payment.domain.PayContent;

@Service
public class PaymentServiceImpl implements PaymentService {
	private static final Logger log = Logger.getLogger(PaymentServiceImpl.class);

	@Autowired
	PaymentDAO paymentDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public List<PayContent> paListServ() {
		
		System.out.println("PaymentServiceImpl paListServ is called ...");
		
		return null;
	}
	
	@Override
	public Member pcMmContentServ(int mmCode) {
	
		System.out.println("PaymentServiceImpl pcMmContentCtrl mmCode : " + mmCode);
		
		return memberDAO.selectByMm(mmCode);
	}

	@Override
	public int pcAddServ(PayContent payContent) {
		
		System.out.println("PaymentServiceImpl pcAddServ payContent : " + payContent);
		
		return paymentDAO.insertPc(payContent);
	}
}