package com.cafe24.smart.member.dao;

import java.util.List;

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

public interface MemberDAO {
	
	int insertMm(Member member);
	int insertMc(MemberAchieve memberAchieve);
	int insertMl(MemberLicense memberLicense);
	int insertCr(Career career);
	
	
// DB 에서 정보 불러오기 리스트
	List<Achieve> selectAc();
	List<License> selectLc();
	List<Contract> selectCt();
	List<Position> selectPt();
	List<Department> selectDp();
	List<MajorTypeOfBusiness> selectMa();
	List<MinorTypeOfBusiness> selectMi();
}