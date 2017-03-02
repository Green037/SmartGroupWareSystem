package com.cafe24.smart.payment.service;

import org.springframework.stereotype.Service;

import com.cafe24.smart.member.domain.Member;

@Service
public interface PaymentService {
	Member 						pcMmContentServ(int mmCode);
}