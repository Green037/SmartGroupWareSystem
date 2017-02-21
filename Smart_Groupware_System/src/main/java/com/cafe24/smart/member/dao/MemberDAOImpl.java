package com.cafe24.smart.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.member.domain.Achieve;
import com.cafe24.smart.member.domain.License;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
//	@Override
//	public int insertMm(Member member) {
//		// TODO Auto-generated method stub
//		return sqlSession.insert("insertMm",member);
//	}

	@Override
	public List<Achieve> selectAc() {
		System.out.println("AcDao까지 확인");

		
		return sqlSession.selectList("acDAO.selectAc");
	}


	@Override
	public List<License> selectLc() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("acDAO.selectLc");
	}
}