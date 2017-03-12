package com.cafe24.smart.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.cafe24.smart.member.domain.MemberContent;
import com.cafe24.smart.member.domain.MemberLicense;
import com.cafe24.smart.member.domain.MemberList;
import com.cafe24.smart.member.domain.MinorTypeOfBusiness;
import com.cafe24.smart.member.domain.Position;

@Service
public class MemberServiceImpl implements MemberService {

	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	private MemberDAO memberDao;

	// ---------------------------------DB 에서 정보 조회 불러오기 리스트
	// -----------------------------------------------------

	// 학력 조회
	@Override
	public List<Achieve> acListServ() {
		
		return memberDao.selectAc();
	}

	// 자격증 조회
	@Override
	public List<License> lcListServ() {
		
		return memberDao.selectLc();
	}

	// 계약형태 조회
	@Override
	public List<Contract> ctListServ() {
		
		return memberDao.selectCt();
	}

	// 직급 조회
	@Override
	public List<Position> ptListServ() {
		
		return memberDao.selectPt();
	}

	// 부서 조회
	@Override
	public List<Department> dpListServ() {
		
		return memberDao.selectDp();
	}

	// 상위업종 조회
	@Override
	public List<MajorTypeOfBusiness> maListServ() {
		
		return memberDao.selectMa();
	}

	// 하위업종 조회
	@Override
	public List<MinorTypeOfBusiness> miListServ() {

		return memberDao.selectMi();
	}
	
	// ---------------------------------DB 에서 정보 불러오기 리스트
	// -----------------------------------------------------

//	특정 사원 조회
	@Override
	public Member mmContentServ(int mmCode) {
		
		System.out.println("MemberServiceImpl mmContentServ mmCode : " + mmCode);
		
<<<<<<< HEAD
		return memberDao.selectByMm(mmCode);
	}
	
	// 사원 조회 리스트
	@Override
	public Map<String, Object> mmListServ(int currentPage) {
		int pagePerRow = 10;
		int beginRow = (currentPage - 1) * pagePerRow;
		int totalRowCount = memberDao.selectTotalMemberCount();

		// lastPage
		int lastPage = totalRowCount / pagePerRow;
		if (totalRowCount % pagePerRow != 0) {
			lastPage++;
		}

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<MemberList> mmList = memberDao.selectAllMm(map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalRowCount", totalRowCount);
		returnMap.put("lastPage", lastPage);
		returnMap.put("mmList", mmList);
		return returnMap;
	}

	// 사원 등록(사원정보,학력등록)
=======
	//사원 조회 리스트
	
	
	//사원 등록(사원정보,학력등록)
>>>>>>> 56ac431afa4daac461f9fdd269ce73a7c7001cfe
	@Override
	public int mmAddServ(Member member, MemberAchieve memberAchieve, MemberLicense memberLicense, Career career) {
		
		// System.out.println("mmCode1:"+member.getMmCode());
		int result = memberDao.insertMm(member);
		System.out.println("맴버 정보입력 결과 확인 : " + result);

		int mmCode = member.getMmCode();
		System.out.println("사원정보 입력후 생성된 코드 확인 : " + mmCode);

		memberAchieve.setMmCode(mmCode);
		memberDao.insertMc(memberAchieve);

		System.out.println("사원학력입력 확인 :" + memberAchieve);

		// 사원등록 경력사항입력시 값이 여러개일경우 값을 각각 나눌수 있게 배열을 만들어준다.
		String[] crDataSplit = new String(career.getCrData()).split(",");
		String[] crServiceSplit = new String(career.getCrService()).split(",");
		String[] crPastJoinDaySplit = new String(career.getCrPastJoinDay()).split(",");
		String[] crPastResignDaySplit = new String(career.getCrPastResignDay()).split(",");
		String[] crResponsibilitySplit = new String(career.getCrResponsibility()).split(",");
		// 값 넘어올때 3개 왔으나 뒷 자료는 입력자료가 아님 고로 2개 입력시 뒷자료는 안씀.
		String[] crMaCodesSplit = new String(career.getMaCodes()).split(",");
		String[] crMiCodesSplit = new String(career.getMiCodes()).split(",");

		for (int i = 0; i < crDataSplit.length; i++) {

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
			System.out.println("경력 입력 성공확인 : " + result);
			// result = memberDao.insertCr(careerSplit);

		}

		// 사원등록 자격증입력시 값이 여러개일경우 값을 각각 따로 삽입될수있게 배열을 만들어준다.
		String[] mlIssueDate = new String(memberLicense.getMlIssueDate()).split(",");
		// 넘어올때 뒤에 값이 하나 더붙어서 옴(자격증선택)
		String[] lcCodes = new String(memberLicense.getLcCodes()).split(",");

		for (int l = 0; l < mlIssueDate.length; l++) {

			MemberLicense memberLicenseSplit = new MemberLicense();

			memberLicenseSplit.setMlIssueDate(mlIssueDate[l]);
			memberLicenseSplit.setLcCode(Integer.parseInt(lcCodes[l]));
			memberLicenseSplit.setMmCode(mmCode);

			result = memberDao.insertMl(memberLicenseSplit);
			System.out.println("자격증 입력 성공확인" + result);
		}

		return 0;
	}

	// 사원 로그인
	@Override
	public Map<String, Object> mmLoginServ(Member member) {

		// 로그인을 위한 사원코드 / 성공, 실패 분기 를 담아 쓰기위해 map 생성해준다.
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Member mmLoginServ = memberDao.mmLogin(member);

		// 로그인할시 사원코드가 널값이 아니고 비번이 불일치 했을때의 분기
		if (mmLoginServ != null) {
			if (mmLoginServ.getMmPassword().equals(member.getMmPassword())) {
				resultMap.put("check", "성공");
				resultMap.put("mmCode", mmLoginServ.getMmCode());
				resultMap.put("mmName", mmLoginServ.getMmName());
			} else {
				resultMap.put("check", "비번불일치");
			}
		// 아이디가 불일치 했을때의 분기	
		} else {
			resultMap.put("check", "아이디불일치");
		}
	
		System.out.println("로그인할때 입력받은 값이 있는지 확인 :" + mmLoginServ.getMmCode());
		System.out.println("로그인할때 입력받은 값이 있는지 확인 :" + mmLoginServ.getMmPassword());
		
		return resultMap;
	}

	// 개인사원정보조회
	@Override
<<<<<<< HEAD
	public MemberContent mmContentServ(MemberContent memberContent) {
		
		return memberDao.selectMmContent(memberContent);
=======
	public MemberContent mmContentServ(int mmCode) {
		//System.out.println(mmCode); 확인완료
		return memberDao.selectMmContent(mmCode);
	}
	// 개인사원학력정보조회
	@Override
	public MemberContent mmContentMcServ(int mmCode) {
			//System.out.println(mmCode); 확인완료
		return memberDao.selectMmContentMc(mmCode);
	}
	//개인사원자격증정보조회
	@Override
	public List<MemberContent> mmContentLcServ(int mmCode) {
		//System.out.println(mmCode); 확인완료
		return memberDao.selectMmcontentlc(mmCode);
	}
	//개인사원경력사항정보조회
	@Override
	public List<MemberContent> mmContentCrServ(int mmCode) {
		//System.out.println(mmCode); 확인완료
		return memberDao.selectMmcontentCr(mmCode);
>>>>>>> 56ac431afa4daac461f9fdd269ce73a7c7001cfe
	}
}