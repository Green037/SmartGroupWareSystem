package com.cafe24.smart.payment.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.payment.domain.PayContent;

@Service
public interface PaymentService {
	List<PayContent>			paListServ();
	
	Member 						pcMmContentServ(int mmCode);
	
	int							pcAddServ(PayContent payContent);
}