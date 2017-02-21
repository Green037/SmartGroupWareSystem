package com.cafe24.smart.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.member.dao.MemberDAO;
import com.cafe24.smart.member.domain.Achieve;
import com.cafe24.smart.member.domain.License;

@Service
public class MemberService {
	
	private static final Logger log = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	private MemberDAO memberDao;
	private Achieve achieve;
	private License license;
	
	//사원 등록
//	public int mmAddServ(Member member) {
//		
//		return memberDao.insertMm(member);
//		
//	}
	//학력 조회
	public List<Achieve> acListServ() {
		 List<Achieve> a = memberDao.selectAc();
		 	System.out.println("ac리스트 서비스까지"+a.size());
			
		 	return memberDao.selectAc();
	}
	//자격증 조회
	public List<License> lcListServ() {
		List<License> b = memberDao.selectLc();
			System.out.println("lc리스트 서비스까지"+b.size());
		return memberDao.selectLc();
		
	}
}