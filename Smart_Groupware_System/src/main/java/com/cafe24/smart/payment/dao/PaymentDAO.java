package com.cafe24.smart.payment.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cafe24.smart.payment.domain.PayContent;

@Repository
public interface PaymentDAO {
	List<PayContent>		selectAllPa();
	
	int						selectByPc(int mmCode, String reDate);
	
	int						insertPc(PayContent payContent);
}