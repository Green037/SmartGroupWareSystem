package com.cafe24.smart.project.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;

@Repository
public class ProjectDAOImpl implements ProjectDAO {
	
	private static final Logger log = LoggerFactory.getLogger(ProjectDAOImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//프로젝트 등록
	@Override
	public int insertPr(Project project){
		// TODO Auto-generated method stub
		return sqlSession.insert("PrDAO.insertPr",project);
	}

	//세부자금등록
	@Override
	public int insertFu(Funds funds) {
		// TODO Auto-generated method stub
		return sqlSession.insert("PrDAO.insertFu",funds);
	}

	//프로젝트참여인원등록
	@Override
	public int insertPm(ProjectMember projectMember) {
		// TODO Auto-generated method stub
		return sqlSession.insert("PrDAO.insertPm",projectMember);
	}
}