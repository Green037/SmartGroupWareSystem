package com.cafe24.smart.insurance.dao;

import com.cafe24.smart.insurance.domain.EmployeementInsurance;
import com.cafe24.smart.insurance.domain.NationalHealthInsurance;
import com.cafe24.smart.insurance.domain.OccupationalHealthSafetyInsurance;
import com.cafe24.smart.insurance.domain.PensionInsurance;

public interface InsuranceDAO {
	EmployeementInsurance 					selectByEi(int eiYear);
	NationalHealthInsurance 				selectByNhi(int nhiYear);
	OccupationalHealthSafetyInsurance 		selectByOhi(int ohiYear);
	PensionInsurance 						selectByPp(int ppYear);
}