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
import com.cafe24.smart.member.domain.MemberContent;
import com.cafe24.smart.member.domain.MemberLicense;
import com.cafe24.smart.member.domain.MinorTypeOfBusiness;
import com.cafe24.smart.member.domain.Position;

public interface MemberService {
	// DB에서 정보 불러오기
	List<Achieve> acListServ(); //학력테이블
	List<License> lcListServ(); // 자격증 테이블
	List<Contract> ctListServ();// 계약 테이블
	List<Position> ptListServ();// 직급 테이블
	List<Department>  dpListServ();// 부서 테이블
	List<MajorTypeOfBusiness> maListServ(); //상위업종
	List<MinorTypeOfBusiness> miListServ(); // 하위업종
	
	// 사원조회 리스트
<<<<<<< HEAD
	Map<String, Object> mmListServ(int currnetPage);
	// 사원 로그인/ 사원로그인에 필요한 정보와 로그인 성공과 실패분기를 위해 map 타입으로 선언해준다
	Map<String, Object> mmLoginServ(Member member);
	// 개인사원정보조회
	MemberContent mmContentServ(MemberContent memberContent);
	Member mmContentServ(int mmCode);
	
	// 사원정보, 사원학력,경력사항,자격증 등록
	int mmAddServ(Member member,MemberAchieve memberAchieve,MemberLicense memberLicense,Career career);
}
=======
	
	
	
	// 사원 로그인/ 사원로그인에 필요한 정보와 로그인 성공과 실패분기를 위해 map 타입으로 선언해준다
	Map<String, Object> mmLoginServ(Member member);
	
	// 개인사원기본정보조회
	MemberContent mmContentServ(int mmCode);
	// 개인사원학력정보조회
	MemberContent mmContentMcServ(int mmCode);
	// 개인사원자격증정보조회
	List<MemberContent> mmContentLcServ(int mmCode);
	// 개인사원경력사항정보조회
	List<MemberContent> mmContentCrServ(int mmCode);
	
	
	
	// DB에서 정보 불러오기
	List<Achieve> acListServ(); //학력테이블
	List<License> lcListServ(); // 자격증 테이블
	List<Contract> CtListServ();// 계약 테이블
	List<Position> PtListServ();// 직급 테이블
	List<Department>  DpListServ();// 부서 테이블
	List<MajorTypeOfBusiness> maListServ(); //상위업종
	List<MinorTypeOfBusiness> miListServ(); // 하위업종
}

>>>>>>> 56ac431afa4daac461f9fdd269ce73a7c7001cfe
