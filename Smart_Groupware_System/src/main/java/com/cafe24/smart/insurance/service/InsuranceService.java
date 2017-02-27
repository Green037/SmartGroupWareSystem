package com.cafe24.smart.insurance.service;

import com.cafe24.smart.insurance.domain.EmployeementInsurance;
import com.cafe24.smart.insurance.domain.NationalHealthInsurance;
import com.cafe24.smart.insurance.domain.OccupationalHealthSafetyInsurance;
import com.cafe24.smart.insurance.domain.PensionInsurance;

public interface InsuranceService {
	EmployeementInsurance 					eiContentServ(int eiYear);
	NationalHealthInsurance 				nhiContentServ(int nhiYear);
	OccupationalHealthSafetyInsurance 		ohiContentServ(int ohiYear);
	PensionInsurance					 	ppContentServ(int ppYear);
}