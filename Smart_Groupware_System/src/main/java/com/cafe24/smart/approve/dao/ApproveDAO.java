package com.cafe24.smart.approve.dao;

import java.util.List;
import java.util.Map;

import com.cafe24.smart.approve.domain.Approval;
import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;
import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.domain.Position;

public interface ApproveDAO {
	
	//기안 페이지 요청[문서/부서/직급/'AJAX':결재선사원불러오기]
	List<Document> selectAllDoc();
	List<Department> selectAllApDep();
	List<Position> selectAllApPos();
		List<Member> selectByApMm( Map<String, Integer> map );
		
		//개인별 결재라인 등록
		int insertApr(Approval approval);
		//개이별 결재라인 가져오기
		List<Approval> selectAllApr(int mmCode);

	//기안 등록( draft + progress) 
	int insertDft(Draft draft);
	int insertPg(Progress progress);
		
	//결재[대기/완료/반려] 신청 폼(draft + progress)
	Draft selectContHv(int dftCode);
	Progress selectDetailHv(int dftCode);
	
	String selectDetailMm(int mmCode);
	String selectDetailDp(int mmCode);
	String selectDetailPt(int mmCode);
		String selectDetailPMn(int proApproval);
		String selectDetailPDp(int proApproval);
		String selectDetailPPt(int proApproval);

	
	//결재 요청 (1차 progress: 승인/반려 여부)
	int modifyPro(Progress progress);
	//결재 요청 (2-1차 draft 업데이트
	int modifyDft(Draft draft);
	//결재 요청 (2-2차 : 결재자 update)
	int modifyProApv(Progress progress);
	//결재 요청 (approval COUNT)
	/*Draft selectCountHv(int dftCode);*/
	Draft selectCountHv(int dftCode);
	
	//임시 목록
	List<Draft> selectAllTem();
	String selectDetailDoc(int dftCode);

	//임시 상세보기
		List<Draft> selectContTem(int dftCode);
	
	//-----총 목록 : intro 목록
	List<Draft> selectAllPg(int mmCode);
	//-----총 목록 : 대기/반려/완료
	List<Draft> selectByHv(Map<String, Integer> map);
	
	// 문서 양식 등록
	int insertDoc(Document document);
	


	
	


	

	
	
	

}