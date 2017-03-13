package com.cafe24.smart.member.dao;

import java.util.List;
import java.util.Map;

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
import com.cafe24.smart.member.domain.MemberList;
import com.cafe24.smart.member.domain.MinorTypeOfBusiness;
import com.cafe24.smart.member.domain.Position;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
// 	------------------------------------ DB 에서 정보 불러오기 리스트-----------
	@Override
	public List<Achieve> selectAc() {
		//System.out.println("AcDao까지 확인");

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
	
//------------------------------------------------------ DB 에서 정보 불러오기 리스트---------------------------------------
	
<<<<<<< HEAD
//  사원 카운트 리스트
	@Override
	public int selectTotalMemberCount() {
		
		return sqlSession.selectOne("acDAO.selectTotalMemberCount");
	}	
	
	
// 사원 조회 리스트
	@Override
	public List<MemberList> selectAllMm(Map<String, Integer> map) {
		
		return sqlSession.selectList("acDAO.selectAllMm", map);
	}
=======

	
// 사원 조건검색 리스트
>>>>>>> 56ac431afa4daac461f9fdd269ce73a7c7001cfe
	
	
//	사원 정보 조회
	@Override
	public Member selectByMm(int mmCode) {
		
		System.out.println("MemberDAOImpl selectByMm mmCode : " + mmCode);

		Member member = sqlSession.selectOne("MmDAO.selectByMm", mmCode);
		
		System.out.println("MemberDAOImpl selectByMm member : " + member);
		
		return member;
	}
	
//  사원 등록
	@Override
	public int insertMm(Member member) {
		
		
		return sqlSession.insert("MmDAO.insertMm",member);
	}
//  사원 학력 등록
	@Override
	public int insertMc(MemberAchieve memberAchieve) {
		
	
		return sqlSession.insert("MmDAO.insertMc",memberAchieve);
	}
// 사원 자격증 등록
	@Override
	public int insertMl(MemberLicense memberLicense) {
			
		return sqlSession.insert("MmDAO.insertMl",memberLicense);
	}
// 사원 경력사항 등록
	@Override
	public int insertCr(Career career) {
				
		return  sqlSession.insert("MmDAO.insertCr", career);
	}

// 사원 로그인 
	@Override
	public Member mmLogin(Member member) {
			//System.out.println("로그인요청시 Dao에서 member 잘 넘겨 받았는지 확인 :"+member.getMmCode());
			//System.out.println("로그인요청시 Dao에서 member 잘 넘겨 받았는지 확인 :"+member.getMmPassword());
		return sqlSession.selectOne("MmDAO.mmLogin",member);
	}
	
// 개인사원정보조회
	@Override
	public MemberContent selectMmContent(int mmCode) {
			//System.out.println("쿼리실행전 사원개인정보 조회 코드값 확인 : "+mmCode);
		return sqlSession.selectOne("acDAO.selectMmContent", mmCode);
	}
//  개인사원학력조회
	@Override
	public MemberContent selectMmContentMc(int mmCode) {
			//System.out.println("쿼리실행전 사원개인정보 조회 코드값 확인 : "+mmCode);
		return sqlSession.selectOne("acDAO.selectMmContentMc", mmCode);
	}
// 개인사원자격증조회
	@Override
	public List<MemberContent> selectMmcontentlc(int mmCode) {
		//System.out.println("쿼리실행전 사원개인정보 조회 코드값 확인 : "+mmCode);
		return sqlSession.selectList("acDAO.selectMmcontentlc", mmCode);
	}

	@Override
	public List<MemberContent> selectMmcontentCr(int mmCode) {
		//System.out.println("쿼리실행전 사원개인정보 조회 코드값 확인 : "+mmCode);
		return sqlSession.selectList("acDAO.selectMmcontentCr", mmCode);
	}
	
}