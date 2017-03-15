package com.cafe24.smart.payment.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cafe24.smart.payment.domain.PayContent;

@Repository
public interface PaymentDAO {
	List<PayContent>		selectAllPc();
	List<PayContent>		selectPa(int mmCode, String startDate, String endDate);
	
	PayContent		 		selectByPc(int mmCode, String pcDate);
	
	int 					selectAllCountRe();
	int						insertPc(PayContent payContent);
	
	void					updatePc(PayContent payContent);
}