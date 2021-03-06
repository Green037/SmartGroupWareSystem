package com.cafe24.smart.insurance.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.insurance.dao.InsuranceDAO;
import com.cafe24.smart.insurance.domain.EmployeementInsurance;
import com.cafe24.smart.insurance.domain.NationalHealthInsurance;
import com.cafe24.smart.insurance.domain.OccupationalHealthSafetyInsurance;
import com.cafe24.smart.insurance.domain.PensionInsurance;

@Service
public class InsuranServiceImpl implements InsuranceService {
	private static final Logger log = Logger.getLogger(InsuranServiceImpl.class);

	@Autowired
	InsuranceDAO insuranceDAO;
	
	@Override
	public EmployeementInsurance eiContentServ(int eiYear) {
		
		log.debug("InsuranServiceImpl eiContentServ eiYear : " + eiYear);
		
		return insuranceDAO.selectByEi(eiYear);
	}

	@Override
	public NationalHealthInsurance nhiContentServ(int nhiYear) {
		
		log.debug("InsuranServiceImpl nhiContentServ nhiYear : " + nhiYear);
		
		return insuranceDAO.selectByNhi(nhiYear);
	}

	@Override
	public OccupationalHealthSafetyInsurance ohiContentServ(int ohiYear) {
		
		log.debug("InsuranServiceImpl ohiContentServ ohiYear : " + ohiYear);
		
		return insuranceDAO.selectByOhi(ohiYear);
	}

	@Override
	public PensionInsurance ppContentServ(int ppYear) {
	
		log.debug("InsuranServiceImpl ppContentServ ppYear : " + ppYear);
		
		return insuranceDAO.selectByPp(ppYear);
	}
}