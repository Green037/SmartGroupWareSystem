package com.cafe24.smart.wbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.wbs.dao.WbsDAO;
import com.cafe24.smart.wbs.service.WbsService;

@Service
public class WbsServiceImpl implements WbsService {
	
	@Autowired
	private WbsDAO wbsDao;
	
	@Override
	public int checkMemberServ(Member member) {
		// 1.입력된 사원코드로 사원정보 조회하는 메서드 호출
		List<Member> memberList = wbsDao.selectByMmCodeMm(member);
		System.out.println("사원조회결과"+memberList);
		
		// 2.조회된 정보중 비밀번호 일치하는 사원정보 확인 로직.
		
		// 3.일치하는 사원정보의 사원코드리턴.
		return 0;
	}

}
