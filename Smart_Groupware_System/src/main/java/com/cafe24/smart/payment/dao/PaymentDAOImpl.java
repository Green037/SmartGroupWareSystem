package com.cafe24.smart.payment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.payment.domain.PayContent;
import com.cafe24.smart.util.SearchCriteria;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	private static final Logger log = LoggerFactory.getLogger(PaymentDAOImpl.class);
	
	@Autowired
	SqlSessionTemplate sqlSession;

	int selectAllCountRe = 0;
	
//	인사팀 > 총급여목록
	@Override
	public List<PayContent> selectAllPc(int offset, int noOfRecord) {
		
		System.out.println("PaymentDAOImpl selectAllPc offset : " + offset);
		System.out.println("PaymentDAOImpl selectAllPc noOfRecord : " + noOfRecord);
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecord", noOfRecord);
		
		List<PayContent> pcList = sqlSession.selectList("PaDAO.selectAllPc", params);
		this.selectAllCountRe = sqlSession.selectOne("PaDAO.selectAllCountRe");
		
		System.out.println("PaymentDAOImpl selectAllPc pcList : " + pcList);
		System.out.println("PaymentDAOImpl selectAllPc selectAllCountRe : " + this.selectAllCountRe);
		
		return pcList;
	}
	
//	인사팀 > 총급여목록 검색 있는 경우
	@Override
	public List<PayContent> selectAllSearchPc(int offset, int noOfRecords, SearchCriteria cri) {
		
		System.out.println("PaymentDAOImpl selectAllPc offset : " + offset);
		System.out.println("PaymentDAOImpl selectAllPc noOfRecords : " + noOfRecords);
		System.out.println("PaymentDAOImpl selectAllPc cri : " + cri);
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("recordsPerPage", noOfRecords);
		params.put("cri", cri);
		
		List<PayContent> pcList = sqlSession.selectList("PaDAO.selectAllSearchPc", params);
		this.selectAllCountRe = sqlSession.selectOne("PaDAO.selectAllCountRe");
		
		System.out.println("PaymentDAOImpl selectAllPc pcList : " + pcList);
		System.out.println("PaymentDAOImpl selectAllPc selectAllCountRe : " + this.selectAllCountRe);
		
		return pcList;
	}
	
//	연간급여내역조회
	@Override
	public List<PayContent> selectPa(int mmCode, String startDate, String endDate) {
	
		System.out.println("PaymentDAOImpl selectPa mmCode : " + mmCode + ", startDate : " + startDate 
								+ ", endDate : " + endDate);
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("mmCode", mmCode);
		params.put("startDate", startDate);
		params.put("endDate", endDate);		
		
		return sqlSession.selectList("PaDAO.selectPc", params);
	}
	
//	월급여조회
	@Override
	public PayContent selectByPc(int mmCode, String pcDate) {
		
		System.out.println("PaymentDAOImpl selectByPc mmCode : " + mmCode);
		System.out.println("PaymentDAOImpl selectByPc pcDate : " + pcDate);
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("mmCode", mmCode);
		params.put("pcDate", pcDate);
		
		System.out.println("PaymentDAOImpl selectByPc params : " + params);
		
		return sqlSession.selectOne("PaDAO.selectByPc", params);
	}
	
//	총무부 > 총급여목록 > 특정 급여 조회
	@Override
	public PayContent selectByPcCodePc(int pcCode) {
		
		System.out.println("PaymentDAOImpl selectByPcCodePc pcCode : " + pcCode);		
		
		return sqlSession.selectOne("PaDAO.selectByPcCodePc", pcCode);
	}
	
//	이전 쿼리의 총 갯수 조회
	@Override
	public int selectAllCountRe() {
		
		return sqlSession.selectOne("PaDAO.selectAllCountRe");
	}
	
//	총무부 > 급여 추가
	@Override
	public int insertPc(PayContent payContent) {
		
		System.out.println("PaymentDAOImpl insertPc payContent : " + payContent);
		
		return sqlSession.insert("PaDAO.insertPc", payContent);
	}

//	총무부 > 급여 수정
	@Override
	public void updatePc(PayContent payContent) {
		
		System.out.println("PaymentDAOImpl updatePa payContent : " + payContent);
		
		sqlSession.update("PaDAO.updatePc", payContent);
	}
}