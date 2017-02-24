package com.cafe24.smart.insurance.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.cafe24.smart.insurance.dao.InsuranceDAO;
import com.cafe24.smart.insurance.domain.PensionInsurance;

public class InsuranceService {
	private static final Logger log = LoggerFactory.getLogger(InsuranceService.class);
	
	@Autowired
	InsuranceDAO insuranceDAO;
	
	public PensionInsurance inListServ(int ppYear) {

		System.out.println("InsuranceService inListServ ppYear : " + ppYear);
		
		return null;
	}
	
}