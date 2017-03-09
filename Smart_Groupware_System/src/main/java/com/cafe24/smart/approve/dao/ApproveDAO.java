package com.cafe24.smart.approve.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;

public interface ApproveDAO {
	
	//기안 페이지 요청
	List<Document> selectAllDoc();

	//기안 등록( draft + progress) 
	int insertDft(Draft draft);
	int insertPg(Progress progress);
		
	//결재[대기/완료/반려] 신청 폼(draft + progress)
	Draft selectContHv(int dftCode);
	Progress selectDetailHv(int dftCode);
	
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
	//임시 상세보기
		List<Draft> selectContTem(int dftCode);
	
	//-----총 목록 : intro 목록
	List<Draft> selectAllPg();
	//-----총 목록 : 대기/반려/완료
	List<Draft> selectByHv(int progress);
	
	// 문서 양식 등록
	int insertDoc(Document document);

	
	

	
	
}