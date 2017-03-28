package com.cafe24.smart.insurance.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.insurance.domain.EmployeementInsurance;
import com.cafe24.smart.insurance.domain.NationalHealthInsurance;
import com.cafe24.smart.insurance.domain.OccupationalHealthSafetyInsurance;
import com.cafe24.smart.insurance.domain.PensionInsurance;

@Repository
public class InsuranceDAOImpl implements InsuranceDAO {
	
	private static final Logger log = LoggerFactory.getLogger(InsuranceDAOImpl.class);
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
//	select one EmployeementInsurance by year
	@Override
	public EmployeementInsurance selectByEi(int eiYear) {
		
		log.debug("InsuranceDAOImpl selectByEi eiYear : " + eiYear);
		
		EmployeementInsurance employeementInsurance = sqlSession.selectOne("InDAO.selectByEi", eiYear);
		
		log.debug("InsuranceDAOImpl selectByEi employeementInsurance : " + employeementInsurance);
		
		return employeementInsurance;
	}

//	select one NationalHealthInsurance by year
	@Override
	public NationalHealthInsurance selectByNhi(int nhiYear) {
		
		log.debug("InsuranceDAOImpl selectByNhi nhiYear : " + nhiYear);
		
		NationalHealthInsurance nationalHealthInsurance = sqlSession.selectOne("InDAO.selectByNhi", nhiYear);
		
		log.debug("InsuranceDAOImpl selectByNhi nationalHealthInsurance : " + nationalHealthInsurance);
		
		return nationalHealthInsurance;
	}

//	select one OccupationalHealthSafetyInsurance by year
	@Override
	public OccupationalHealthSafetyInsurance selectByOhi(int ohiYear) {
		
		log.debug("InsuranceDAOImpl selectByOhi ohiYear : " + ohiYear);
		
		OccupationalHealthSafetyInsurance occupationalHealthSafetyInsurance = sqlSession.selectOne("InDAO.selectByOhi", ohiYear);
		
		log.debug("InsuranceDAOImpl selectByOhi occupationalHealthSafetyInsurance : " + occupationalHealthSafetyInsurance);
		
		return occupationalHealthSafetyInsurance;
	}

//	select one PensionInsurance by year
	@Override
	public PensionInsurance selectByPp(int ppYear) {
		
		log.debug("InsuranceDAOImpl selectByPp ppYear : " + ppYear);
		
		PensionInsurance pensionInsurance = sqlSession.selectOne("InDAO.selectByPp", ppYear);
		
		log.debug("InsuranceDAOImpl selectByPp pensionInsurance : " + pensionInsurance);
		
		return pensionInsurance;
	}
}