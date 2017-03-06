package com.cafe24.smart.member.service;

import java.util.List;
import java.util.Map;

import com.cafe24.smart.member.domain.Achieve;
import com.cafe24.smart.member.domain.Career;
import com.cafe24.smart.member.domain.Contract;
import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.domain.License;
import com.cafe24.smart.member.domain.MajorTypeOfBusiness;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.domain.MemberAchieve;
import com.cafe24.smart.member.domain.MemberLicense;
import com.cafe24.smart.member.domain.MinorTypeOfBusiness;
import com.cafe24.smart.member.domain.Position;

public interface MemberService {
	// 사원정보, 사원학력,경력사항,자격증 등록
	int mmAddServ(Member member,MemberAchieve memberAchieve,MemberLicense memberLicense,Career career); 
	
	// 사원조회 리스트
	Map<String, Object> mmListServ(int currnetPage);
	
	
	
	
	
	
	
	
	
	
	
	
	
	// DB에서 정보 불러오기
	List<Achieve> acListServ(); //학력테이블
	List<License> lcListServ(); // 자격증 테이블
	List<Contract> CtListServ();// 계약 테이블
	List<Position> PtListServ();// 직급 테이블
	List<Department>  DpListServ();// 부서 테이블
	List<MajorTypeOfBusiness> maListServ(); //상위업종
	List<MinorTypeOfBusiness> miListServ(); // 하위업종
}

