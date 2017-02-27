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

	//전체프로젝트 목록
	@Override
	public List<Project> selectAllPr() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("PrDAO.selectAll");
	}

	//인원모집중인 프로젝트목록
	@Override
	public List<Project> selectByProgressPr(String progress) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("PrDAO.selectByProgress", progress);
	}

	// 진행,완료된 프로젝트목록 
	@Override
	public List<Project> selectByFinishPr(String progress) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("PrDAO.selectByFinish", progress);
	}

	// 프로젝트 상세보기 prCode값으로 단일행 조회.
	@Override
	public Project selectByPrCodePr(int prCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("PrDAO.selectByPrCode", prCode);
	}

	//프로젝트참여인원조회 - 해당 프로젝트별 조회
	@Override
	public List<ProjectMember> selectByPrCodePm(int prCode) {
		//System.out.println(prCode);
		return sqlSession.selectList("PrDAO.selectByPrCodePm",prCode);
	}

	@Override
	public int selectCountPm(int prCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("PrDAO.selectCountPm", prCode);
	}

	@Override
	public List<Funds> selectByPrCodeFu(int prCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("PrDAO.selectByPrCodeFu", prCode);
	}

	@Override
	public int UpdatePr(Project project) {
		// TODO Auto-generated method stub
		return sqlSession.update("PrDAO.updatePr", project);
	}

}