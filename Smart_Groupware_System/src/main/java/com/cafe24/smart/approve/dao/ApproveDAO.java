package com.cafe24.smart.approve.dao;

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
	
	//결재 상세 [승인/반려] Form
	Draft selectContHv(int dftCode);
	
	//임시 목록
	List<Draft> SelectAllTem();
	
	
}