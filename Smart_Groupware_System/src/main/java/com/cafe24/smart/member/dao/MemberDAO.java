package com.cafe24.smart.member.dao;

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
import com.cafe24.smart.member.domain.MemberList;
import com.cafe24.smart.member.domain.MinorTypeOfBusiness;
import com.cafe24.smart.member.domain.Position;

public interface MemberDAO {
	// DB 에서 정보 불러오기 리스트
	List<Achieve> 						selectAc();
	List<License> 						selectLc();
	List<Contract> 						selectCt();
	List<Position> 						selectPt();
	List<Department> 					selectDp();
	List<MajorTypeOfBusiness> 			selectMa();
	List<MinorTypeOfBusiness> 			selectMi();
	
	List<MemberList>					selectAllMm(Map<String, Integer> map); // 사원 조회
	
	//DB에서 정보 불러오기 리스트 끝
	
	List<MemberContent>					selectMmcontentCr(int mmCode);// 개인사원경력사항정보조회
	List<MemberContent>					selectMmcontentlc(int mmCode);// 개인사원자격증정보조회
	MemberContent						selectMmContentMc(int mmCode);// 개인사원정보학력조회
	MemberContent						selectMmContent(int mmCode); // 개인사원기본정보조회
	Member								mmLogin(Member member); //로그인
	Member 								selectByMm(int mmCode); // 사원코드 불러오기
	
<<<<<<< HEAD
	int 								selectTotalMemberCount(); // 사원조회리스트 전체 행 수
=======
>>>>>>> 56ac431afa4daac461f9fdd269ce73a7c7001cfe
	int 								insertMm(Member member); // 사원 등록
	int 								insertMc(MemberAchieve memberAchieve); // 사원 학력 등록
	int 								insertMl(MemberLicense memberLicense); // 사원 자격증 등록
	int 								insertCr(Career career); // 사원 경력사항 등록
}