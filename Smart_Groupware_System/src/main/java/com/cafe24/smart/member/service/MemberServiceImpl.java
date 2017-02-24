package com.cafe24.smart.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.member.dao.MemberDAO;
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

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private MemberDAO memberDao;
	
	
	//사원 등록
	@Override
	public int mmAddServ(Member member, MemberAchieve memberAchieve, MemberLicense memberLicense, Career career) {
		System.out.println("mmCode1:"+member.getMmCode());
		memberDao.insertMm(member);
		int mmCode= member.getMmCode();
		System.out.println("mmCode2:"+mmCode);
		
		memberAchieve.setmmCode(mmCode);
		memberDao.insertMc(memberAchieve);
		
		memberLicense.setmmCode(mmCode);
		memberDao.insertMl(memberLicense);
		
		career.setmmCode(mmCode);
		memberDao.insertCr(career);
		
		
		
		// 사원등록 insert시 경력사항 테이블에 여러행이 추가될수 있게 String형 배열에 담음
		String[] crDataSplit = new String(career.getCrData()).split(",");
		String[] crServiceSplit = new String(career.getCrService()).split(",");
		String[] crPastJoinDaySplit = new String(career.getCrPastJoinDay()).split(",");
		String[] crPastResignDaySplit = new String(career.getCrPastResignDay()).split(",");
		String[] crResponsibilitySplit = new String(career.getCrResponsibility()).split(",");
		//String[] 
		for(int i=0; i< crDataSplit.length; i++ ) {
			/*System.out.println(i+"번째값들");
			System.out.println(crDataSplit[i]);
			System.out.println(crServiceSplit[i]);
			System.out.println(crPastJoinDaySplit[i]);
			System.out.println(crPastResignDaySplit[i]);
			System.out.println(crResponsibilitySplit[i]);*/
		//
			Career careers = new Career();
			careers.setCrData(crDataSplit[i]);
			careers.setCrService(crServiceSplit[i]);
			careers.setCrPastJoinDay(crPastJoinDaySplit[i]);
			careers.setCrPastResignDay(crPastResignDaySplit[i]);
			careers.setCrResponsibility(crResponsibilitySplit[i]);
			//careers.setMacodes(Integer.parsInt(crResponsibilitySplit[i]));
			//for문 하나 추가
		}
		
		return 0;	
	}
	
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
	// 계약형태 조회
	public List<Contract> CtListServ() {
		List<Contract> c = memberDao.selectCt();
			System.out.println("Ct리스트 서비스까지"+c.size());
		return memberDao.selectCt();	
	}
	// 직급 조회
	public List<Position> PtListServ() {
		List<Position> d = memberDao.selectPt();
			System.out.println("Pt리스트 서비스까지"+d.size());
		return memberDao.selectPt();
		
	}
	// 부서 조회
	public List<Department>  DpListServ() {
		List<Department> e = memberDao.selectDp();
		System.out.println("Dp리스트 서비스까지"+e.size());
		return memberDao.selectDp();
		
	}
	
	//상위업종 조회
	public List<MajorTypeOfBusiness> maListServ() {
				 List<MajorTypeOfBusiness> f = memberDao.selectMa();
				 	System.out.println("Ma리스트 서비스까지"+f.size());
					
				 	return memberDao.selectMa();
			}
	//하위업종 조회
	public List<MinorTypeOfBusiness> miListServ() {
					 List<MinorTypeOfBusiness> g = memberDao.selectMi();
					 	System.out.println("Mi리스트 서비스까지"+g.size());
						
					 	return memberDao.selectMi();
				}
	
}