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
	
	@Override
	public EmployeementInsurance selectByEi(int eiYear) {
		
		System.out.println("InsuranceDAOImpl selectByEi eiYear : " + eiYear);
		
		EmployeementInsurance employeementInsurance = null;
		
		employeementInsurance = sqlSession.selectOne("InDAO.selectByEi", eiYear);
		
		if (employeementInsurance == null) {
			sqlSession.rollback();
		}
		
		return employeementInsurance;
	}

	@Override
	public NationalHealthInsurance selectByNhi(int nhiYear) {
		
		System.out.println("InsuranceDAOImpl selectByNhi nhiYear : " + nhiYear);
		
		NationalHealthInsurance nationalHealthInsurance = null;
		
		nationalHealthInsurance = sqlSession.selectOne("InDAO.selectByNhi", nhiYear);
		
		if (nationalHealthInsurance == null) {
			sqlSession.rollback();
		}
		
		return nationalHealthInsurance;
	}

	@Override
	public OccupationalHealthSafetyInsurance selectByOhi(int ohiYear) {
		
		System.out.println("InsuranceDAOImpl selectByOhi ohiYear : " + ohiYear);
		
		OccupationalHealthSafetyInsurance occupationalHealthSafetyInsurance = null;
		
		occupationalHealthSafetyInsurance = sqlSession.selectOne("InDAO.selectByOhi", ohiYear);
		
		if (occupationalHealthSafetyInsurance == null) {
			sqlSession.rollback();
		}
		
		return occupationalHealthSafetyInsurance;
	}

	@Override
	public PensionInsurance selectByPp(int ppYear) {
		
		System.out.println("InsuranceDAOImpl selectByPp ppYear : " + ppYear);
		
		PensionInsurance pensionInsurance = null;
		
		pensionInsurance = sqlSession.selectOne("InDAO.selectByPp", ppYear);
		
		if (pensionInsurance == null) {
			sqlSession.rollback();
		}
		
		return pensionInsurance;
	}
}