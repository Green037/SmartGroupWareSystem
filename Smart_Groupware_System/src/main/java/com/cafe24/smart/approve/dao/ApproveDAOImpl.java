package com.cafe24.smart.approve.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;
import com.cafe24.smart.member.domain.Department;

@Repository
public class ApproveDAOImpl implements ApproveDAO {
	
	private static final Logger log = LoggerFactory.getLogger(ApproveDAOImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// Draft insert
	@Override
	public int insertDft(Draft draft){
		System.out.println("dao dftInsert>  test");
		return sqlSession.insert("AprDAO.insertDft" ,draft);
	}
	
	// Progress insert
	@Override
	public int insertPg(Progress progress){
		System.out.println("dao proInsert>  test");
		return sqlSession.insert("AprDAO.insertPg" ,progress);
	}
	
	// Progress List
	@Override
	public List<Progress> selectAllPg(){
		System.out.println("dao pgList> test" );
		return sqlSession.selectList("AprDAO.selectAllPg");
	}
	
	//Have List
	@Override
	public List<Progress> selectAllhv(){
		System.out.println("dao hvList> test" );
		return sqlSession.selectList("AprDAO.selectAllHv");
	}

	//Tem List
	@Override
	public List<Draft> SelectAllTem() {
		System.out.println("dao temList> test");
		return sqlSession.selectList("AprDAO.selectAllTem");
	}


	
	}
