package com.cafe24.smart.approve.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;
import com.cafe24.smart.member.domain.Department;

@Repository
public class ApproveDAOImpl implements ApproveDAO {
	
	private static final Logger log = LoggerFactory.getLogger(ApproveDAOImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	// 기안 페이지 요청 : draft
	@Override
	public List<Document> selectAllDoc() {
		//System.out.println("dao selectAllDoc>  test");
		return sqlSession.selectList("AprDAO.selectAllDoc");
	}
	
	// 기안 등록 1-1 : draft
	@Override
	public int insertDft(Draft draft){
		//System.out.println("dao dftInsert>  test");
		return sqlSession.insert("AprDAO.insertDft" ,draft);
	}
	
	// 기안 등록 1-2 : progress
	@Override
	public int insertPg(Progress progress){
		//System.out.println("dao proInsert>  test");
		return sqlSession.insert("AprDAO.insertPg" ,progress);
	}
	
	
	// 결재 신청 폼 : dftCode로 결재 신청 정보 가져오기
 	@Override
	public Draft selectContHv(int dftCode){
		System.out.println("dao hvCont> test");
		return sqlSession.selectOne("AprDAO.selectContHv", dftCode);
	}
	
 	// 결재 신청 폼 : proReason/proApproval 가져오기
	@Override
	public Progress selectDetailHv(int dftCode) {
		//System.out.println("dao hvDetail> test");
		return sqlSession.selectOne("AprDAO.selectDetailHv", dftCode);
	}
	

	
	// 결재 요청 : 1단계 : progress update
	@Override
	public int modifyPro(Progress progress) {
		//System.out.println("dao proModifyPro> test");
		return sqlSession.update("AprDAO.updatePro", progress);
	}
	
	// 결재 요청 : 2단계 : draft update
	@Override
	public int modifyDft(Draft draft) {
		//System.out.println("dao proModifyDft> test");
		return sqlSession.update("AprDAO.updateDft", draft);
	}

	// 결재 요청 : 2단계 - 2 : progress의 pro_approval update 
	@Override
	public int modifyProApv(Progress progress) {
		//System.out.println("dao proModifyProApv> test");
		return sqlSession.update("AprDAO.updateProApv", progress);
	}
	
/*	// 결재 요청 결재자 가져오기 && [상세보기] : 
	@Override
	public Draft selectCountHv(int dftCode) {
		System.out.println("dao proModifyProApv> test");
		return sqlSession.selectOne("AprDAO.selectContHv", dftCode);
	}
	*/
	
	// 결재 요청 결재자 가져오기 && [상세보기] : 
	@Override
	public Draft selectCountHv(int dftCode) {
		System.out.println("dao selectCountHv> test");
		return sqlSession.selectOne("AprDAO.selectContHv", dftCode);
	}

	// 임시 목록
	@Override
	public List<Draft> selectAllTem() {
		//System.out.println("dao temList> test");
		return sqlSession.selectList("AprDAO.selectAllTem");
	}
	
	// 임시 [상세보기]
	@Override
	public List<Draft> selectContTem(int dftCode) {
		//System.out.println("dao temCont> test");
		return sqlSession.selectList("AprDAO.selectContHv", dftCode);
	}
	

	//------총 결재 목록 : intro 목록 
	@Override
	public List<Draft> selectAllPg(){
		//System.out.println("dao pgList> test" );
		return sqlSession.selectList("AprDAO.selectAllPg");
	}
	
	//----- 총 목록 : 대기/반려/완료
	@Override
	public List<Draft> selectByHv(int progress) {
		//System.out.println("dao byHvList> test");
		return sqlSession.selectList("AprDAO.selectByHv", progress);
	}

	
	//문서 양식 등록
	@Override
	public int insertDoc(Document document) {
		System.out.println("dao insertDoc> test");
		return sqlSession.insert("AprDAO.insertDoc", document);
	}

	

	}
