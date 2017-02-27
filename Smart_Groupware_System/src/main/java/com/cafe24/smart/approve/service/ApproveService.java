package com.cafe24.smart.approve.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;

import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;

public interface ApproveService {

	//기안 등록
	int apAddServ(Draft draft, Progress progress);
	
	//진행 목록
	List<Progress> pgListServ();

	//결재 목록
	List<Progress> hvListServ();

	//임시 목록
	List<Draft> temListServ();

	//결재 승인/반려 페이지 요청
	Draft hvContServ(int dftCode);
	
	//결재 승인/반려 요청
	int apProAddServ(Draft draft, Progress progress, int dftCode);

	
}
