package com.cafe24.smart.payment.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.member.dao.MemberDAO;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.payment.dao.PaymentDAO;
import com.cafe24.smart.payment.domain.PayContent;
import com.cafe24.smart.util.SearchCriteria;

@Service
public class PaymentServiceImpl implements PaymentService {
	private static final Logger log = Logger.getLogger(PaymentServiceImpl.class);

	@Autowired
	PaymentDAO paymentDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public PaymentDAO getPaymentDAO() {
		
		return paymentDAO;
	}
	
//	총무부 > 총급여목록
	@Override
	public List<PayContent> paListAllServ(int offset, int recordsPerPage) {
		
		System.out.println("PaymentServiceImpl paListAllServ offset : " + offset);
		System.out.println("PaymentServiceImpl paListAllServ recordsPerPage : " + recordsPerPage);
		
		return paymentDAO.selectAllPc(offset, recordsPerPage);
	}
	
//	총무부 > 총급여목록 (검색 있는 경우
	@Override
	public List<PayContent> paListAllSearchServ(int offset, int recordsPerPage, SearchCriteria cri) {
		
		System.out.println("PaymentServiceImpl paListAllServ offset : " + offset);
		System.out.println("PaymentServiceImpl paListAllServ recordsPerPage : " + recordsPerPage);
		System.out.println("PaymentServiceImpl paListAllServ cri : " + cri);
		
		return paymentDAO.selectAllSearchPc(offset, recordsPerPage, cri);
	}
	
//	연간급여내역조회
	@Override
	public List<PayContent> paListServ(int mmCode, String startDate, String endDate) {
		
		System.out.println("PaymentServiceImpl paListServ mmCode : " + mmCode + ", startDate : " + 
				", endDate : " + endDate);
		
		return paymentDAO.selectPa(mmCode, startDate, endDate);
	}
	
	@Override
	public PayContent paContentServ(int mmCode, String pcDate) {
		
		System.out.println("PaymentServiceImpl paContentServ mmCode : " + mmCode + ", pcDate : " + pcDate);
		
		return paymentDAO.selectByPc(mmCode, pcDate);
	}
	
//	직전 select 쿼리의 갯수 받아오기
	@Override
	public int reCountAllServ() {
		
		return paymentDAO.selectAllCountRe();
	}	
	
//	총무부 > 총급여목록 > 특정 급여 조회
	@Override
	public PayContent paContentPcCodeServ(int pcCode) {

		System.out.println("PaymentServiceImpl paContentPcCodeServ pcCode : " + pcCode);
		
		return paymentDAO.selectByPcCodePc(pcCode);
	}
	
//	월급여조회(사원)
	@Override
	public Member pcMmContentServ(int mmCode) {
	
		System.out.println("PaymentServiceImpl pcMmContentCtrl mmCode : " + mmCode);
		
		return memberDAO.selectByMm(mmCode);
	}

//	총무부 > 급여추가
	@Override
	public int pcAddServ(PayContent payContent) {
		
		System.out.println("PaymentServiceImpl pcAddServ payContent : " + payContent);
		
		return paymentDAO.insertPc(payContent);
	}

//	총무부 > 급여 수정
	@Override
	public void paUpdateServ(PayContent payContent) {
		
		System.out.println("PaymentServiceImpl paUpdateServ payContent : " + payContent);
		
		paymentDAO.updatePc(payContent);
	}
}