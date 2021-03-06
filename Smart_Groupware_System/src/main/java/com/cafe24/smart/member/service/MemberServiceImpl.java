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
import com.cafe24.smart.member.domain.MinorTypeOfBusiness;
import com.cafe24.smart.member.domain.Position;

@Service
public class MemberServiceImpl implements MemberService {

	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	private MemberDAO memberDao;

	// 개인사원자격증정보조회
	@Override
	public List<MemberContent> mmContentLcServ(int mmCode) {

		log.debug("MemberServiceImpl mmContentLcServ mmCode : " + mmCode);

		return memberDao.selectMmcontentlc(mmCode);
	}

	// 개인사원경력사항정보조회
	@Override
	public List<MemberContent> mmContentCrServ(int mmCode) {

		log.debug("MemberServiceImpl mmContentCrServ mmCode : " + mmCode);

		return memberDao.selectMmcontentCr(mmCode);
	}

	// 사원조건검색
	@Override
	public List<MemberContent> mmSearchServ(MemberContent memberContent) {

		log.debug("MemberServiceImpl mmSearchServ memberContent : " + memberContent);

		return memberDao.selectMmSearch(memberContent);
	}

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

	// 특정 사원 조회
	@Override
	public Member mmContentByMmCodeServ(int mmCode) {

		return memberDao.selectByMmCode(mmCode);
	}

	// 사원 조회 리스트
	@Override
	public List<Member> mmListServ() {

		return memberDao.selectAllMm();
	}

	// 사원 로그인
	@Override
	public Map<String, Object> mmLoginServ(Member member) {

		log.debug("MemberServiceImpl mmLoginServ member : " + member);

		// 로그인을 위한 사원코드 / 성공, 실패 분기 를 담아 쓰기위해 map 생성해준다.
		Map<String, Object> resultMap = new HashMap<String, Object>();

		Member mmLoginServ = memberDao.mmLogin(member);

		log.debug("MemberServiceImpl mmLoginServ mmLoginServ : " + mmLoginServ);

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

		log.debug("MemberServiceImpl mmLoginServ resultMap : " + resultMap);

		return resultMap;
	}

	// 개인사원정보조회
	@Override
	public MemberContent mmContentServ(int mmCode) {

		log.debug("MemberServiceImpl mmContentServ mmCode : " + mmCode);

		return memberDao.selectMmContent(mmCode);
	}

	// 개인사원학력정보조회
	@Override
	public MemberContent mmContentMcServ(int mmCode) {

		log.debug("MemberServiceImpl mmContentMcServ mmCode : " + mmCode);

		return memberDao.selectMmContentMc(mmCode);
	}

	@Override
	public int mmModifyeServ(Member member) {

		log.debug("MemberServiceImpl mmModifyeServ member : " + member);

		return memberDao.updateMm(member);
	}

	// 부서조회 : 윤재호
	@Override
	public Department mmDpDetailServ(int dpCode) {

		log.debug("MemberServiceImpl mmDpDetailServ dpCode : " + dpCode);

		return memberDao.selectDpByDpCode(dpCode);
	}

	// 사원 등록(사원정보,학력등록)
	@Override
	public int mmAddServ(Member member, MemberAchieve memberAchieve, MemberLicense memberLicense, Career career) {

		int n = 0;

		log.debug("MemberServiceImpl mmAddServ member : " + member + ", memberAchieve : " + memberAchieve);
		log.debug("MemberServiceImpl mmAddServ memberLicense : " + memberLicense + ", career : " + career);

		int result = memberDao.insertMm(member);
		int mmCode = member.getMmCode();

		log.debug("MemberServiceImpl mmAddServ result : " + result);
		log.debug("MemberServiceImpl mmAddServ mmCode : " + mmCode);

		memberAchieve.setMmCode(mmCode);

		memberDao.insertMc(memberAchieve);

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

			n = 1;
		}

		log.debug("MemberServiceImpl mmAddServ final result : " + result);

		return n;
	}
}