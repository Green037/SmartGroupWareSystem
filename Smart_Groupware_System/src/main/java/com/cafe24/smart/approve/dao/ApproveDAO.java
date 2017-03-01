package com.cafe24.smart.approve.dao;

import java.util.HashMap;
import java.util.List;

import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;

public interface ApproveDAO {

	//기안 등록( draft + progress) 
	int insertDft(Draft draft);
	int insertPg(Progress progress);

	//진행 목록
	List<Draft> selectAllPg();
		
	//반려 목록
	List<Progress> selectAllRe();
	
	//완료 목록
	List<Progress> selectAllCom();
	
	//임시 목록
	List<Draft> selectAllTem();
	
	//결재 목록
	List<Progress> selectAllHv();
	
	//결재 신청 폼(draft + progress)
	Draft selectContHv(int dftCode);
	Progress selectDetailHv(int dftCode);
	
	//결재 요청 (1차 progress: 승인/반려 여부)
	int modifyPro(Progress progress);
	//결재 요청 ------ draft 업데이트
	int modifyDft(Draft draft);
	//결재 요청 (2차 : 결재자 update)
	int modifyProApv(Progress progress);
	//결재 요청 (approval COUNT)
	Draft selectCountHv(int dftCode);
	

	


	
	
}