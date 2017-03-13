package com.cafe24.smart.commute.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.commute.domain.Commute;

@Repository
public class CommuteDAOImpl implements CommuteDAO {
	
	private static final Logger log = LoggerFactory.getLogger(CommuteDAO.class);
	
	@Autowired
	private SqlSession sqlSession;

	//출근등록
	@Override
	public int insertOnTimeCm(Commute commute) {
		// TODO Auto-generated method stub
		return sqlSession.insert("CmDAO.insertOnTimeCm", commute);
	}

	//현재날짜로 입력된 출근기록 카운트 확인
	@Override
	public int selectCountTodayCm(Commute commute) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CmDAO.selectCountTodayCm",commute);
	}

	//현재날짜로 입력된 출근기록 조회
	@Override
	public Commute selectOnTimeTodayCm(Commute commute) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CmDAO.selectOnTimeTodayCm", commute);
	}

	//오늘자 출근데이터에 퇴근기록 등록
	@Override
	public int updateOnTimeTodayCm(Commute commute) {
		// TODO Auto-generated method stub
		return sqlSession.update("CmDAO.updateOnTimeTodayCm", commute);
	}
	
	
}