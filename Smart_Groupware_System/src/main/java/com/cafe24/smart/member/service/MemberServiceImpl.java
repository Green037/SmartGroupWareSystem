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
	
	
	//사원 등록(사원정보,학력등록)
	@Override
	public int mmAddServ(Member member,MemberAchieve memberAchieve,MemberLicense memberLicense,Career career) {
		
		//, , , 
			//System.out.println("mmCode1:"+member.getMmCode());
		int result = memberDao.insertMm(member);
		System.out.println("맴버 정보입력 결과 확인 : "+result);
		
		int mmCode= member.getMmCode();
			System.out.println("사원정보 입력후 생성된 코드 확인 : "+mmCode);
		
		memberAchieve.setMmCode(mmCode);
		memberDao.insertMc(memberAchieve);
		
			System.out.println("사원학력입력 확인 :"+memberAchieve);
		
		//사원등록 경력사항입력시 값이 여러개일경우 값을 각각 나눌수 있게 배열을 만들어준다. 
		String[] crDataSplit = new String(career.getCrData()).split(",");
		String[] crServiceSplit = new String(career.getCrService()).split(",");
		String[] crPastJoinDaySplit = new String(career.getCrPastJoinDay()).split(",");
		String[] crPastResignDaySplit = new String(career.getCrPastResignDay()).split(",");
		String[] crResponsibilitySplit = new String(career.getCrResponsibility()).split(",");
		// 값 넘어올때 3개 왔으나 뒷 자료는 입력자료가 아님 고로 2개 입력시 뒷자료는 안씀.
		String[] crMaCodesSplit = new String(career.getMaCodes()).split(",");
		String[] crMiCodesSplit = new String(career.getMiCodes()).split(",");
		
		
		for(int i=0; i < crDataSplit.length; i++) {
			
			
			Career careerSplit = new Career();
				
			careerSplit.setCrData(crDataSplit[i]);
			careerSplit.setCrService(crServiceSplit[i]);
			careerSplit.setCrPastJoinDay(crPastJoinDaySplit[i]);
			careerSplit.setCrPastResignDay(crPastResignDaySplit[i]);
			careerSplit.setCrResponsibility(crResponsibilitySplit[i]);
			careerSplit.setMaCode(Integer.parseInt(crMaCodesSplit[i]));
			careerSplit.setMiCode(Integer.parseInt(crMiCodesSplit[i]));
			careerSplit.setMmCode(mmCode);
			// 경력 사항 입력하는 메서드 호출
			result = memberDao.insertCr(careerSplit);
				System.out.println("경력 입력 성공확인 : "+result);
			//result = memberDao.insertCr(careerSplit);
			
		}
		
		//사원등록 자격증입력시 값이 여러개일경우 값을 각각 따로 삽입될수있게 배열을 만들어준다.
		String[] mlIssueDate = new String(memberLicense.getMlIssueDate()).split(",");
		//넘어올때 뒤에 값이 하나 더붙어서 옴(자격증선택)
		String[] lcCodes = new String(memberLicense.getLcCodes()).split(",");
		
		for(int l=0; l < mlIssueDate.length; l++) {
			
			MemberLicense memberLicenseSplit = new MemberLicense();
			
			memberLicenseSplit.setMlIssueDate(mlIssueDate[l]);
			memberLicenseSplit.setLcCode(Integer.parseInt(lcCodes[l]));
			memberLicenseSplit.setMmCode(mmCode);
			
			result = memberDao.insertMl(memberLicenseSplit);
				System.out.println("자격증 입력 성공확인"+result);
		}
		
		return 0;
	}
		
		
		/*memberLicense.setMmCode(mmCode);
		memberDao.insertMl(memberLicense);*/

	
	
	//학력 조회
	public List<Achieve> acListServ() {
		 List<Achieve> a = memberDao.selectAc();
		 	//System.out.println("ac리스트 서비스까지"+a.size());
			
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
			//System.out.println("Ct리스트 서비스까지"+c.size());
		return memberDao.selectCt();	
	}
	// 직급 조회
	public List<Position> PtListServ() {
		List<Position> d = memberDao.selectPt();
			//System.out.println("Pt리스트 서비스까지"+d.size());
		return memberDao.selectPt();
		
	}
	// 부서 조회
	public List<Department>  DpListServ() {
		List<Department> e = memberDao.selectDp();
			//System.out.println("Dp리스트 서비스까지"+e.size());
		return memberDao.selectDp();
		
	}
	
	//상위업종 조회
	public List<MajorTypeOfBusiness> maListServ() {
				 List<MajorTypeOfBusiness> f = memberDao.selectMa();
				 	//System.out.println("Ma리스트 서비스까지"+f.size());
					
				 	return memberDao.selectMa();
			}
	//하위업종 조회
	public List<MinorTypeOfBusiness> miListServ() {
					 List<MinorTypeOfBusiness> g = memberDao.selectMi();
					 	//System.out.println("Mi리스트 서비스까지"+g.size());
						
					 	return memberDao.selectMi();
				}
}