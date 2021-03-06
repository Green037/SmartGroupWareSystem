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
	// 전체사원조회
	List<Member> 								mmListServ();
	List<Achieve> 								acListServ(); // 학력테이블
	List<License> 								lcListServ(); // 자격증 테이블
	List<Contract> 								ctListServ();// 계약 테이블
	List<Position> 								ptListServ();// 직급 테이블
	List<Department> 							dpListServ();// 부서 테이블
	List<MajorTypeOfBusiness> 					maListServ(); // 상위업종
	List<MinorTypeOfBusiness> 					miListServ(); // 하위업종
	// 사원조건검색
	List<MemberContent> 						mmSearchServ(MemberContent memberContent);
	// 개인사원자격증정보조회
	List<MemberContent> 						mmContentLcServ(int mmCode);
	// 개인사원경력사항정보조회
	List<MemberContent> 						mmContentCrServ(int mmCode);

	// 개인사원기본정보조회
	MemberContent 								mmContentServ(int mmCode);
	// 개인사원학력정보조회
	MemberContent 								mmContentMcServ(int mmCode);
	
	// 사원조회 리스트
	Member 										mmContentByMmCodeServ(int mmCode);
	
	// 사원부서명 조회 : 윤재호
	Department 									mmDpDetailServ(int dpCode);

	// 사원 로그인/ 사원로그인에 필요한 정보와 로그인 성공과 실패분기를 위해 map 타입으로 선언해준다
	Map<String, Object> 						mmLoginServ(Member member);

	// 사원정보, 사원학력,경력사항,자격증 등록
	int 										mmAddServ(Member member, MemberAchieve memberAchieve,
															MemberLicense memberLicense, Career career);
	// 사원정보 수정
	int 										mmModifyeServ(Member member);
}