package com.cafe24.smart.approve.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.approve.domain.Approval;
import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;

import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.domain.Position;


@Repository
public class ApproveDAOImpl implements ApproveDAO {

	private static final Logger log = LoggerFactory.getLogger(ApproveDAOImpl.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 기안 페이지 요청 : 1-1.draft
	@Override
	public List<Document> selectAllDoc() {
		// System.out.println("dao selectAllDoc> test");
		return sqlSession.selectList("AprDAO.selectAllDoc");
	}

	// 기안 페이지 요청 : 1-2.department
	@Override
	public List<Department> selectAllApDep() {
		//System.out.println("dao selectAllApDep> test");
		return sqlSession.selectList("acDAO.selectDp");
	}
	
	// 기안 페이지 요청 : 1-3. position
	@Override
	public List<Position> selectAllApPos() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("acDAO.selectPt");
	}

		// [ajax] 기안 페이지 요청 : 1-4. 사원번호[이름] 가져오기 
		@Override
		public List<Member> selectByApMm( Map<String, Integer> map ) {
			// TODO Auto-generated method stub
			return sqlSession.selectList("AprDAO.selectContMm", map);
		}

		// [ajax] 개인별 결재선 등록
		@Override
		public int insertApr(Approval approval) {
			// TODO Auto-generated method stub
			return sqlSession.insert("AprDAO.insertApr", approval);
		}
		
		// [ajax] 개인별 결재라인 가져오기
		@Override
		public List<Approval> selectAllApr(int mmCode) {
			// TODO Auto-generated method stub
			return sqlSession.selectList("AprDAO.selectByApr", mmCode);
		}
		
		// [ajax] pk값 결재라인 가져오기
		@Override
		public List<Approval> selectbyReApr(int aprCode) {
			// TODO Auto-generated method stub
			return sqlSession.selectList("AprDAO.selectByReApr", aprCode);
		}
		

		

		
	// 기안 등록 1-1 : draft
	@Override
	public int insertDft(Draft draft) {
		// System.out.println("dao dftInsert> test");
		return sqlSession.insert("AprDAO.insertDft", draft);
	}

	// 기안 등록 1-2 : progress
	@Override
	public int insertPg(Progress progress) {
		// System.out.println("dao proInsert> test");
		return sqlSession.insert("AprDAO.insertPg", progress);
	}

	// 결재 신청 폼 : dftCode로 결재 신청 정보 가져오기
	@Override
	public Draft selectContHv(int dftCode) {
		System.out.println("dao hvCont> test");
		return sqlSession.selectOne("AprDAO.selectContHv", dftCode);
	}

	// 결재 신청 폼 : proReason/proApproval 가져오기
	@Override
	public Progress selectDetailHv(int dftCode) {
		// System.out.println("dao hvDetail> test");
		return sqlSession.selectOne("AprDAO.selectDetailHv", dftCode);
	}

	// 결재 요청 : 1단계 : progress update
	@Override
	public int modifyPro(Progress progress) {
		// System.out.println("dao proModifyPro> test");
		return sqlSession.update("AprDAO.updatePro", progress);
	}

	// 결재 요청 : 2단계 : draft update
	@Override
	public int modifyDft(Draft draft) {
		// System.out.println("dao proModifyDft> test");
		return sqlSession.update("AprDAO.updateDft", draft);
	}

	// 결재 요청 : 2단계 - 2 : progress의 pro_approval update
	@Override
	public int modifyProApv(Progress progress) {
		// System.out.println("dao proModifyProApv> test");
		return sqlSession.update("AprDAO.updateProApv", progress);
	}


	// 결재 요청 결재자 가져오기 && [상세보기] :
	@Override
	public Draft selectCountHv(int dftCode) {
		//System.out.println("dao selectCountHv> test");
		return sqlSession.selectOne("AprDAO.selectContHv", dftCode);
	}

	// 결재 요청 : 기안자 이름 가져오기
	@Override
	public String selectDetailMm(int mmCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AprDAO.selectByMm", mmCode);
	}

	// 결재 요청 : 기안자 부서 가져오기
	@Override
	public String selectDetailDp(int mmCode) {
		// TODO Auto-generated method stub
		return  sqlSession.selectOne("AprDAO.selectByDp", mmCode);
	}
	
	// 결재 요청 : 기안자 직급 가져오기
	@Override
	public String selectDetailPt(int mmCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AprDAO.selectByPt", mmCode);
	}
		//결재 요청 : 결재자 이름 가져오기
		@Override
		public String selectDetailPMn(int proApproval) {
			// TODO Auto-generated method stub	
			return sqlSession.selectOne("AprDAO.selectByPMm", proApproval);
		}
		// 결재 요청 : 결재자 부서 가져오기
		@Override
		public String selectDetailPDp(int proApproval) {
			// TODO Auto-generated method stub
			return  sqlSession.selectOne("AprDAO.selectByPDp", proApproval);
		}
		// 결재 요청 : 결재자 직급 가져오기
		@Override
		public String selectDetailPPt(int proApproval) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("AprDAO.selectByPPt", proApproval);
		}


	
	// 임시 목록
	@Override
	public List<Draft> selectAllTem(int mmCode) {
		// System.out.println("dao temList> test");
		return sqlSession.selectList("AprDAO.selectAllTem", mmCode);
	}
	// 임시 목록 [문서분류가져오기]

			@Override
			public String selectDetailDoc(int dftCode) {
				// TODO Auto-generated method stub
				return sqlSession.selectOne("AprDAO.selectByDoc", dftCode);
			}

	// 임시 [상세보기]
	@Override
	public List<Draft> selectContTem(int dftCode) {
		// System.out.println("dao temCont> test");
		return sqlSession.selectList("AprDAO.selectContHv", dftCode);
	}
	

	// ------총 결재 목록 : intro 목록
	@Override
	public List<Draft> selectAllPg(int mmCode) {
		// System.out.println("dao pgList> test" );
		return sqlSession.selectList("AprDAO.selectAllPg", mmCode);
	}

			// ----- 총 목록 : 대기/반려/완료
			@Override
			public List<Draft> selectByHv(Map<String, Integer> map) {
				// System.out.println("dao byHvList> test");
				return sqlSession.selectList("AprDAO.selectByHv", map);
			}
			
			// 결재 목록 : 결재자 결재 가능 목록
			@Override
			public String selectByApr(int mmCode) {
				// TODO Auto-generated method stub
				return sqlSession.selectOne("", mmCode);
			}

	// 문서 양식 등록
	@Override
	public int insertDoc(Document document) {
		System.out.println("dao insertDoc> test");
		return sqlSession.insert("AprDAO.insertDoc", document);
	}
	
	// 문서 양식 등록후 select
	@Override
	public List<Document> selectListByDoc(Document document) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AprDAO.selectListByDoc", document);
	}

	//문서 양식 다운로드
	@Override
	public Document selectListByDoc(int docCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AprDAO.selectListByDoc", docCode);
	}

	//개인별 결재선 정보 가져오기
	@Override
	public Map selectByPersonal(int mmCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AprDAO.selectByPersonal", mmCode);
	}

	// 결재목록 : group 검색
	@Override
	public List<Draft> selectBySearchGroup(Draft draft) {
//		System.out.println("h1");
//		System.out.println(apGroup);
		System.out.println("쿼리실행전 최종 draft입력값 확인 : "+draft);
		return sqlSession.selectList("AprDAO.selectBySearchGroup", draft);
	}

	// 문서양식 : group 검색
	@Override
	public List<Document> selectBySearchDoc(String docFileGroup) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AprDAO.selectBySearchDocGroup", docFileGroup);
	}



}


