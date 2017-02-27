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
	List<Progress> selectAllPg();
	
	//결재 목록
	List<Progress> selectAllhv();
	
	//결재 신청 폼(draft + progress)
	Draft selectContHv(int dftCode);
	Progress selectDetailHv(int dftCode);
	
	//임시 목록
	List<Draft> selectAllTem();
	
	//결재 요청 (progress)
	int updatePro(Progress progress);

	
	
}