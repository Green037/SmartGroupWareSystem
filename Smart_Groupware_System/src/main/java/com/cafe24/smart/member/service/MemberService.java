package com.cafe24.smart.member.service;

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

public interface MemberService {
	
	int mmAddServ(Member member,MemberAchieve memberAchieve,MemberLicense memberLicense,Career career); 
	// 사원정보, 사원학력,경력사항,자격증 등록
	
	
	List<Achieve> acListServ();
	List<License> lcListServ();
	List<Contract> CtListServ();
	List<Position> PtListServ();
	List<Department>  DpListServ();
	List<MajorTypeOfBusiness> maListServ();
	List<MinorTypeOfBusiness> miListServ();
}

