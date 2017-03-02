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
import com.cafe24.smart.member.domain.MemberLicense;
import com.cafe24.smart.member.domain.MinorTypeOfBusiness;
import com.cafe24.smart.member.domain.Position;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
// 	DB 에서 정보 불러오기 리스트-----------
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
	
// DB 에서 정보 불러오기 리스트-----------
	
//	select one member by member code
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

	@Override
	public int insertMc(MemberAchieve memberAchieve) {
		
	
		return sqlSession.insert("MmDAO.insertMc",memberAchieve);
	}

	@Override
	public int insertMl(MemberLicense memberLicense) {
			
		return sqlSession.insert("MmDAO.insertMl",memberLicense);
	}

	@Override
	public int insertCr(Career career) {
				
		return  sqlSession.insert("MmDAO.insertCr", career);
	}

	
}