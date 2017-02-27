package com.cafe24.smart.insurance.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.insurance.domain.EmployeementInsurance;
import com.cafe24.smart.insurance.domain.NationalHealthInsurance;
import com.cafe24.smart.insurance.domain.OccupationalHealthSafetyInsurance;
import com.cafe24.smart.insurance.domain.PensionInsurance;

@Repository
public class InsuranceDAOImpl implements InsuranceDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
//	select one EmployeementInsurance by year
	@Override
	public EmployeementInsurance selectByEi(int eiYear) {
		
		System.out.println("InsuranceDAOImpl selectByEi eiYear : " + eiYear);
		
		EmployeementInsurance employeementInsurance = sqlSession.selectOne("InDAO.selectByEi", eiYear);
		
		System.out.println("InsuranceDAOImpl selectByEi employeementInsurance : " + employeementInsurance);
		
		return employeementInsurance;
	}

//	select one NationalHealthInsurance by year
	@Override
	public NationalHealthInsurance selectByNhi(int nhiYear) {
		
		System.out.println("InsuranceDAOImpl selectByNhi nhiYear : " + nhiYear);
		
		NationalHealthInsurance nationalHealthInsurance = sqlSession.selectOne("InDAO.selectByNhi", nhiYear);
		
		System.out.println("InsuranceDAOImpl selectByNhi nationalHealthInsurance : " + nationalHealthInsurance);
		
		return nationalHealthInsurance;
	}

//	select one OccupationalHealthSafetyInsurance by year
	@Override
	public OccupationalHealthSafetyInsurance selectByOhi(int ohiYear) {
		
		System.out.println("InsuranceDAOImpl selectByOhi ohiYear : " + ohiYear);
		
		OccupationalHealthSafetyInsurance occupationalHealthSafetyInsurance = sqlSession.selectOne("InDAO.selectByOhi", ohiYear);
		
		System.out.println("InsuranceDAOImpl selectByOhi occupationalHealthSafetyInsurance : " + occupationalHealthSafetyInsurance);
		
		return occupationalHealthSafetyInsurance;
	}

//	select one PensionInsurance by year
	@Override
	public PensionInsurance selectByPp(int ppYear) {
		
		System.out.println("InsuranceDAOImpl selectByPp ppYear : " + ppYear);
		
		PensionInsurance pensionInsurance = sqlSession.selectOne("InDAO.selectByPp", ppYear);
		
		System.out.println("InsuranceDAOImpl selectByPp pensionInsurance : " + pensionInsurance);
		
		return pensionInsurance;
	}
}