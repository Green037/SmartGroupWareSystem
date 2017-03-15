package com.cafe24.smart.payment.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.payment.dao.PaymentDAO;
import com.cafe24.smart.payment.domain.PayContent;

@Service
public interface PaymentService {
	List<PayContent>			paListAllServ(int offset, int recordsPerPage);
	List<PayContent>			paListServ(int mmCode, String startDate, String endDate);
	
	PayContent					paContentPcCodeServ(int pcCode);
	PayContent					paContentServ(int mmCode, String pcDate);
	
	PaymentDAO					getPaymentDAO();
	
	Member 						pcMmContentServ(int mmCode);
	
	int							pcAddServ(PayContent payContent);
	int							reCountAllServ();						
	
	void						paUpdateServ(PayContent payContent);
}