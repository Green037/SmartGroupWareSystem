package com.cafe24.smart.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);

	@Autowired
	SqlSessionTemplate sqlSession;

	// 사원 조회 리스트
	@Override
	public List<Member> selectAllMm() {

		return sqlSession.selectList("AcDAO.selectAllMm");
	}

	@Override
	public List<Achieve> selectAc() {

		return sqlSession.selectList("acDAO.selectAc");
	}

	@Override
	public List<License> selectLc() {

		return sqlSession.selectList("acDAO.selectLc");
	}

	@Override
	public List<Contract> selectCt() {

		return sqlSession.selectList("acDAO.selectCt");
	}

	@Override
	public List<Position> selectPt() {

		return sqlSession.selectList("acDAO.selectPt");
	}

	@Override
	public List<Department> selectDp() {

		return sqlSession.selectList("acDAO.selectDp");
	}

	@Override
	public List<MajorTypeOfBusiness> selectMa() {

		return sqlSession.selectList("acDAO.selectMa");
	}

	@Override
	public List<MinorTypeOfBusiness> selectMi() {

		return sqlSession.selectList("acDAO.selectMi");
	}

	// 사원 카운트 리스트
	@Override
	public int selectTotalMemberCount() {

		return sqlSession.selectOne("MmDAO.selectTotalMemberCount");
	}

	// 특정 사원 조회
	@Override
	public Member selectByMmCode(int mmCode) {

		return sqlSession.selectOne("MmDAO.selectByMm", mmCode);
	}

	// 사원 정보 조회
	@Override
	public Member selectByMm(int mmCode) {

		log.debug("MemberDAOImpl selectByMm mmCode : " + mmCode);

		return sqlSession.selectOne("MmDAO.selectByMm", mmCode);
	}

	// 사원 등록
	@Override
	public int insertMm(Member member) {

		log.debug("MemberDAOImpl insertMm member : " + member);

		return sqlSession.insert("MmDAO.insertMm", member);
	}

	// 사원 학력 등록
	@Override
	public int insertMc(MemberAchieve memberAchieve) {

		log.debug("MemberDAOImpl insertMc memberAchieve : " + memberAchieve);

		return sqlSession.insert("MmDAO.insertMc", memberAchieve);
	}

	// 사원 자격증 등록
	@Override
	public int insertMl(MemberLicense memberLicense) {

		log.debug("MemberDAOImpl insertMl memberLicense : " + memberLicense);

		return sqlSession.insert("MmDAO.insertMl", memberLicense);
	}

	// 사원 경력사항 등록
	@Override
	public int insertCr(Career career) {

		log.debug("MemberDAOImpl insertCr career : " + career);

		return sqlSession.insert("MmDAO.insertCr", career);
	}

	// 사원 로그인
	@Override
	public Member mmLogin(Member member) {

		log.debug("MemberDAOImpl mmLogin member : " + member);

		return sqlSession.selectOne("MmDAO.mmLogin", member);
	}

	// 개인사원정보조회
	@Override
	public MemberContent selectMmContent(int mmCode) {

		log.debug("MemberDAOImpl selectMmContent mmCode : " + mmCode);

		return sqlSession.selectOne("acDAO.selectMmContent", mmCode);
	}

	// 개인사원학력조회
	@Override
	public MemberContent selectMmContentMc(int mmCode) {

		log.debug("MemberDAOImpl selectMmContentMc mmCode : " + mmCode);

		return sqlSession.selectOne("acDAO.selectMmContentMc", mmCode);
	}

	// 개인사원자격증조회
	@Override
	public List<MemberContent> selectMmcontentlc(int mmCode) {

		log.debug("MemberDAOImpl selectMmcontentlc mmCode : " + mmCode);

		return sqlSession.selectList("acDAO.selectMmcontentlc", mmCode);
	}

	// 개인사원경력사항조회
	@Override
	public List<MemberContent> selectMmcontentCr(int mmCode) {

		log.debug("MemberDAOImpl selectMmcontentCr mmCode : " + mmCode);

		return sqlSession.selectList("acDAO.selectMmcontentCr", mmCode);
	}

	// 사원조건검색
	@Override
	public List<MemberContent> selectMmSearch(MemberContent memberContent) {

		log.debug("MemberDAOImpl selectMmSearch memberContent : " + memberContent);

		return sqlSession.selectList("acDAO.selectMmSearch", memberContent);
	}

	// 사원정보 수정
	@Override
	public int updateMm(Member member) {

		log.debug("MemberDAOImpl updateMm member : " + member);

		return sqlSession.update("MmDAO.updateMm", member);
	}

	// 부서명조회 : 윤재호
	@Override
	public Department selectDpByDpCode(int dpCode) {

		log.debug("MemberDAOImpl selectDpByDpCode dpCode : " + dpCode);

		return sqlSession.selectOne("acDAO.selectDpByDpCode", dpCode);
	}
}